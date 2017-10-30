package com.situ.mall.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.common.SeverResponse;
import com.situ.mall.dao.ProductMangerDao;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.IStaticPageService;
import com.situ.mall.service.ProductMangerService;
import com.situ.mall.vo.FindByCondition;
import com.situ.mall.vo.FindProductByName;
import com.situ.mall.vo.PageBean;
@Service
public class ProductMangerServiceImpl implements ProductMangerService{

	@Autowired
	private ProductMangerDao productMangerDao;
	@Autowired
	private IStaticPageService staticPageService;
	
	@Override
	public List<Product> findAllProducts() {
		return productMangerDao.findAllProducts();
	}

	@Override
	public Product findById(int id) {
		return productMangerDao.findById(id);
	}

	@Override
	public List<Category> findCategoryByZero() {
		return productMangerDao.findCategoryByZero();
	}

	@Override
	public SeverResponse addProduct(Product product) {
		try {
			if(productMangerDao.addProduct(product)>0){
				return SeverResponse.createSuccess("添加成功");
			}else {
				return SeverResponse.createError("添加失败");
			}
		} catch (Exception e) {
			return SeverResponse.createError("添加失败");
		}
		
	}

	@Override
	public void addCategory(String name,Date date) {
		productMangerDao.addCategory(name,date);
	}

	@Override
	public Category findCategoryID(String name) {
		return productMangerDao.findCategoryID(name);
	}

	@Override
	public List<Category> selectSecond(int id) {
		return productMangerDao.selectSecond(id);
	}

	@Override
	public void deleteAll(int[] selectedIds) {
		for (int id : selectedIds) {
			productMangerDao.deleteProduct(id);
		}
	}

	@Override
	public int update(Product product) {
		return productMangerDao.update(product);
	}
	
	@Override
	public PageBean<Product> getPageBean(int pageIndex, int pageSize) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = productMangerDao.findTotalCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / pageSize);
		pageBean.setTotalPage(totalPage);
		int index = (pageIndex - 1) * pageSize;
		List<Product> list = productMangerDao.findAll(index,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public PageBean<Product> findByCondition(FindByCondition condition) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(condition.getPageIndex());
		pageBean.setPageSize(condition.getPageSize());
		int totalCount = productMangerDao.totalCountByCondition(condition);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / condition.getPageSize());
		pageBean.setTotalPage(totalPage);
		int index = (condition.getPageIndex()-1)*condition.getPageSize();
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("index", index);
		map.put("condition", condition);
		List<Product> list = productMangerDao.findByCondition(map);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public int updateStatus(Product product) {
		return productMangerDao.updateStatus(product);
	}

	@Override
	public SeverResponse updateStatus(int id, int status,String username) {
		productMangerDao.updateStatus(id,status);
		Product product = productMangerDao.findProductByIdAddCart(id);
		if(null == product){
			return SeverResponse.createError("商品不存在");
		}
		//每次当你上架的时候，就开始静态化页面
		if (product.getStatus() == 1) {
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("product", product);
			//通过分割得到subImages
			String subImagesStr = product.getSub_images();
			String [] subImages = subImagesStr.split(",");
			for (int i = 0; i < subImages.length; i++) {
				subImages[i] = subImages[i];
			}
			
			int parent_id = product.getCategory().getId();
			Category categorySon  = productMangerDao.findCategoryNameById(parent_id);
			System.out.println("-------------------"+product);
			System.out.println("------------------"+parent_id);
			System.err.println("-----------------"+categorySon);
			int category_id = categorySon.getParent_id();
			Category categoryParent = productMangerDao.findCategoryName(category_id);
			map.put("product", product);
			System.out.println("-------------------"+product.getDetail());
			map.put("categorySon", categorySon);
			map.put("categoryParent", categoryParent);
			map.put("subImages", subImages);
			map.put("username", username);
			staticPageService.productIndex(map, id);
			return SeverResponse.createSuccess("静态化页面成功");
			
		}
		//提示下架成功
		return SeverResponse.createSuccess("下架成功");
	}

	@Override
	public List<Category> findAllCategory() {
		return productMangerDao.findAllCategory();
	}

	@Override
	public List<Category> findSecond(int id) {
		return productMangerDao.findSecond(id);
	}

	@Override
	public List<Product> findProductByCategory(int id) {
		return productMangerDao.findProductByCategory(id);
	}

	@Override
	public PageBean<Product> findCondition(FindByCondition condition, int value) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(condition.getPageIndex());
		pageBean.setPageSize(condition.getPageSize());
		int totalCount = productMangerDao.totalCountCondition(condition,value);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / condition.getPageSize());
		pageBean.setTotalPage(totalPage);
		int index = (condition.getPageIndex()-1)*condition.getPageSize();
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("index", index);
		map.put("condition", condition);
		map.put("value", value);
		List<Product> list = productMangerDao.findCondition(map);
		pageBean.setList(list);
		return pageBean;
	}


	@Override
	public int deleteProduct(int id) {
		return productMangerDao.deleteProduct(id);
	}

	@Override
	public Category findCategoryParent(Integer categoryId) {
		return productMangerDao.findCategoryParent(categoryId);
	}

	@Override
	public Category findCategorySon(Integer category_id) {
		return productMangerDao.findCategorySon(category_id);
	}

	@Override
	public List<Category> findSecondExceptZero() {
		return productMangerDao.findSecondExceptZero();
	}

	@Override
	public Product findProductByIdAddCart(int id) {
		return productMangerDao.findProductByIdAddCart(id);
	}

	@Override
	public Category findCategoryName(Integer id) {
		return productMangerDao.findCategoryName(id);
	}

	@Override
	public Category findCategoryNameById(Integer id) {
		return productMangerDao.findCategoryNameById(id);
	}

	@Override
	public List<Product> findProductLikeName(String name) {
		return productMangerDao.findProductLikeName(name);
	}

	@Override
	public PageBean<Product> findProductByName(FindProductByName findProductByName) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(findProductByName.getPageIndex());
		pageBean.setPageSize(findProductByName.getPageSize());
		int totalCount = productMangerDao.findTotalCountByName(findProductByName.getName());
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / findProductByName.getPageSize());
		pageBean.setTotalPage(totalPage);
		int index = (findProductByName.getPageIndex() - 1) * findProductByName.getPageSize();
		Map<Object, Object> map = new HashMap<Object,Object>();
		map.put("index", index);
		map.put("pageSize", findProductByName.getPageSize());
		map.put("name", findProductByName.getName());
		List<Product> list = productMangerDao.findProductByName(map);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public PageBean<Product> findProductById(Integer id, Integer pageIndex, Integer pageSize) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int totalCount = productMangerDao.findTotalCountById(id);
		pageBean.setTotalCount(totalCount);
		int totalPage = (int) Math.ceil(1.0 * totalCount / pageSize);
		pageBean.setTotalPage(totalPage);
		int index = (pageIndex - 1) * pageSize;
		Map<Object, Object> map = new HashMap<Object,Object>();
		map.put("index", index);
		map.put("pageSize", pageSize);
		map.put("id", id);
		List<Product> list = productMangerDao.findProductById(map);
		pageBean.setList(list);
		return pageBean;
	}
	
}
