package com.pan.controller;

import com.pan.pojo.Files;
import com.pan.pojo.User;
import com.pan.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

@Controller
public class FileController {

    @Autowired
    FileService fileService;

    //展示文件列表
    @RequestMapping("/fileList")
    public ModelAndView list(Integer id, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        String file_id = request.getParameter("id");//获取文件id
        if (file_id != null) {
            List<Files> fileList = fileService.findFile(Integer.valueOf(file_id));
            modelAndView.addObject("fileList", fileList);
        } else {
            file_id = String.valueOf(id);
            List<Files> fileList = fileService.findFile(Integer.valueOf(file_id));
            modelAndView.addObject("fileList", fileList);
        }
        request.getSession().setAttribute("file_id", file_id);//把文件id传入session域中
        Integer parent = fileService.findParent(Integer.valueOf(file_id));//查找父id
        request.getSession().setAttribute("parent", parent);//把父id传入session域中

        String index = request.getParameter("index");
        if ("0".equals(index))
            modelAndView.setViewName("file_list");
        if ("1".equals(index))
            modelAndView.setViewName("shared");
        return modelAndView;
    }

    //新建文件夹
    @RequestMapping("/folder")
    public String folder(HttpSession session, String folder, HttpServletRequest request) {
        String index = request.getParameter("index");

        User user = (User) session.getAttribute("user");
        Long id = user.getId();//用户id
        String file_id = (String) request.getSession().getAttribute("file_id");//文件id
        Integer idByName = fileService.findIdByName(folder);
        if (idByName == null && !"".equals(folder)) {//判断是否存在该名字的文件夹,文件名不为空
            fileService.addFile(folder, "文件夹", null, Integer.valueOf(file_id), id, 0);
        }
        return "redirect:/fileList?id=" + file_id + "&index=" + index;
    }

    //文件删除
    @RequestMapping("/deleteFile/{file_id}/{index}")
    public String delete(@PathVariable("file_id") Integer file_id,
                         @PathVariable("index") Integer index,
                         HttpSession session) {

        Integer parent = null;
        List<Files> file = fileService.findFile(file_id);//根据父id查询子文件
        if (file.size() == 0) {//没有子文件
            parent = fileService.findParent(file_id);
            fileService.delete(file_id);
        } else {
            for (Files files : file) {//遍历
                Integer file_id_son = files.getFile_id();//获取文件id
                parent = fileService.findParent(file_id);
                delete(file_id_son, index, session);//删除子文件
            }
            fileService.delete(file_id);
        }
        if (parent == null) {
            parent = 0;
        }
        return "redirect:/fileList?id=" + parent + "&index=" + index;
    }

    //    开启，关闭文件共享
    @RequestMapping("/shared/{file_id}/{status}")
    public String shared(@PathVariable("file_id") Integer file_id,
                         @PathVariable("status") Integer status) {

        fileService.shared(file_id, status);
        Integer parent = fileService.findParent(file_id);
        return "redirect:/fileList?id=" + parent + "&index=0";
    }

    //上传
    @RequestMapping("/loadFile")
    public String upload(HttpSession session, HttpServletRequest request, MultipartFile file_name) {
        String index = request.getParameter("index");
        User user = (User) session.getAttribute("user");
        String username = user.getUsername();//上传人
        String originalFilename = file_name.getOriginalFilename();//获得上传文件名
        String type = file_name.getContentType();//文件类型
        long file_size = file_name.getSize();//文件大小
        String size = (file_size / 1024) + "KB";
        String file_id = (String) session.getAttribute("file_id");//获取文件id
        int parent;
        if (file_id != null) {
            parent = Integer.parseInt(file_id);
        } else {
            parent = Integer.parseInt(index);
        }
        Long id = user.getId();//用户id
        //存放路径
        String filePath = "D:\\java\\ssm网盘\\上传\\" + username;
        File file = new File(filePath);
        if (!file.exists())//判断文件夹是否存在
            file.mkdirs();//创建文件夹

        Integer idByName = fileService.findIdByName(originalFilename);
        if (idByName == null) {//判断文件是否存在
            //上传文件
            try {
                file_name.transferTo(new File(filePath, originalFilename));
                fileService.addFile(originalFilename, type, size, parent, id, 0);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "redirect:/fileList?id=" + file_id + "&index=" + index;
    }

    //下载
    @RequestMapping("/downLoadFile/{username}/{file_name:.+}")
    public void downLoad(HttpServletResponse response,
                         @PathVariable String username,
                         @PathVariable String file_name) {
        System.out.println(username);
        if (username == null)
            return;

        FileInputStream fileInputStream = null;
        ServletOutputStream outputStream = null;
        try {
            File file = new File("D:\\java\\ssm网盘\\上传\\" + username + "\\" + file_name);//文件的下载路径
            response.setHeader("Content-Disposition", "attachment;filename=" +
                    new String(file_name.getBytes("utf-8"), "ISO-8859-1"));//浏览器下载
            fileInputStream = new FileInputStream(file);
            outputStream = response.getOutputStream();
            byte[] bytes = new byte[1024];
            int len;
            while ((len = fileInputStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, len);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (outputStream != null)
                    outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                if (fileInputStream != null)
                    fileInputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
