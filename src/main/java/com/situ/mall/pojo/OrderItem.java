package com.situ.mall.pojo;

import java.io.Serializable;
import java.util.Date;

public class OrderItem implements Serializable{

	private Integer id;
	private Integer user_id;
	private String order_no;
	private Product product;
	private String product_name;
	private String product_image;
	private double currentUnitPrice;
	private Integer quantity;
	private double total_price;
	private Date create_time;
	private Date update_time;
	
	public OrderItem() {
		super();
	}
	public OrderItem(Integer id, Integer user_id, String order_no, Product product, double currentUnitPrice,
			Integer quantity, double total_price, Date create_time, Date update_time) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.order_no = order_no;
		this.product = product;
		this.currentUnitPrice = currentUnitPrice;
		this.quantity = quantity;
		this.total_price = total_price;
		this.create_time = create_time;
		this.update_time = update_time;
	}
	
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public OrderItem(Integer id, Integer user_id, String order_no, Product product, String product_name,
			String product_image, double currentUnitPrice, Integer quantity, double total_price, Date create_time,
			Date update_time) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.order_no = order_no;
		this.product = product;
		this.product_name = product_name;
		this.product_image = product_image;
		this.currentUnitPrice = currentUnitPrice;
		this.quantity = quantity;
		this.total_price = total_price;
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
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public double getCurrentUnitPrice() {
		return currentUnitPrice;
	}
	public void setCurrentUnitPrice(double currentUnitPrice) {
		this.currentUnitPrice = currentUnitPrice;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
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
		return "OrderItem [id=" + id + ", user_id=" + user_id + ", order_no=" + order_no + ", product=" + product
				+ ", product_name=" + product_name + ", product_image=" + product_image + ", currentUnitPrice="
				+ currentUnitPrice + ", quantity=" + quantity + ", total_price=" + total_price + ", create_time="
				+ create_time + ", update_time=" + update_time + "]";
	}
	
	
}
