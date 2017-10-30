package com.situ.mall.controller.front;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Cart;
import com.situ.mall.pojo.Order;
import com.situ.mall.pojo.OrderItem;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.Shipping;
import com.situ.mall.service.CartService;
import com.situ.mall.service.OrderItemService;
import com.situ.mall.service.OrderService;
import com.situ.mall.service.ProductMangerService;
import com.situ.mall.service.ShippingService;
import com.situ.mall.service.UserService;
import com.situ.mall.vo.BuyCartVO;
import com.situ.mall.vo.CartItemVO;

@Controller
@RequestMapping("/getOrder")
public class OrderControllerFront {
	@Autowired
	private ProductMangerService productMangerService;
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderItemService orderItemService;
	@Autowired
	private ShippingService shippingService;

	@RequestMapping("/goOrderHaveUserName.shtml")
	public String goOrderHaveUserName(int [] selectIds,String username,Model model) {
		int userId = userService.findUserIdByUserName(username);
		List<OrderItem> listOrderItem = new ArrayList<OrderItem>();
		double totalPrice = 0.0;
		Order order = new Order();
		for (int id : selectIds) {
			OrderItem orderItem = new OrderItem();
			Cart cart = cartService.findCheckedCartById(id);
			Product product = productMangerService.findProductByIdAddCart(cart.getProduct_id());
			product.setQuantity(cart.getQuantity());
			totalPrice += cart.getQuantity() * product.getPrice();
			System.out.println("++++++++++++++++++"+totalPrice);
			orderItem.setProduct(product);
			listOrderItem.add(orderItem);
			
		}
		System.out.println("username :" + username);
		List<Shipping> listShipping = shippingService.findAllShippingByUserId(userId);
		order.setOrderItemList(listOrderItem);
		order.setPayment(totalPrice);
		model.addAttribute("listShipping", listShipping);
		model.addAttribute("order", order);
		return "pay";
	}
	
	
	@RequestMapping("/goOrder.shtml")
	public String goOrder(int[] selectIds, String username, Model model, HttpServletRequest request) {
		Integer selectedId = 0;
		// 获取userId
		int userId = userService.findUserIdByUserName(username);
		// springmvc
		ObjectMapper objectMapper = new ObjectMapper();
		// 只有对象里面不是null的才转换
		objectMapper.setSerializationInclusion(Inclusion.NON_NULL);

		BuyCartVO buyCartVO = null;
		Cookie[] cookies = request.getCookies();
		// 1.如果cookie有这个购物车对象，那就从cookie里面取出这个购物车对象
		if (null != cookies && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if ("buy_cart_cookie".equals(cookie.getName())) {
					// 之前已经有购物车
					String value = cookie.getValue();
					try {
						buyCartVO = objectMapper.readValue(value, BuyCartVO.class);
						System.out.println("----------------------" + buyCartVO);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}

		List<OrderItem> listOrderItem = new ArrayList<OrderItem>();
		List<CartItemVO> list = buyCartVO.getItems();
		Order order = new Order();
		double payment = 0;
		List<Cart> existCart = cartService.findCartByUserId(userId);
		for (CartItemVO item : list) {
			for (int id : selectIds) {
				OrderItem orderItem = new OrderItem();
				System.out.println("-----------------------" + id);
				if (id == item.getProduct().getId()) {
					System.out.println(id);
					Product product = productMangerService.findProductByIdAddCart(id);
					product.setQuantity(item.getQuantity());
					payment += product.getPrice() * item.getQuantity();
					orderItem.setProduct(product);
					listOrderItem.add(orderItem);

				}
			}

		}

		// 查询已经存在的shipping内容
		List<Shipping> listShipping = shippingService.findAllShippingByUserId(userId);

		order.setOrderItemList(listOrderItem);
		order.setPayment(payment);
		model.addAttribute("listShipping", listShipping);
		model.addAttribute("order", order);

		return "pay";
	}

	@RequestMapping("/putInOrder.shtml")
	public String putInOrder(Integer shipping_id,String username, Order order, Integer[] productIds,
			HttpServletRequest request,HttpServletResponse response,Model model) {
		System.out.println("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"+shipping_id);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddhhmmssSSS");
		Date date = new Date();
		order.setOrder_no(simpleDateFormat.format(date));
		int userId = userService.findUserIdByUserName(username);
		order.setUser_id(userId);
		orderService.addOrder(order);

		// springmvc 
		ObjectMapper objectMapper = new ObjectMapper();
		// 只有对象里面不是null的才转换
		objectMapper.setSerializationInclusion(Inclusion.NON_NULL);

		BuyCartVO buyCartVO = null;
		Cookie[] cookies = request.getCookies();
		// 1.如果cookie有这个购物车对象，那就从cookie里面取出这个购物车对象
		if (null != cookies && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if ("buy_cart_cookie".equals(cookie.getName())) {
					// 之前已经有购物车
					String value = cookie.getValue();
					try {
						buyCartVO = objectMapper.readValue(value, BuyCartVO.class);

					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		List<Cart> lCarts = cartService.findCartAndProductByUserId(userId);
		for (Cart item : lCarts) {
			for (int id : productIds) {
				OrderItem orderItem = new OrderItem();
				if (id == item.getProduct().getId()) {
					System.out.println(id);
					Product product = productMangerService.findProductByIdAddCart(id);
					product.setQuantity(item.getQuantity());
					orderItem.setUser_id(userId);
					orderItem.setOrder_no(simpleDateFormat.format(date));
					orderItem.setProduct(product);
					orderItem.setQuantity(item.getQuantity());
					orderItem.setTotal_price(item.getQuantity() * product.getPrice());
					System.out.println("5555555555555555555" + orderItem.getTotal_price());
					orderItemService.addOrderItem(orderItem);
					model.addAttribute("orderItem", orderItem);

				}
			}

		}
		
		Shipping shipping = shippingService.findShippingById(shipping_id);
		
		// 4.生成订单后要清楚cookie
		Cookie cookie = new Cookie("buy_cart_cookie", null);
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		//生成订单后清楚数据库里面对应的商品
		for (Integer id : productIds) {
			cartService.deleteBuyedProduct(id,userId);
		}
		model.addAttribute("shipping", shipping);
		return "success";

	}
	@RequestMapping("/gotoUserOrder.shtml")
	//好像有点问题，需要修改
	public String gotoUserOrder(String username,Model model,String pageIndexStr) {
		int pageIndex = 1;
		if(null != pageIndexStr && !pageIndexStr.equals("")){
			pageIndex = Integer.parseInt(pageIndexStr);
		}
		int userId = userService.findUserIdByUserName(username);
		List<Order> listOrderLength = orderService.findLength(userId);
		List<Order> listOrder = orderService.findAllOrderByUserId(userId,pageIndex);
		List<OrderItem> listOrderItem = orderItemService.findOrderItemByUserId(userId);
		int length = 0;
		if(listOrderLength.size()%3 == 0){
			length = listOrderLength.size()/3;
		}else {
			length = listOrderLength.size()/3+1;
		}
		model.addAttribute("listOrder", listOrder);
		model.addAttribute("length", length);
		model.addAttribute("pageIndexStr", pageIndexStr);
		model.addAttribute("listOrderItem", listOrderItem);
		return "dingdan";
	}
}
																																																																																		