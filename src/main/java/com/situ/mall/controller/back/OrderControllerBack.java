package com.situ.mall.controller.back;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.service.OrderService;
import com.situ.mall.service.ShippingService;
import com.situ.mall.service.UserService;
import com.sun.java.swing.plaf.motif.resources.motif;
import com.sun.org.apache.xpath.internal.operations.Mod;

@Controller
@RequestMapping("/getOrderBack")
public class OrderControllerBack {

	@Autowired
	private OrderService orderService;
	@Autowired
	private ShippingService shippingService;
	@Autowired
	private UserService userService;
	@RequestMapping("/getUserOrder")
	public String getUserOrder(Model model) {
		List<Order> list = orderService.findOrder();
		model.addAttribute("list", list);
		return "backMangerOrder";
	}
	@RequestMapping("/seeOrderDetail")
	private String seeOrderDetail(String order_no,Model model){
		System.out.println("aaaaaaaaaaaaaaaaaaa"+order_no);
		//根据订单号查询出订单
		List<OrderItem> lItems = orderService.findOrderItemByOrderNo(order_no);
		Order order = orderService.findOrderByOrderNo(order_no);
		System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbb"+order);
		Shipping shipping = shippingService.findShippingById(order.getShipping_id());
		String username = userService.findUserNameByUsrId(order.getUser_id());
		model.addAttribute("username", username);
		model.addAttribute("shipping", shipping);
		model.addAttribute("lItems", lItems);
		return "backMangerOrderDetail";
		
	}
	
}
