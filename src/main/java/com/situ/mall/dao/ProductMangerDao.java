package com.situ.mall.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.common.SeverResponse;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.vo.FindByCondition;

public interface ProductMangerDao {

	List<Product> findAllProducts();

	int deleteProduct(int id);

	Product findById(int id);

	List<Category> findCategoryByZero();

	int addProduct(Product product);

	void addCategory(@Param(value="name")String name, @Param(value="date")Date date);

	Category findCategoryID(String name);

	List<Category> selectSecond(int id);

	int update(Product product);

	int findTotalCount();

	List<Product> findAll(@Param(value="index")int index, @Param(value="pageSize")int pageSize);

	int totalCountByCondition(FindByCondition condition);

	List<Product> findByCondition(Map<String, Object> map);

	int updateStatus(Product product);

	int updateStatus(@Param(value="id")int id, @Param(value="status")int status);

	List<Category> findAllCategory();

	List<Category> findSecond(int id);

	List<Product> findProductByCategory(int id);

	int totalCountCondition(@Param(value="condition")FindByCondition condition, @Param(value="value")int value);

	List<Product> findCondition(Map<String, Object> map);

	Category findCategoryParent(Integer categoryId);

	Category findCategorySon(Integer category_id);

	List<Category> findSecondExceptZero();

	Product findProductByIdAddCart(int id);

	Category findCategoryName(Integer id);

	Category findCategoryNameById(Integer id);

	List<Product> findProductLikeName(String name);

	int findTotalCountByName(String name);

	List<Product> findProductByName(Map<Object, Object> map);

	int findTotalCountById(Integer id);

	List<Product> findProductById(Map<Object, Object> map);

}
