package com.situ.mall.service;

import java.util.Date;
import java.util.List;

import com.situ.mall.common.SeverResponse;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.vo.FindByCondition;
import com.situ.mall.vo.FindProductByName;
import com.situ.mall.vo.PageBean;

public interface ProductMangerService {

	List<Product> findAllProducts();

	int deleteProduct(int id);

	Product findById(int id);

	List<Category> findCategoryByZero();

	SeverResponse addProduct(Product product);

	void addCategory(String name, Date date);

	Category findCategoryID(String name);

	List<Category> selectSecond(int id);

	void deleteAll(int[] selectedIds);

	int update(Product product);

	PageBean<Product> getPageBean(int pageIndex, int pageSize);

	PageBean<Product> findByCondition(FindByCondition condition);

	int updateStatus(Product product);

	SeverResponse updateStatus(int id, int status, String username);

	List<Category> findAllCategory();

	List<Category> findSecond(int id);

	List<Product> findProductByCategory(int id);

	PageBean<Product> findCondition(FindByCondition condition, int value);

	Category findCategoryParent(Integer categoryId);

	Category findCategorySon(Integer category_id);

	List<Category> findSecondExceptZero();

	Product findProductByIdAddCart(int id);

	Category findCategoryName(Integer id);

	Category findCategoryNameById(Integer id);

	List<Product> findProductLikeName(String name);

	PageBean<Product> findProductByName(FindProductByName findProductByName);

	PageBean<Product> findProductById(Integer id, Integer pageIndex, Integer pageSize);


}
