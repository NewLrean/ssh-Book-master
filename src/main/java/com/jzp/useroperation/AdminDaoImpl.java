package com.jzp.useroperation;

import com.jzp.entity.AdminLog;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


/**
 * Created by renba on 2017/6/13.
 */
@Repository
public class AdminDaoImpl implements AdminDao {
    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public void save(AdminLog adminLog) {
        System.out.println("writeUserLog" + adminLog.getUsername());
        System.out.println(adminLog.getException());
        System.out.println(adminLog.getOperation());
        System.out.println(adminLog.getTime());
        try {
            this.getCurrentSession().save(adminLog);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
