package com.example.propertymanagement.dao;


import com.example.propertymanagement.domain.Building;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

@Repository
public interface BuildingMapper extends Mapper<Building> {
}
