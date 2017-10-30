package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;

public interface OrderService {

	Order findOrderByUserId(Integer userId);

	void addOrder(Order order);

	List<Order> findAllOrderByUserId(int userId, int pageIndex);

	List<String> findOrderNo(int userId);

	List<OrderItem> findOrderItemByOrderNo(String orderId);

	List<OrderItem> findAllOrder();

	Order findOrderByOrderNo(String order_no);

	List<Order> findOrder();

	int findAllOrderCount();

	List<Order> findLength(int userId);

}
