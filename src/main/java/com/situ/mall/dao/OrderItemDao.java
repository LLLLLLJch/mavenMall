package com.situ.mall.dao;

import java.util.List;
import java.util.Map;

import com.situ.mall.pojo.OrderItem;

public interface OrderItemDao {

	List<OrderItem> findOrderItemByUserId(Integer userId);

	void addOrderItem(OrderItem orderItem);

}
