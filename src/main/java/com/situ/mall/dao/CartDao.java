package com.situ.mall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.Cart;
import com.situ.mall.pojo.Product;

public interface CartDao {

	int addCart(Cart cart);

	Integer deleteCart(Integer id);

	List<Cart> findCartByUserId(Integer id);

	List<Cart> findCartAndProductByUserId(Integer userId);

	Boolean update(Map<String, Object> map);

	Cart findCheckedCartById(Integer id);

	void deleteBuyedProduct(@Param(value="id")Integer id, @Param(value="userId")int userId);

	void addOneProduct(@Param(value="quantity")Integer quantity, @Param(value="cartId")Integer cartId);

	void subOneProduct(@Param(value="quantity")Integer quantity, @Param(value="cartId")Integer cartId);

	int deleteCartByUserId(int userId);

}
