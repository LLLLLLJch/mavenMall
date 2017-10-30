package com.situ.mall.controller.back;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Cart;
import com.situ.mall.service.CartService;

@Controller
@RequestMapping("/backgroundCart")
public class CartController {

	@Autowired
	private CartService cartService;
	@RequestMapping("/getCart")
	public void findCartByUserId(Integer id) {
		List<Cart> list = cartService.findCartByUserId(id);
	}
	
	public void addCart(Cart cart) {
		Boolean isSuccess = cartService.add(cart);
	}
}
