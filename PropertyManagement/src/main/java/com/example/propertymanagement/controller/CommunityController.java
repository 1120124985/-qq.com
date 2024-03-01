package com.example.propertymanagement.controller;

import com.example.propertymanagement.common.MessageConstant;
import com.example.propertymanagement.common.PageResult;
import com.example.propertymanagement.common.Result;
import com.example.propertymanagement.common.StatusCode;
import com.example.propertymanagement.domain.Community;
import com.example.propertymanagement.service.CommunityService;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

/*
 小区管理控制层
 负责前端发送过来的请求和请求参数
 然后调用service层获取业务逻辑加工处理后的数据
 */
@RestController
@RequestMapping("/community")
public class CommunityController {

    @Autowired
    private CommunityService communityService;

    @RequestMapping("/find")
    public Result find(){
        List<Community> all = communityService.findAll();
        return new Result(false,200,"请求成功",all);
    }

    @RequestMapping("/search")
    public PageResult search(@RequestBody Map searchMap){
        Page<Community> page = communityService.search(searchMap);
        return new PageResult(true, StatusCode.OK, MessageConstant.COMMUNITY_SEARCH_SUCCESS,page.getResult(),page.getTotal());
    }

    @RequestMapping("/add")
    public Result add(@RequestBody Community community){
        Boolean add = communityService.add(community);
        return new Result(true,StatusCode.OK,MessageConstant.COMMUNITY_ADD_SUCCESS);
    }

    @RequestMapping("/findById")
    public Result findById(Integer id){
        Community community= communityService.findById(id);
        return  new Result(true,StatusCode.OK,MessageConstant.COMMUNITY_FIND_BY_ID_SUCCESS,community);
    }

    @RequestMapping("/update")
    public Result update(@RequestBody Community community){
        Boolean update = communityService.update(community);
        return new Result(true,StatusCode.OK,MessageConstant.COMMUNITY_UPDATE_SUCCESS);
    }
    // /community/updateStatus/0/1
    @RequestMapping("/updateStatus/{status}/{id}")
    public Result updateStatus(@PathVariable("status") String status, @PathVariable("id") Integer id){
        Boolean flag = communityService.updateStatus(status,id);
        return new Result(true,StatusCode.OK,MessageConstant.COMMUNITY_UPDATE_STATUS_SUCCESS);
    }
    @RequestMapping("/del")
    public Result del(@RequestBody List<Integer> ids){
        Boolean flag = communityService.del(ids);
        return new Result(true,StatusCode.OK,MessageConstant.COMMUNITY_DELETE_SUCCESS);
    }
}


