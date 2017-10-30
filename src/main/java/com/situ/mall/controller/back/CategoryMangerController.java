package com.situ.mall.controller.back;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.CategoryService;
import com.situ.mall.service.ProductMangerService;
import com.situ.mall.vo.FindCategoryByCondition;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping("/backgroundCategory")
public class CategoryMangerController {

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private ProductMangerService productMangerService;

	@RequestMapping("/getAddCategoryPage")
	public String getAddCategoryPage() {
		return "backMangerAddCategory";
	}

	@RequestMapping("/addFirstCategory")
	public String addFirstCategory(Category category, Model model) {
		Date date = new Date();
		category.setCreate_time(date);
		categoryService.addFirstCategory(category);
		System.out.println("------------");
		int id = categoryService.findFirstCategoryId(category);
		model.addAttribute("id", id);
		return "backMangerAddCategory";
	}

	@RequestMapping("/addSecondCategory")
	public String addSecondCategory(Category category) {
		Date date = new Date();
		category.setCreate_time(date);
		categoryService.addSecondCategory(category);
		return "redirect:/backgroundCategory/getPageBean.action";
	}

	@RequestMapping("/getPageBean")
	public String getPageBean(FindCategoryByCondition findCategoryByCondition, String pageIndexStr, String pageSizeStr,
			Model model) {
		int pageIndex = 1;
		if (pageIndexStr != null && !pageIndexStr.equals("")) {
			pageIndex = Integer.parseInt(pageIndexStr);
		}
		int pageSize = 3;
		if (pageSizeStr != null && !pageSizeStr.equals("")) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		findCategoryByCondition.setPageIndex(pageIndex);
		findCategoryByCondition.setPageSize(pageSize);
		PageBean<Category> pageBean = categoryService.findByCondition(findCategoryByCondition);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("findCategoryByCondition", findCategoryByCondition);
		return "backMangerCategoryIndex";
	}

	@RequestMapping("/deleteCategory")
	public String deleteCategory(int id) {
		categoryService.deleteCategory(id);
		return "redirect:/backgroundCategory/getPageBean.action";
	}

	@RequestMapping("/deleteAll")
	public String deleteAll(int[] selectedIds) {
		categoryService.deleteAll(selectedIds);
		return "redirect:/backgroundCategory/getPageBean.action";
	}

	@RequestMapping("/toUpdateCategory")
	public String toUpdateCategory(int id, Model model) {
		Category category = categoryService.toUpdateCategory(id);
		model.addAttribute("category", category);
		return "category_update";
	}

	@RequestMapping("/update")
	public String update(Category category, Model model) {
		Date date = new Date();
		category.setUpdate_time(date);
		categoryService.update(category);
		return "redirect:/backgroundCategory/getPageBean.action";
	}

	@RequestMapping("/updateStatus")
	public String updateStatus(int id, int status) {
		categoryService.updateStatus(id, status);
		return "redirect:/backgroundCategory/getPageBean.action";
	}

	@RequestMapping("/findCategory")
	public String findCategory(Model model) {
		List<Category> listParent = productMangerService.findCategoryByZero();
		model.addAttribute("listParent", listParent);
		return "categoryIndex";

	}
	@RequestMapping("/findSon")
	public String findSon(Integer parentId,Model model) {
		List<Category> listSon = productMangerService.selectSecond(parentId);
		model.addAttribute("listSon", listSon);
		return "findSecond";
	}
}
