package com.example.propertymanagement.service.impl;

import com.example.propertymanagement.dao.CommunityMapper;
import com.example.propertymanagement.domain.Community;
import com.example.propertymanagement.service.CommunityService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.util.StringUtil;


import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    private CommunityMapper communityMapper;

    @Override
    public List<Community> findAll() {
        List<Community> communities = communityMapper.selectAll();
        return communities;
    }

    @Override
    public Page<Community> search(Map searchMap) {
        //tkMapper多条件搜索，标准写法
        Example example = new Example(Community.class);//指定查询的表tb_community
        //1.初始化分页条件
        int pageNum = 1;
        int pageSize = 2;
        if(searchMap != null){
            Example.Criteria criteria = example.createCriteria();//创建查询条件
            //时间区间
            if(StringUtil.isNotEmpty((String) searchMap.get("startTime"))){
                criteria.andGreaterThanOrEqualTo("create_time",searchMap.get("startTime"));
            }
            if(StringUtil.isNotEmpty((String) searchMap.get("endTime"))){
                criteria.andLessThanOrEqualTo("create_time",searchMap.get("endTime"));
            }
            //名称模糊搜索
            if(StringUtil.isNotEmpty((String) searchMap.get("name"))){
                criteria.andLike("name", "%"+(String) searchMap.get("name")+"%");
            }
            //分页
            /*if(StringUtil.isNotEmpty((String) searchMap.get("pageNum"))){
                pageNum = Integer.parseInt((String) searchMap.get("pageNum"));
            }
            if(StringUtil.isNotEmpty((String) searchMap.get("pageSize"))){
                pageSize = Integer.parseInt((String) searchMap.get("pageSize"));
            }*/
            if((Integer) searchMap.get("pageNum") !=null){
                pageNum = (Integer) searchMap.get("pageNum");
            }
            if((Integer) searchMap.get("pageSize") !=null){
                pageSize = (Integer) searchMap.get("pageSize");
            }
        }
        PageHelper.startPage(pageNum,pageSize);//使用PageHelper插件完成分页
        Page<Community> communities = (Page<Community>) communityMapper.selectByExample(example);
        return communities;
    }

    //新增的方法
    @Override
    public Boolean add(Community community) {
        Date time = new java.sql.Date(new java.util.Date().getTime());
        community.setCreate_time(time);
        int row = communityMapper.insert(community);
        if (row>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Community findById(Integer id) {
        return communityMapper.selectByPrimaryKey(id);
    }

    @Override
    public Boolean update(Community community) {
        int row = communityMapper.updateByPrimaryKeySelective(community);
        if (row>0){
            return true;
        }else {
            return false;
        }
    }
    @Override
    public Boolean updateStatus(String status, Integer id) {
        Community community = new Community();
        community.setId(id);
        community.setStatus(status);
        int row = communityMapper.updateByPrimaryKeySelective(community);
        if(row>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public Boolean del(List<Integer> ids) {
        for (Integer id:ids) {
            communityMapper.deleteByPrimaryKey(id);
        }
        return true;
    }
}
