package com.jzp.service;

import java.util.List;

import com.jzp.entity.Users;
/**
 * 创建时间：2015-2-13 下午1:00:51
 *
 * @author andy
 * @version 2.2
 *          描述：
 */

public interface UserInfoService {

    boolean selectAdmin(String username, String password);

    List<Users> selectuser(String username);

    boolean adduser(Users users);

    boolean deleteuser(Users users);

    boolean updateuser(Users users);
    List<Users> alluser();
}
