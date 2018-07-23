package com.jzp.useroperation;

import com.jzp.entity.AdminLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by renba on 2017/6/13.
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminDao adminDao;

    @Override
    public void save(AdminLog adminLog) {
        adminDao.save(adminLog);
    }
}
