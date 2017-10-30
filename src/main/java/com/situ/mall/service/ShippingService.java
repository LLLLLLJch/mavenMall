package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Shipping;

public interface ShippingService {

	List<Shipping> findAllShippingByUserId(int userId);

	Boolean addShipping(int userId, Shipping shipping);

	Shipping findShippingById(Integer integer);

	boolean deleteShipping(Integer shippingId);

}
