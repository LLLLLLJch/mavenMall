package com.situ.mall.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.ShippingDao;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.service.ShippingService;
@Service
public class ShippingServiceImpl implements ShippingService{
	@Autowired
	private ShippingDao shippingDao;

	@Override
	public List<Shipping> findAllShippingByUserId(int userId) {
		return shippingDao.findAllShippingByUserId(userId);
	}

	@Override
	public Boolean addShipping(int userId, Shipping shipping) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		map.put("shipping", shipping);
		return shippingDao.addShipping(map)>0;
	}

	@Override
	public Shipping findShippingById(Integer shipping_id) {
		return shippingDao.findShippingById(shipping_id);
	}

	@Override
	public boolean deleteShipping(Integer shippingId) {
		return shippingDao.deleteShipping(shippingId)>0;
	}
}
