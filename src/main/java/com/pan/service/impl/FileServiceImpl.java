package com.pan.service.impl;

import com.pan.mapper.FileMapper;
import com.pan.pojo.Files;
import com.pan.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class FileServiceImpl implements FileService {
    @Autowired
    FileMapper fileMapper;

    public List<Files> findFile(Integer parent_id) {
        return fileMapper.findFile(parent_id);
    }

    @Override
    public void delete(Integer file_id) {
        fileMapper.delete(file_id);
    }

    @Override
    public void addFile(String file_name,
                        String file_type,
                        String file_size,
                        Integer parent_id,
                        Long file_user,
                        Integer shared) {
        fileMapper.addFile(file_name, file_type, file_size, parent_id, file_user, shared);
    }

    @Override
    public Integer findParent(Integer file_id) {
        return fileMapper.findParent(file_id);
    }

    @Override
    public Integer findIdByName(String file_name) {
        Integer idByName = fileMapper.findIdByName(file_name);
        return idByName;
    }

    @Override
    public void shared(Integer file_id, Integer shared) {
        fileMapper.shared(file_id, shared);
    }

}
