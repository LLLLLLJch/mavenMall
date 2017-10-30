package com.situ.mall.vo;

public class FindByCondition {

	private String id;
	private String status;
	private Integer pageIndex;
	private Integer pageSize;
	
	public FindByCondition() {
		super();
	}
	public FindByCondition(String id, String status, Integer pageIndex, Integer pageSize) {
		super();
		this.id = id;
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
		return "FindByCondition [id=" + id + ", status=" + status + ", pageIndex=" + pageIndex + ", pageSize="
				+ pageSize + "]";
	}
	
}
