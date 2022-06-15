package com.pan.service.impl;

import com.pan.mapper.UserMapper;
import com.pan.pojo.User;
import com.pan.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User findUser(String username, String password) {
        User user = userMapper.findUser(username, password);
        return user;
    }

    public User findName(String username) {
        User user = userMapper.findName(username);
        return user;
    }

    @Override
    public Long findId(String username) {
        return userMapper.findId(username);
    }

    @Override
    public void register(User user) {
        userMapper.register(user);
    }

    @Override
    public void change(String username, String password) {
        userMapper.change(username, password);
    }
}
