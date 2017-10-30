package com.situ.mall.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.SlideShowMangerDao;
import com.situ.mall.pojo.SlideShow;
import com.situ.mall.service.SlideShowService;
import com.situ.mall.vo.PageBean;
@Service
public class SlideShowServiceImpl implements SlideShowService{

	@Autowired
	private SlideShowMangerDao slideShowDao;
	
	@Override
	public PageBean<SlideShow> findAllSlideShow(int pageIndex, int pageSize) {
		PageBean<SlideShow> pageBean = new PageBean<SlideShow>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = slideShowDao.totalCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / pageSize);
		pageBean.setTotalPage(totalPage);
		int index = ((pageIndex-1)*pageSize);
		List<SlideShow> list = slideShowDao.findAllSlideShow(index,pageSize);
		pageBean.setList(list);
		return pageBean;
		
		
	}

	@Override
	public void addSlideShow(SlideShow slideShow) {
		slideShowDao.addSlideShow(slideShow);
	}

	@Override
	public int updateStatus(Integer id, Integer status) {
		return slideShowDao.updateStatus(id,status);
	}

	@Override
	public Integer deleteSlideShow(Integer id) {
		return slideShowDao.deleteSlideShow(id);
	}

	@Override
	public void deleteAll(int[] selectedIds) {
		for (Integer id : selectedIds) {
			slideShowDao.deleteSlideShow(id);
		}
	}

	@Override
	public List<SlideShow> selectAllSlideShows() {
		return slideShowDao.selectAllSlideShows();
	}
}
