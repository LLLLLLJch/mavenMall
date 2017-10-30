package com.situ.mall.vo;

public class FindProductByName {

	private String name;
	private Integer pageIndex;
	private Integer pageSize;
	
	public FindProductByName() {
		super();
	}
	public FindProductByName(String name, Integer pageIndex, Integer pageSize) {
		super();
		this.name = name;
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	@Override
	public String toString() {
		return "FindProductByName [name=" + name + ", pageIndex=" + pageIndex + ", pageSize=" + pageSize + "]";
	}
	
}
