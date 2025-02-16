package com.example.propertymanagement.domain;

import javax.persistence.Table;
import java.io.Serializable;

//tb_user  用户表
@Table(name = "tb_user")
public class User implements Serializable {
    private String name;
    private String password;

    public User() {
    }

    public User(String name, String password) {
        this.name = name;
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
