package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.OrderItemDao;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.service.OrderItemService;
@Service
public class OrderItemServiceImpl implements OrderItemService{

	@Autowired
	private OrderItemDao orderItemDao;
	
	@Override
	public List<OrderItem> findOrderItemByUserId(Integer userId) {
		return orderItemDao.findOrderItemByUserId(userId);
	}

	@Override
	public void addOrderItem(OrderItem orderItem) {
		orderItemDao.addOrderItem(orderItem);
	}

}
