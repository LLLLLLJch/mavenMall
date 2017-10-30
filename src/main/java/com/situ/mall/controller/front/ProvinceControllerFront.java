package com.situ.mall.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.pojo.Area;
import com.situ.mall.pojo.City;
import com.situ.mall.pojo.Province;
import com.situ.mall.service.ProvinceService;

@Controller
@RequestMapping("/province")
public class ProvinceControllerFront {

	@Autowired
	private ProvinceService provinceService;
	
	@RequestMapping("/selectProvinces.shtml")
	@ResponseBody
	public List<Province> selectProvinces() {
		List<Province> list = provinceService.findProvince();
		for (Province province : list) {
			System.out.println("-------+++++++++"+province);
		}
		return list;
	}
	@RequestMapping("/selectCitys.shtml")
	@ResponseBody
	public List<City> selectCitys(Integer provinceId) {
		List<City> list = provinceService.findCityByProvinceId(provinceId);
		return list;
	}
	@RequestMapping("/selectAreas.shtml")
	@ResponseBody
	public List<Area> selectAreas(Integer cityId) {
		List<Area> list = provinceService.findAreaByCityId(cityId);
		return list;
	}
}
