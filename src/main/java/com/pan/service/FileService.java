package com.pan.service;

import com.pan.pojo.Files;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FileService {
    List<Files> findFile(Integer parent_id);

    void delete(Integer file_id);

    void addFile(String file_name,
                 String file_type,
                 String file_size,
                 Integer parent_if,
                 Long file_user,
                 Integer shared);

    Integer findParent(Integer file_id);

    Integer findIdByName(String file_name);

    void shared(@Param("file_id") Integer file_id, @Param("shared") Integer shared);


}
