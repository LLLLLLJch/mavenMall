package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.Cart;

public interface CartService {

	List<Cart> findCartByUserId(Integer id);

	Boolean add(Cart cart);

	Integer deleteCart(Integer id);

	List<Cart> findCartAndProductByUserId(Integer userId);

	Boolean update(Integer product_id, Integer quantity, Integer oldQuantity);

	Cart findCheckedCartById(Integer id);

	void deleteBuyedProduct(Integer id, int userId);

	void addOneProduct(Integer cartId, Integer cartId2);

	void subOneProduct(Integer quantity, Integer cartId);

	boolean deleteCartByUserId(int userId);

}
