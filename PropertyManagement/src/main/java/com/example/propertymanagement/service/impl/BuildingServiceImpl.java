package com.example.propertymanagement.service.impl;

import com.example.propertymanagement.dao.BuildingMapper;
import com.example.propertymanagement.domain.Building;
import com.example.propertymanagement.service.BuildingService;
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
public class BuildingServiceImpl implements BuildingService {

    @Autowired
    private BuildingMapper buildingMapper;

    @Override
    public List<Building> findAll() {
        List<Building> buildings = buildingMapper.selectAll();
        return buildings;
    }

    @Override
    public Page<Building> search(Map searchMap) {
        //通用Mapper多条件搜索，标准写法
        Example example = new Example(Building.class);//指定查询的表tb_community
        //1.初始化分页条件
        int pageNum = 1;
        int pageSize = 2;
        if(searchMap != null){
            Example.Criteria criteria = example.createCriteria();//创建查询条件
            //时间区间
            if(StringUtil.isNotEmpty((String) searchMap.get("startTime"))){
                criteria.andGreaterThanOrEqualTo("createTime",searchMap.get("startTime"));
            }
            if(StringUtil.isNotEmpty((String) searchMap.get("endTime"))){
                criteria.andLessThanOrEqualTo("createTime",searchMap.get("endTime"));
                criteria.andLessThanOrEqualTo("createTime",searchMap.get("endTime"));
            }
            //名称模糊搜索
            if(StringUtil.isNotEmpty((String) searchMap.get("community_id"))){
                criteria.andLike("community_id", (String) searchMap.get("community_id"));
            }
            if((Integer) searchMap.get("pageNum") !=null){
                pageNum = (Integer) searchMap.get("pageNum");
            }
            if((Integer) searchMap.get("pageSize") !=null){
                pageSize = (Integer) searchMap.get("pageSize");
            }
        }
        PageHelper.startPage(pageNum,pageSize);//使用PageHelper插件完成分页
        Page<Building> buildings = (Page<Building>) buildingMapper.selectByExample(example);
        return buildings;
    }

    @Override
    public Boolean add(Building building) {
        Date time = new java.sql.Date(new java.util.Date().getTime());
        building.setCreate_time(time);
        int row = buildingMapper.insert(building);
        if(row>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public Building findById(Integer id) {
        return buildingMapper.selectByPrimaryKey(id);
    }

    @Override
    public Boolean update(Building building) {
        int row = buildingMapper.updateByPrimaryKeySelective(building);
        if(row>0){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public Boolean del(List<Integer> ids) {
        for (Integer id:ids) {
            buildingMapper.deleteByPrimaryKey(id);
        }
        return true;
    }

}
