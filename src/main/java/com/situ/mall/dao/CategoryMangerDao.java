package com.situ.mall.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.Category;
import com.situ.mall.vo.FindCategoryByCondition;

public interface CategoryMangerDao {

	void addFirstCategory(Category category);

	int findFirstCategoryId(Category category);

	void addSecondCategory(Category category);

	int findTotalCount(FindCategoryByCondition findCategoryByCondition);

	List<Category> findByCondition(Map<String, Object> map);

	void deleteCategory(int id);

	Category toUpdateCategory(int id);

	void update(Category category);

	void updateStatus(@Param(value="id")int id, @Param(value="status")int status);


}
