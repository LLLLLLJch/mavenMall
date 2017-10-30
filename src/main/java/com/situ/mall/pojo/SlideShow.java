package com.situ.mall.pojo;

import java.io.Serializable;
import java.util.Date;

public class SlideShow implements Serializable{

	private Integer id;
	private String name;
	private String main_image;
	private Integer status;
	private Date create_time;
	private Date update_time;
	
	public SlideShow() {
		super();
	}
	public SlideShow(Integer id, String name, String main_image, Integer status, Date create_time, Date update_time) {
		super();
		this.id = id;
		this.name = name;
		this.main_image = main_image;
		this.status = status;
		this.create_time = create_time;
		this.update_time = update_time;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMain_image() {
		return main_image;
	}
	public void setMain_image(String main_image) {
		this.main_image = main_image;
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
	@Override
	public String toString() {
		return "SlideShow [id=" + id + ", name=" + name + ", main_image=" + main_image + ", status=" + status
				+ ", create_time=" + create_time + ", update_time=" + update_time + "]";
	}
	
}
