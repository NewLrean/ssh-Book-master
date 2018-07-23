package com.jzp.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by renba on 2017/6/14.
 */
@Entity
public class Users {
    private String username;
    private String password;
    private int id;
    private String address;
    private String phone;
    private String mail;
    private Integer userrolesId;
    private Integer userstatesId;

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

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "address")
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Basic
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "mail")
    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    @Basic
    @Column(name = "userrolesId")
    public Integer getUserrolesId() {
        return userrolesId;
    }

    public void setUserrolesId(Integer userrolesId) {
        this.userrolesId = userrolesId;
    }

    @Basic
    @Column(name = "userstatesId")
    public Integer getUserstatesId() {
        return userstatesId;
    }

    public void setUserstatesId(Integer userstatesId) {
        this.userstatesId = userstatesId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Users users = (Users) o;

        if (id != users.id) return false;
        if (username != null ? !username.equals(users.username) : users.username != null) return false;
        if (password != null ? !password.equals(users.password) : users.password != null) return false;
        if (address != null ? !address.equals(users.address) : users.address != null) return false;
        if (phone != null ? !phone.equals(users.phone) : users.phone != null) return false;
        if (mail != null ? !mail.equals(users.mail) : users.mail != null) return false;
        if (userrolesId != null ? !userrolesId.equals(users.userrolesId) : users.userrolesId != null) return false;
        if (userstatesId != null ? !userstatesId.equals(users.userstatesId) : users.userstatesId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = username != null ? username.hashCode() : 0;
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + id;
        result = 31 * result + (address != null ? address.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (mail != null ? mail.hashCode() : 0);
        result = 31 * result + (userrolesId != null ? userrolesId.hashCode() : 0);
        result = 31 * result + (userstatesId != null ? userstatesId.hashCode() : 0);
        return result;
    }
}
