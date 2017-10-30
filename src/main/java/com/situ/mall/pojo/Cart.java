package com.situ.mall.pojo;

import java.io.Serializable;
import java.util.Date;

public class Cart implements Serializable{

	private Integer id;
	private Integer user_id;
	private Integer product_id;
	private Product Product;
	private Integer quantity;
	private Integer checked;
	private Date create_time;
	private Date update_time;
	
	public Cart() {
		super();
	}
	
	public Cart(Integer id, Integer user_id, Integer product_id, com.situ.mall.pojo.Product product, Integer quantity,
			Integer checked, Date create_time, Date update_time) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.product_id = product_id;
		Product = product;
		this.quantity = quantity;
		this.checked = checked;
		this.create_time = create_time;
		this.update_time = update_time;
	}

	public Cart(Integer id, Integer user_id,Product Product, Integer quantity, Integer checked,
			Date create_time, Date update_time) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.Product = Product;
		this.quantity = quantity;
		this.checked = checked;
		this.create_time = create_time;
		this.update_time = update_time;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	
	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public Product getProduct() {
		return Product;
	}
	public void setProduct(Product Product) {
		this.Product = Product;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getChecked() {
		return checked;
	}
	public void setChecked(Integer checked) {
		this.checked = checked;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

	@Override
	public String toString() {
		return "Cart [id=" + id + ", user_id=" + user_id + ", product_id=" + product_id + ", Product=" + Product
				+ ", quantity=" + quantity + ", checked=" + checked + ", create_time=" + create_time + ", update_time="
				+ update_time + "]";
	}
	
}
