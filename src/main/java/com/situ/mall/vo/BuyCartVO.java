package com.situ.mall.vo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.codehaus.jackson.annotate.JsonIgnore;

public class BuyCartVO {

	private Integer productId;
	private List<CartItemVO> items = new ArrayList<CartItemVO>();

	public void add(CartItemVO cartItemVO) {
		boolean isExist = false;
		// 1.这件商品原来在购物车里面有，我们只需要更新购买数量
		for (CartItemVO item : items) {
			if (item.getProduct().getId() == cartItemVO.getProduct().getId()) {
				isExist = true;
				int amount = item.getQuantity() + cartItemVO.getQuantity();
				// 购买这件商品的总数量应该<=product.stock
				if (amount <= cartItemVO.getProduct().getStock()) {
					item.setQuantity(amount);
				} else {
					// 超出购买限制，最大只能购买这件商品的最大库存
					item.setQuantity(item.getProduct().getStock());
				}
				break;
			}
		}
		// 2.这件商品原来没有加入购物车,加入购物车
		if (isExist == false) {
			items.add(cartItemVO);
		}
	}

	public void deleteCartItem(Integer proId) {
		Iterator<CartItemVO> iterator = items.iterator();
		while (iterator.hasNext()) {
			CartItemVO cartItemVO = iterator.next();
			if (cartItemVO.getProduct().getId() == proId) {
				iterator.remove();
				return;
			}
		}

	}

	@JsonIgnore
	public double getTotalPrice() {
		Double totalPrice = 0.0;
		for (CartItemVO item : items) {
			totalPrice += item.getQuantity() * item.getProduct().getPrice();
		}
		return totalPrice;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public List<CartItemVO> getItems() {
		return items;
	}

	public void setItems(List<CartItemVO> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "BuyCartVO [productId=" + productId + ", items=" + items + "]";
	}


}
