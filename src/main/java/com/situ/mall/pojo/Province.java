package com.situ.mall.pojo;

import java.io.Serializable;

public class Province implements Serializable{

	private Integer id;
	private String province;
	private Integer sort;
	
	public Province() {
		super();
	}
	public Province(Integer id, String province, Integer sort) {
		super();
		this.id = id;
		this.province = province;
		this.sort = sort;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	@Override
	public String toString() {
		return "Province [id=" + id + ", province=" + province + ", sort=" + sort + "]";
	}
	
}
