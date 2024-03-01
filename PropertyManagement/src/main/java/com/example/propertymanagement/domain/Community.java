package com.example.propertymanagement.domain;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

/*
 小区实体类（具体可以参考 小区表 tb_community）
 */
@Table(name = "tb_community")
public class Community implements Serializable {

    @Id
     private Integer id;

     private String code;
     private String name;
     private String address;
     private Double area;
     private Integer totalBuildings;
     private Integer totalHouseholds;
     private Integer greeningRate;
     private String thumbnail;
     private String developer;
     private String estateCompany;
     private Date create_time;
     private Date update_time;
     private String status;

     //getter/setter生成

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Integer getTotalBuildings() {
        return totalBuildings;
    }

    public void setTotalBuildings(Integer totalBuildings) {
        this.totalBuildings = totalBuildings;
    }

    public Integer getTotalHouseholds() {
        return totalHouseholds;
    }

    public void setTotalHouseholds(Integer totalHouseholds) {
        this.totalHouseholds = totalHouseholds;
    }

    public Integer getGreeningRate() {
        return greeningRate;
    }

    public void setGreeningRate(Integer greeningRate) {
        this.greeningRate = greeningRate;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getDeveloper() {
        return developer;
    }

    public void setDeveloper(String developer) {
        this.developer = developer;
    }

    public String getEstateCompany() {
        return estateCompany;
    }

    public void setEstateCompany(String estateCompany) {
        this.estateCompany = estateCompany;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    public Date getUpdate_time() {
        return update_time;
    }

    public void setUpdate_time(Date update_time) {
        this.update_time = update_time;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
