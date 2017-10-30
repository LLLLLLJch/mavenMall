package com.situ.mall.service;

import com.situ.mall.pojo.Category;
import com.situ.mall.vo.FindCategoryByCondition;
import com.situ.mall.vo.PageBean;

public interface CategoryService {

	void addFirstCategory(Category category);

	int findFirstCategoryId(Category category);

	void addSecondCategory(Category category);

	PageBean<Category> findByCondition(FindCategoryByCondition findCategoryByCondition);

	void deleteCategory(int id);

	void deleteAll(int[] selectedIds);

	Category toUpdateCategory(int id);

	void update(Category category);

	void updateStatus(int id, int status);


}
