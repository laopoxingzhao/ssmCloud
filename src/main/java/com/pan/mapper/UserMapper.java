package com.pan.mapper;

import com.pan.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserMapper {

    //登录
    @Select("select * from user where username=#{username} and password=#{password}")
    User findUser(@Param("username") String username, @Param("password") String password);

    //根据用户名查询用户
    @Select("select * from user where username=#{username}")
    User findName(String username);

    //根据用户名查询id
    @Select("select id from user where username=#{username}")
    Long findId(String username);

    //注册
    @Insert("insert into user values(null,#{username},#{password},#{email},#{phoneNum})")
    void register(User user);

    //修改密码
    @Update("update user set password=#{password} where username=#{username}")
    void change(@Param("username") String username,@Param("password") String password);
}
