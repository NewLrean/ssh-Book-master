package com.jzp.entity;

import javax.persistence.*;

/**
 * Created by renba on 2017/6/13.
 */
@Entity
@Table(name = "admin_log", schema = "mybookshop", catalog = "")
public class AdminLog {
    private Integer id;
    private String username;
    private String operation;
    private String time;
    private String exception;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "operation")
    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    @Basic
    @Column(name = "time")
    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AdminLog adminLog = (AdminLog) o;

        if (id != adminLog.id) return false;
        if (username != null ? !username.equals(adminLog.username) : adminLog.username != null) return false;
        if (operation != null ? !operation.equals(adminLog.operation) : adminLog.operation != null) return false;
        if (time != null ? !time.equals(adminLog.time) : adminLog.time != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (operation != null ? operation.hashCode() : 0);
        result = 31 * result + (time != null ? time.hashCode() : 0);
        return result;
    }

    @Basic
    @Column(name = "exception")
    public String getException() {
        return exception;
    }

    public void setException(String exception) {
        this.exception = exception;
    }
}
