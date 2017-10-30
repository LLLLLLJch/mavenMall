package com.situ.mall.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.CartDao;
import com.situ.mall.pojo.Cart;
import com.situ.mall.service.CartService;
@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDao cartDao;
	
	@Override
	public Boolean add(Cart cart) {
		return cartDao.addCart(cart)>0;
	}

	@Override
	public Integer deleteCart(Integer id) {
		return cartDao.deleteCart(id);
	}

	@Override
	public List<Cart> findCartByUserId(Integer id) {
		return cartDao.findCartByUserId(id);
	}

	@Override
	public List<Cart> findCartAndProductByUserId(Integer userId) {
		return cartDao.findCartAndProductByUserId(userId);
	}

	@Override
	public Boolean update(Integer oldQuantity, Integer quantity ,Integer product_id) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("oldQuantity", oldQuantity);
		map.put("quantity", quantity);
		map.put("product_id", product_id);
		return cartDao.update(map);
	}

	@Override
	public Cart findCheckedCartById(Integer id) {
			return cartDao.findCheckedCartById(id);
	}

	@Override
	public void deleteBuyedProduct(Integer id, int userId) {
		cartDao.deleteBuyedProduct(id,userId);
	}

	@Override
	public void addOneProduct(Integer quantity,Integer cartId) {
		cartDao.addOneProduct(quantity,cartId);
	}

	@Override
	public void subOneProduct(Integer quantity, Integer cartId) {
		cartDao.subOneProduct(quantity,cartId);
	}

	@Override
	public boolean deleteCartByUserId(int userId) {
		return cartDao.deleteCartByUserId(userId)>0;
	}

}
