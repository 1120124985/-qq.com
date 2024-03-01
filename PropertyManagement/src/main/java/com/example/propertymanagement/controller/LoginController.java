package com.example.propertymanagement.controller;

import com.example.propertymanagement.domain.User;
import com.example.propertymanagement.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @PostMapping("/LoginServlet")
    public void doPost(@RequestParam("username") String username,
                       @RequestParam("password") String password,
                       HttpServletRequest request,
                       HttpServletResponse response) throws IOException {

        // 在这里通过 UserService 从数据库中获取用户信息
        User user = userService.getUserByName(username);
        // 进行用户名和密码的验证逻辑
        if (user != null && user.getPassword().equals(password)) {
            // 用户验证成功，将用户信息保存到 session 中
            HttpSession session = request.getSession();
            session.setAttribute("user", user.getName());
            response.sendRedirect("index.html");
        } else {
            response.sendRedirect("login.html?error=1");
        }
    }

    @GetMapping("/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 获取当前会话，并使其失效
        HttpSession session = request.getSession(false);
        if (session != null) {
            // 从会话中删除用户信息
            session.removeAttribute("user");
            session.invalidate();
        }
        // 重定向到登录页面或其他适当的页面
        response.sendRedirect("http://localhost:8899/login.html");
    }
}
