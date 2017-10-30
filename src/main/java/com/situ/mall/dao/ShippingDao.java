package com.situ.mall.dao;

import java.util.List;
import java.util.Map;

import com.situ.mall.pojo.Shipping;

public interface ShippingDao {

	List<Shipping> findAllShippingByUserId(int userId);

	int addShipping(Map<String, Object> map);

	Shipping findShippingById(int shipping_id);

	int deleteShipping(Integer shippingId);

}
