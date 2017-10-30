package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.ProvinceDao;
import com.situ.mall.pojo.Area;
import com.situ.mall.pojo.City;
import com.situ.mall.pojo.Province;
import com.situ.mall.service.ProvinceService;
@Service
public class ProvinceServiceImpl implements ProvinceService{

	@Autowired
	private ProvinceDao provinceDao;

	@Override
	public List<Province> findProvince() {
		return provinceDao.findProvince();
	}

	@Override
	public List<City> findCityByProvinceId(Integer provinceId) {
		return provinceDao.findCityByProvinceId(provinceId);
	}

	@Override
	public List<Area> findAreaByCityId(Integer cityId) {
		return provinceDao.findAreaByCityId(cityId);
	}

	@Override
	public String findProvinceNameById(String receiver_province) {
		return provinceDao.findProvinceNameById(receiver_province);
	}

	@Override
	public String findCityNameById(String receiver_city) {
		return provinceDao.findCityNameById(receiver_city);
	}

	@Override
	public String findAreaNameById(String receiver_district) {
		return provinceDao.findAreaNameById(receiver_district);
	}
}
