package com.pan.mapper;

import com.pan.pojo.Files;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FileMapper {
    //展示文件
    List<Files> findFile(Integer parent_id);
    //删除文件
    void delete(Integer file_id);
    //数据库添加文件数据
    void addFile(@Param("file_name") String file_name,
                 @Param("file_type") String file_type,
                 @Param("file_size") String file_size,
                 @Param("parent_id") Integer parent_id,
                 @Param("file_user") Long file_user,
                 @Param("shared") Integer shared);
    //获取文件父id
    Integer findParent(Integer file_id);
    //根据文件名查询id
    Integer findIdByName(String file_name);

    void shared(@Param("file_id") Integer file_id,@Param("shared") Integer shared);

}
