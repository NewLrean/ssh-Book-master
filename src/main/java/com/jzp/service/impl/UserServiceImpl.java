package com.jzp.service.impl;

import com.jzp.dao.UserDao;
import com.jzp.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import com.jzp.entity.Users;

/**
 * Created by renba on 2017/6/5.
 */
@Service
public class UserServiceImpl implements UserInfoService {
    @Autowired
    private UserDao userDao;


    @Override
    public boolean selectAdmin(String username, String password) {
        return userDao.selectAdmin(username, password);
    }

    @Override
    public List<Users> selectuser(String username) {
        return userDao.selectuser(username);
    }

    @Override
    public boolean adduser(Users users) {
        return userDao.adduser(users);
    }

    @Override
    public boolean deleteuser(Users users) {
        return userDao.deleteuser(users);
    }

    @Override
    public boolean updateuser(Users users) {
        return userDao.updateuser(users);
    }

    @Override
    public List<Users> alluser() {
        return userDao.alluser();
    }


}
