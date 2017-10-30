package com.situ.mall.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.SlideShow;

public interface SlideShowMangerDao {

	List<SlideShow> findAllSlideShow(@Param(value="index")int index,@Param(value="pageSize")int pageSize);

	int totalCount();

	void addSlideShow(SlideShow slideShow);

	int updateStatus(@Param(value="id")Integer id, @Param(value="status")Integer status);

	Integer deleteSlideShow(Integer id);

	List<SlideShow> selectAllSlideShows();

}
