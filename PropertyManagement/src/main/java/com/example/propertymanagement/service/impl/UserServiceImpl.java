package com.example.propertymanagement.service.impl;

import com.example.propertymanagement.dao.UserMapper;
import com.example.propertymanagement.domain.User;
import com.example.propertymanagement.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUserByName(String name) {
        // 调用 UserMapper 中的方法，通过用户名检索用户
        return userMapper.selectOne(new User(name, null));
    }
}
