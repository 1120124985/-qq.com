package com.example.propertymanagement.lanjie;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthorizationInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 在请求处理之前进行拦截，检查是否已经登录或者进行其他授权验证
        // 这里可以添加您的特定逻辑，例如检查用户是否已经登录
        // 如果未登录或者未通过验证，可以重定向到登录页面或者其他自定义页面
        if (!isAuthorized(request)) {
            response.sendRedirect(request.getContextPath() + "/login.html");
            return false; // 返回 false 表示拦截请求，不再继续处理
        }
        return true; // 返回 true 表示继续进行请求处理
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        // 请求处理之后进行拦截
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 整个请求处理完成后进行拦截
    }

    private boolean isAuthorized(HttpServletRequest request) {
        // 检查用户是否已经登录或者其他授权验证逻辑
        // 这里只是一个示例，您需要根据实际情况进行修改
        // 如果用户已经登录或者通过验证，返回 true，否则返回 false
        // 在实际应用中，您可能需要从会话中获取用户信息，进行验证
            // 检查用户是否已经登录
            HttpSession session = request.getSession();
            return session.getAttribute("user") != null; // 假设用户登录后将用户信息保存在 session 中
    }
}
