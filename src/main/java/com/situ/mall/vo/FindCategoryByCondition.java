package com.situ.mall.vo;

public class FindCategoryByCondition {

	private String id;
	private String name;
	private String status;
	private Integer pageIndex;
	private Integer pageSize;
	
	public FindCategoryByCondition() {
		super();
	}
	public FindCategoryByCondition(String id, String name, String status, Integer pageIndex, Integer pageSize) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.pageIndex = pageIndex;
		this.pageSize = pageSize;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
		return "FindCategoryByCondition [id=" + id + ", name=" + name + ", status=" + status + ", pageIndex="
				+ pageIndex + ", pageSize=" + pageSize + "]";
	}
	
}
