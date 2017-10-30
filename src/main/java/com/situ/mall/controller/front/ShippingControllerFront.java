package com.situ.mall.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.pojo.Shipping;
import com.situ.mall.service.ProvinceService;
import com.situ.mall.service.ShippingService;
import com.situ.mall.service.UserService;

@Controller
@RequestMapping("/getShipping")
public class ShippingControllerFront {

	@Autowired
	private ShippingService shippingService;
	@Autowired
	private UserService userService;
	@Autowired
	private ProvinceService provinceService;
	
	@RequestMapping("/addShipping.shtml")
	@ResponseBody
	public Boolean addShipping(String username,Shipping shipping) {
		System.out.println("1111111111111111111111113"+username);
		System.out.println("222222222222222222222222"+shipping);
		int userId = userService.findUserIdByUserName(username);
		String province = provinceService.findProvinceNameById(shipping.getReceiver_province());
		String city = provinceService.findCityNameById(shipping.getReceiver_city());
		String area = provinceService.findAreaNameById(shipping.getReceiver_district());
		shipping.setReceiver_province(province);
		shipping.setReceiver_city(city);
		shipping.setReceiver_district(area);
		Boolean isSuccess = shippingService.addShipping(userId,shipping);
		return isSuccess;
	}
	@RequestMapping("/deleteShipping.shtml")
	@ResponseBody
	public Boolean deleteShipping(Integer shippingId) {
		boolean isSuccess = shippingService.deleteShipping(shippingId);
		return isSuccess;
	}
	
}
