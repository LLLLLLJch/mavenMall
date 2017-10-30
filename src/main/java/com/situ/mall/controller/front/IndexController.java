package com.situ.mall.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.SlideShow;
import com.situ.mall.service.ProductMangerService;
import com.situ.mall.service.SlideShowService;
import com.situ.mall.vo.PageBean;

@Controller
public class IndexController {

	@Autowired
	private ProductMangerService productMangerService;
	@Autowired
	private SlideShowService slideService;
	
	@RequestMapping("/index.shtml")
	public String index(Model model) {
		List<Category> listFirst = productMangerService.findCategoryByZero();
		List<Category> listSecond = productMangerService.findSecondExceptZero();
		List<SlideShow> listSlideShow = slideService.selectAllSlideShows();
		model.addAttribute("listFirst", listFirst);
		model.addAttribute("listSecond", listSecond);
		model.addAttribute("listSlideShow", listSlideShow);
		return "index";
	}
	@RequestMapping("/search.shtml")
	public String search(Integer id,String pageIndexStr,String pageSizeStr,Model model) {
		Integer pageIndex = 1;
		if(pageIndexStr!=null && !pageIndexStr.equals("")){
			pageIndex = Integer.parseInt(pageIndexStr);
		}
		Integer pageSize = 4;
		if(pageSizeStr != null && !pageSizeStr.equals("")){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		PageBean<Product> pageBean = productMangerService.findProductById(id,pageIndex,pageSize);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("id", id);
		return "search";
	}
	@RequestMapping("/detail.shtml")
	public String detail(Integer id,Model model) {
		Product product = productMangerService.findProductByIdAddCart(id);
		int parent_id = product.getCategory().getId();
		Category categorySon  = productMangerService.findCategoryNameById(parent_id);
		System.out.println("-------------------"+product);
		System.out.println("------------------"+parent_id);
		System.err.println("-----------------"+categorySon);
		int category_id = categorySon.getParent_id();
		Category categoryParent = productMangerService.findCategoryName(category_id);
		model.addAttribute("product", product);
		System.out.println("-------------------"+product.getDetail());
		model.addAttribute("categorySon", categorySon);
		model.addAttribute("categoryParent", categoryParent);
		
		//通过分割得到subImages
		String subImagesStr = product.getSub_images();
		String [] subImages = subImagesStr.split(",");
		for (int i = 0; i < subImages.length; i++) {
			subImages[i] = subImages[i];
		}
		model.addAttribute("subImages", subImages);
		return "detail";
	}
	@RequestMapping("/cart.shtml")
	public String cart(Integer id,Integer quantity,Model model) {
		Product product = productMangerService.findProductByIdAddCart(id);
		model.addAttribute("product", product);
		model.addAttribute("quantity", quantity);
		return "cart";
	}
	@RequestMapping("/login.shtml")
	public String getLoginPage() {
		return "login";
	}
	@RequestMapping("/findProductLikeName.shtml")
	public String findProductLikeName(String name,Model model) {
		System.out.println("-----------------"+name);
		List<Product> list = productMangerService.findProductLikeName(name);
		model.addAttribute("list", list);
		return "search";
	}
}
