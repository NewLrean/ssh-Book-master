package com.jzp.useroperation;

import com.jzp.entity.AdminLog;

/**
 * Created by renba on 2017/6/5.
 */

public interface AdminDao {
  void  save(AdminLog adminLog);
}