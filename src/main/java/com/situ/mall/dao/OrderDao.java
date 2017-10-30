package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.sun.org.glassfish.gmbal.ParameterNames;

public interface OrderDao {

	Order findOrderByUserId(Integer userId);

	void addOrder(Order order);

	List<Order> findAllOrderByUserId(@Param(value="userId")int userId, @Param(value="index")int index);

	List<String> findOrderNo(int userId);

	List<OrderItem> findOrderItemByOrderNo(String orderId);

	List<OrderItem> findAllOrder();

	Order findOrderByOrderNo(String order_no);

	List<Order> findOrder();

	int findAllOrderCount();

	List<Order> findLength(int userId);

}
