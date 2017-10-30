package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Area;
import com.situ.mall.pojo.City;
import com.situ.mall.pojo.Province;

public interface ProvinceService {

	List<Province> findProvince();

	List<City> findCityByProvinceId(Integer provinceId);

	List<Area> findAreaByCityId(Integer cityId);

	String findProvinceNameById(String receiver_province);

	String findCityNameById(String receiver_city);

	String findAreaNameById(String receiver_district);

}
