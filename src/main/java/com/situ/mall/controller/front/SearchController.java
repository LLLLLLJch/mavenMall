package com.situ.mall.controller.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Product;
import com.situ.mall.service.ProductMangerService;
import com.situ.mall.vo.FindProductByName;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping("/search")
public class SearchController {

	@Autowired
	private ProductMangerService productMangerService;
	@RequestMapping("/findProduct")
	public String findProduct(String name,String pageIndexStr,String pageSizeStr,Model model) {
		Integer pageIndex = 1;
		if(pageIndexStr != null && !pageIndexStr.equals("")){
			pageIndex = Integer.parseInt(pageIndexStr);
		}
		Integer pageSize = 5;
		if(pageSizeStr != null && !pageSizeStr.equals("")){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		FindProductByName findProductByName = new FindProductByName(name, pageIndex, pageSize);
		PageBean<Product> pageBean = productMangerService.findProductByName(findProductByName);
		model.addAttribute("pageBean", pageBean);
		return "searchByName";
	}
}
