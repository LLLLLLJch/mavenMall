package com.situ.mall.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.CategoryMangerDao;
import com.situ.mall.pojo.Category;
import com.situ.mall.service.CategoryService;
import com.situ.mall.vo.FindCategoryByCondition;
import com.situ.mall.vo.PageBean;
@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	private CategoryMangerDao categoryMangerDao;

	@Override
	public void addFirstCategory(Category category) {
		categoryMangerDao.addFirstCategory(category);
	}

	@Override
	public int findFirstCategoryId(Category category) {
		return categoryMangerDao.findFirstCategoryId(category);
	}

	@Override
	public void addSecondCategory(Category category) {
		categoryMangerDao.addSecondCategory(category);
	}

	@Override
	public PageBean<Category> findByCondition(FindCategoryByCondition findCategoryByCondition) {
		PageBean<Category> pageBean = new PageBean<Category>();
		pageBean.setPageIndex(findCategoryByCondition.getPageIndex());
		pageBean.setPageSize(findCategoryByCondition.getPageSize());
		int totalCount = categoryMangerDao.findTotalCount(findCategoryByCondition);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / findCategoryByCondition.getPageSize());
		pageBean.setTotalPage(totalPage);
		int index = (findCategoryByCondition.getPageIndex()-1)*findCategoryByCondition.getPageSize();
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("index", index);
		map.put("findCategoryByCondition", findCategoryByCondition);
		List<Category> list = categoryMangerDao.findByCondition(map);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public void deleteCategory(int id) {
		categoryMangerDao.deleteCategory(id);
	}

	@Override
	public void deleteAll(int[] selectedIds) {
		for (int id : selectedIds) {
			categoryMangerDao.deleteCategory(id);
		}
	}

	@Override
	public Category toUpdateCategory(int id) {
		return categoryMangerDao.toUpdateCategory(id);
	}

	@Override
	public void update(Category category) {
		categoryMangerDao.update(category);
	}

	@Override
	public void updateStatus(int id, int status) {
		categoryMangerDao.updateStatus(id,status);
	}
	
	
}
