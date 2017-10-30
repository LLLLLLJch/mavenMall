package com.situ.mall.pojo;

import java.io.Serializable;
import java.util.Date;

import org.codehaus.jackson.annotate.JsonIgnore;

import com.situ.mall.constant.Constant.MallConstant;

public class Product implements Serializable{

	private Integer id;
	private Category category;
	private String name;
	private String subtitle;
	private String main_image;
	private String sub_images;
	private String detail;
	private double price;
	private Integer stock;
	private Integer status;
	private Date create_time;
	private Date update_time;
	private Integer quantity;
	private Cart cart;
	@JsonIgnore
	   public String getFullUrl() {
			return MallConstant.SERVER_ADDRES + main_image;
		}
	public Product() {
		super();
	}
	public Product(Integer id, String name, String subtitle, String detail, double price, Integer stock, Integer status,
			Date create_time, Date update_time) {
		super();
		this.id = id;
		this.name = name;
		this.subtitle = subtitle;
		this.detail = detail;
		this.price = price;
		this.stock = stock;
		this.status = status;
		this.create_time = create_time;
		this.update_time = update_time;
	}
	
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Product(Integer id, Category category, String name, String subtitle, String main_image, String sub_images,
			String detail, double price, Integer stock, Integer status, Date create_time, Date update_time,
			Integer quantity, Cart cart) {
		super();
		this.id = id;
		this.category = category;
		this.name = name;
		this.subtitle = subtitle;
		this.main_image = main_image;
		this.sub_images = sub_images;
		this.detail = detail;
		this.price = price;
		this.stock = stock;
		this.status = status;
		this.create_time = create_time;
		this.update_time = update_time;
		this.quantity = quantity;
		this.cart = cart;
	}
	public Product(Integer id, Category category, String name, String subtitle, String main_image, String sub_images,
			String detail, double price, Integer stock, Integer status, Date create_time, Date update_time, Cart cart) {
		super();
		this.id = id;
		this.category = category;
		this.name = name;
		this.subtitle = subtitle;
		this.main_image = main_image;
		this.sub_images = sub_images;
		this.detail = detail;
		this.price = price;
		this.stock = stock;
		this.status = status;
		this.create_time = create_time;
		this.update_time = update_time;
		this.cart = cart;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getMain_image() {
		return main_image;
	}
	public void setMain_image(String main_image) {
		this.main_image = main_image;
	}
	public String getSub_images() {
		return sub_images;
	}
	public void setSub_images(String sub_images) {
		this.sub_images = sub_images;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@JsonIgnore
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
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
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", category=" + category + ", name=" + name + ", subtitle=" + subtitle
				+ ", main_image=" + main_image + ", sub_images=" + sub_images + ", detail=" + detail + ", price="
				+ price + ", stock=" + stock + ", status=" + status + ", create_time=" + create_time + ", update_time="
				+ update_time + ", quantity=" + quantity + ", cart=" + cart + "]";
	}
	
}
