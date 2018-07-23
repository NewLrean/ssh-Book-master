package com.jzp.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by renba on 2017/6/13.
 */
@Entity
public class Admin {
    private int id;
    private String username;
    private String password;
    private String userimg;
    private String phonenumber;
    private String sex;
    private String lasttime;
    private String loginsize;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
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
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "userimg")
    public String getUserimg() {
        return userimg;
    }

    public void setUserimg(String userimg) {
        this.userimg = userimg;
    }

    @Basic
    @Column(name = "phonenumber")
    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    @Basic
    @Column(name = "sex")
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Basic
    @Column(name = "lasttime")
    public String getLasttime() {
        return lasttime;
    }

    public void setLasttime(String lasttime) {
        this.lasttime = lasttime;
    }

    @Basic
    @Column(name = "loginsize")
    public String getLoginsize() {
        return loginsize;
    }

    public void setLoginsize(String loginsize) {
        this.loginsize = loginsize;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Admin admin = (Admin) o;

        if (id != admin.id) return false;
        if (username != null ? !username.equals(admin.username) : admin.username != null) return false;
        if (password != null ? !password.equals(admin.password) : admin.password != null) return false;
        if (userimg != null ? !userimg.equals(admin.userimg) : admin.userimg != null) return false;
        if (phonenumber != null ? !phonenumber.equals(admin.phonenumber) : admin.phonenumber != null) return false;
        if (sex != null ? !sex.equals(admin.sex) : admin.sex != null) return false;
        if (lasttime != null ? !lasttime.equals(admin.lasttime) : admin.lasttime != null) return false;
        if (loginsize != null ? !loginsize.equals(admin.loginsize) : admin.loginsize != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (userimg != null ? userimg.hashCode() : 0);
        result = 31 * result + (phonenumber != null ? phonenumber.hashCode() : 0);
        result = 31 * result + (sex != null ? sex.hashCode() : 0);
        result = 31 * result + (lasttime != null ? lasttime.hashCode() : 0);
        result = 31 * result + (loginsize != null ? loginsize.hashCode() : 0);
        return result;
    }
}
