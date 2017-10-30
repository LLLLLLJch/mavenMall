package com.situ.mall.service;

import java.util.List;

import com.situ.mall.pojo.SlideShow;
import com.situ.mall.vo.PageBean;

public interface SlideShowService {

	PageBean<SlideShow> findAllSlideShow(int pageIndex, int pageSize);

	void addSlideShow(SlideShow slideShow);

	int updateStatus(Integer id, Integer status);

	Integer deleteSlideShow(Integer id);

	void deleteAll(int[] selectedIds);

	List<SlideShow> selectAllSlideShows();

}
