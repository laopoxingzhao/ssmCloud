package com.pan.controller;

import com.pan.pojo.User;
import com.pan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    //退出登录
    @RequestMapping("/exits")
    public String exits(HttpSession session) {
        session.invalidate();//使session失效
        return "#";
    }

    //修改密码
    @RequestMapping("/change")
    public String changePassword(HttpSession session, HttpServletRequest request) {
        User user = (User) session.getAttribute("user");
        String oldUsername = request.getParameter("oldUsername");
        String username = user.getUsername();
        String oldPassword = request.getParameter("oldPassword");
        String password = user.getPassword();
        String newPassword = request.getParameter("newPassword");
        String surePassword = request.getParameter("surePassword");

        if (!username.equals(oldUsername)) {
            session.setAttribute("name_error", "用户名不正确");
            System.out.println(username);
            System.out.println(oldUsername);
            System.out.println(1);
            return "redirect:change.jsp";
        } else {
            if (!password.equals(oldPassword)) {
                session.setAttribute("password_error", "旧密码不正确");
                System.out.println(2);
                return "redirect:change.jsp";
            } else {
                if (oldPassword.equals(newPassword)) {
                    session.setAttribute("old_new", "新密码不能与旧密码相同");
                    System.out.println(3);
                    return "redirect:change.jsp";
                } else {
                    if (!newPassword.equals(surePassword)) {
                        session.setAttribute("new_sure", "两次密码不一致");
                        System.out.println(4);
                        return "redirect:change.jsp";
                    } else {
                        userService.change(username, newPassword);
                        System.out.println(5);
                        return "redirect:change.jsp";
                    }
                }
            }
        }
    }

    //个人信息
    @RequestMapping("/personal")
    private String personal() {
        return "personal";
    }

    //登录
    @RequestMapping("/login")
    private String login(String username,
                         String password,
                         HttpSession session,
                         HttpServletRequest request,
                         HttpServletResponse response) {

        User user = userService.findUser(username, password);//获取用户
        String remember = request.getParameter("remember");//获取复选框

        if (user != null) {
            if (remember != null) {//是否记住密码

                Cookie cookieUsername = new Cookie("username", username);//创建cookie对象
                Cookie cookiePassword = new Cookie("password", password);

                cookieUsername.setMaxAge(60);//帐号密码保存时间
                cookiePassword.setMaxAge(60);

                response.addCookie(cookieUsername);//发送到cookie
                response.addCookie(cookiePassword);
            }
            session.setAttribute("user", user);
            return "redirect:/index.jsp";
        } else {
            session.setAttribute("error", "帐号或密码错误");
            return "redirect:/login.jsp";
        }
    }

    //注册
    @RequestMapping("/register")
    public String register(User user, HttpSession session, HttpServletRequest request) {
        User user_name = userService.findName(user.getUsername());

        String checkCode = request.getParameter("checkCode");
        String checkCode_server = (String) session.getAttribute("checkCode_Server");//自动生成的验证码

        if (user_name != null) {
            session.setAttribute("name_error", "用户名已存在");
            return "redirect:register.jsp";//重新注册
        } else {
            if (checkCode.equalsIgnoreCase(checkCode_server)) {//验证码是否正确
                userService.register(user);//注册
                return "redirect:login.jsp";
            } else {
                session.setAttribute("checkCode_error", "验证码错误");
                return "redirect:register.jsp";
            }
        }
    }
}
