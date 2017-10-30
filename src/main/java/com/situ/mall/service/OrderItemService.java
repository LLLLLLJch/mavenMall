package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.OrderItem;

public interface OrderItemService {

	List<OrderItem> findOrderItemByUserId(Integer userId);

	void addOrderItem(OrderItem orderItem);

}
