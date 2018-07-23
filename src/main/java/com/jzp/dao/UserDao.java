package com.jzp.dao;

import com.jzp.entity.Users;

import java.util.List;

/**
 * Created by renba on 2017/6/5.
 */


public interface UserDao {

    boolean selectAdmin(String username, String password);

    List<Users> selectuser(String username);

    boolean adduser(Users users);

    boolean deleteuser(Users users);

    boolean updateuser(Users users);
    List<Users> alluser();
}

