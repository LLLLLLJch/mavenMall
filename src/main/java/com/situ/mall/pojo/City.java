package com.situ.mall.pojo;

import java.io.Serializable;

public class City implements Serializable{

	private Integer id;
	private String city;
	private Integer product_id;
	
	public City() {
		super();
	}
	public City(Integer id, String city, Integer product_id) {
		super();
		this.id = id;
		this.city = city;
		this.product_id = product_id;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Integer getProduct_id() {
		return product_id;
	}
	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}
	@Override
	public String toString() {
		return "City [id=" + id + ", city=" + city + ", product_id=" + product_id + "]";
	}
	
}
