package com.situ.mall.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Category implements Serializable{

	private Integer id;
	private Integer parent_id;
	private String name;
	private Integer status;
	private Integer sortOrder;
	private Date create_time;
	private Date update_time;
	private List<Product> productList;
	
	public Category() {
		super();
	}
	public Category(Integer id, Integer parent_id, String name, Integer status, Integer sortOrder, Date create_time,
			Date update_time, List<Product> productList) {
		super();
		this.id = id;
		this.parent_id = parent_id;
		this.name = name;
		this.status = status;
		this.sortOrder = sortOrder;
		this.create_time = create_time;
		this.update_time = update_time;
		this.productList = productList;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getParent_id() {
		return parent_id;
	}
	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(Integer sortOrder) {
		this.sortOrder = sortOrder;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date createTime) {
		this.create_time = createTime;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date updateTime) {
		this.update_time = updateTime;
	}
	public List<Product> getProductList() {
		return productList;
	}
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
	@Override
	public String toString() {
		return "Category [id=" + id + ", parent_id=" + parent_id + ", name=" + name + ", status=" + status
				+ ", sortOrder=" + sortOrder + ", create_time=" + create_time + ", update_time=" + update_time
				+ ", productList=" + productList + "]";
	}
	
}
