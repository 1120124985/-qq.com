package com.example.propertymanagement.service;

import com.example.propertymanagement.domain.Building;
import com.github.pagehelper.Page;


import java.util.List;
import java.util.Map;

public interface BuildingService {

    public List<Building> findAll();

    public Page<Building> search(Map searchMap);

    public Boolean add(Building building);

    public Building findById(Integer id);

    public Boolean update(Building building);

    public Boolean del(List<Integer> ids);
}
