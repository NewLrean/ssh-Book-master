package com.jzp.dao.impl;

import com.jzp.dao.UserDao;

import com.jzp.entity.Admin;
import org.apache.log4j.Logger;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

import com.jzp.entity.Users;

/**
 * Created by renba on 2017/6/5.
 */
@Repository
public class UserDaoImpl implements UserDao {
    private static final Logger LOGGER = Logger.getLogger(UserDaoImpl.class);
    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public boolean selectAdmin(String username, String password) {
        LOGGER.info(username);
        LOGGER.info(password);
        Criteria criteria = this.getCurrentSession().createCriteria(Admin.class);
        criteria.add(Restrictions.eq("username", username));
        criteria.add(Restrictions.eq("password", password));
        List<Admin> admin = criteria.list();
        LOGGER.info(admin.size());
        if (admin.size() != 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public List<Users> selectuser(String username) {
        Criteria criteria = this.getCurrentSession().createCriteria(Users.class);
        criteria.add(Restrictions.like("username", "%" + username + "%"));
        return criteria.list();
    }

    @Override
    public boolean adduser(Users users) {
        boolean flag;
        try {
            this.getCurrentSession().save(users);
            flag = true;
        } catch (Exception e) {
            return false;
        }
        return flag;

    }

    @Override
    public boolean deleteuser(Users users) {
        boolean flag;
        try {
            this.getCurrentSession().delete(users);
            flag = true;
        } catch (Exception e) {
            return false;
        }
        return flag;
    }

    @Override
    public boolean updateuser(Users users) {
        boolean flag;
        try {
            this.getCurrentSession().update(users);
            flag = true;
        } catch (Exception e) {
            return false;
        }
        return flag;
    }

    @Override
    public List<Users> alluser() {
        Query query = this.getCurrentSession().createQuery("from Users");
        return query.list();
    }


}
