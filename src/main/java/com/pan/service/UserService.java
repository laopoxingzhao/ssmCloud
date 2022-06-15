package com.pan.service;

import com.pan.pojo.User;

public interface UserService {
    User findUser(String username,String password);

    User findName(String username);

    Long findId(String username);

    void register(User user);

    void change(String username, String password);
}
