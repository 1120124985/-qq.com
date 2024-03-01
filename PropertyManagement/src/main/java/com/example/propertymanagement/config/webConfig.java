package com.example.propertymanagement.config;

import com.example.propertymanagement.lanjie.AuthorizationInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class webConfig implements WebMvcConfigurer {

    // 配置资源处理程序，将虚拟路径 /fileupload/ 映射到服务器上的绝对路径
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        System.out.println("配置文件已经生效"); // 配置文件已生效
        // 存储上传文件的绝对路径
        String path = "D:\\wuye\\PropertyManagement\\src\\main\\resources\\static\\fileupload\\";
        // 将虚拟路径 /fileupload/ 映射到服务器上的绝对路径
        registry.addResourceHandler("/fileupload/**").addResourceLocations("file:" + path);
    }

    // 配置拦截器，拦截特定路径的请求
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 添加 AuthorizationInterceptor 以拦截指定路径的请求
        registry.addInterceptor(new AuthorizationInterceptor())
                .addPathPatterns("/index.html", "/communitylist.html"); // 指定要拦截的路径
    }
}
