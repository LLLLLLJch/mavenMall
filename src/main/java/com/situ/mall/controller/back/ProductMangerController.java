package com.situ.mall.controller.back;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.situ.mall.common.SeverResponse;
import com.situ.mall.pojo.Category;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.ProductMangerService;
import com.situ.mall.vo.FindByCondition;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping(value = "/background")
public class ProductMangerController {
	
	@Autowired
	private ProductMangerService productMangerService;

	
	@RequestMapping("/findAllCategory")
	public String findAllCategory(Model model,String pageIndexStr,String pageSizeStr,String id,String status) {
		List<Category> list = productMangerService.findAllCategory();
		int pageIndex = 1;
		if (pageIndexStr != null && !pageIndexStr.equals("")) {
			pageIndex = Integer.parseInt(pageIndexStr);
		}
		int pageSize = 3;
		if (pageSizeStr != null && !pageSizeStr.equals("")) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		FindByCondition condition = new FindByCondition(id, status, pageIndex, pageSize);
		PageBean<Product> pageBean = productMangerService.findByCondition(condition);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("condition", condition);
		model.addAttribute("list", list);
		/*return "backMangerProductIndex";*/
		return "productIndex";
	}
	@RequestMapping("/findAllProduct")
	@ResponseBody
	public List<Product> findAllProduct() {
		List<Product> list = productMangerService.findAllProducts();
		return list;
	}
	@RequestMapping("/findSecond")
	@ResponseBody
	public List<Category> findSecond(Integer id) {
		if(id==null){
			return null;
		}
		System.out.println("-----------"+id);
		List<Category> list = productMangerService.findSecond(id);
		return list;
	}
	@RequestMapping("/findProductByCategory")
	public String findProductByCategory(Integer selectid,Integer secondId,Model model,String id,String status,String pageIndexStr,String pageSizeStr) {
		int pageIndex = 1;
		if (pageIndexStr != null && !pageIndexStr.equals("")) {
			pageIndex = Integer.parseInt(pageIndexStr);
		}
		int pageSize = 3;
		if (pageSizeStr != null && !pageSizeStr.equals("")) {
			pageSize = Integer.parseInt(pageSizeStr);
		}
		System.out.println("--------------"+selectid);
		System.out.println("--------------"+secondId);
		List<Category> list = productMangerService.findAllCategory();
		FindByCondition condition = new FindByCondition(id, status, pageIndex, pageSize);
		PageBean<Product> pageBean = productMangerService.findCondition(condition,secondId);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("list", list);
		model.addAttribute("secondId", secondId);
		model.addAttribute("selectid", selectid);
		model.addAttribute("condition", condition);
		/*return "backMangerProductIndex";*/
		return "productIndex";
	}
	
	@RequestMapping("/deleteProduct")
	@ResponseBody
	public int deleteProduct(Integer id) {
		System.out.println("-----------------"+id);
		int result = productMangerService.deleteProduct(id);
		return result;
		
	}
	
	@RequestMapping("/getCategory")
	public String getAddCategory() {
		return "backMangerAdd";
	}
	
	@RequestMapping("/addProduct")
	@ResponseBody
	public SeverResponse addProduct(Product product) {
		Date date = new Date();
		product.setCreate_time(date);
		return productMangerService.addProduct(product);
	}
	
	@RequestMapping("/selectStair")
	@ResponseBody
	public List<Category> getCategry(Model model) {
		List<Category> list = productMangerService.findCategoryByZero();
		return list;
	}
	
	@RequestMapping("/selectSecond")
	@ResponseBody
	public List<Category> selectSecond(int categoryId) {
		List<Category> list = productMangerService.selectSecond(categoryId);
		return list;
	}
	
	@RequestMapping("/uploadPic")
	@ResponseBody
	public Map<String, Object> uploadPic(MultipartFile pictureFile) {
		String name = UUID.randomUUID().toString().replace("-", "");
		String ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		String fileName = name + "." + ext;// 数据库里面
		String filePath = "E:\\picture\\" + fileName;
		try {
			pictureFile.transferTo(new File(filePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		return map;
	}
	
	@RequestMapping("/updateStatus")
	@ResponseBody
	public SeverResponse updateStatus(int id,int status,HttpServletRequest request){
		System.out.println("++++++++++++++++++"+id);
		System.out.println("++++++++++++++++++"+status);
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		System.out.println("AAAAAAAAAAAAAAAAAAA"+username);
		return productMangerService.updateStatus(id,status,username);
		/*return "redirect:/background/findAllCategory.action";*/
	}
	
	@RequestMapping("/update")
	public String update(Product product) {
		Date date = new Date();
		System.out.println("--------------------" + date);
		product.setUpdate_time(date);
		productMangerService.update(product);
		return "redirect:/background/findByCondition.action";
	}
	
	@RequestMapping("/toUpdateProduct")
	public String toUpdateProduct(Integer id,Integer category_id,Integer categoryId, Model model) {
		Product product = productMangerService.findById(id);
		Product product2 = productMangerService.findProduct(id);
		Category categoryParent = productMangerService.findCategoryParent(categoryId);
		Category categorySon = productMangerService.findCategorySon(category_id);
		System.out.println("-------------"+product);
		String subImages = product2.getSub_images();
		String[] list = subImages.split(",");
		model.addAttribute("list", list);
		model.addAttribute("product", product);
		model.addAttribute("categoryParent", categoryParent);
		model.addAttribute("categorySon", categorySon);
		return "product_update";

	}
	
	public void findSecondExpectZero() {
		List<Category> list = productMangerService.findSecondExceptZero();
	}
	
	public void findProductById(Integer id) {
		Product product = productMangerService.findProductByIdAddCart(id);
	}
	
	public void findCategoryNameById(Integer id) {
		Category category = productMangerService.findCategoryNameById(id);
	}
	
	public void findCategoryName(Integer id) {
		Category category = productMangerService.findCategoryName(id);
	}
	
	@RequestMapping("/deleteAll")
	public String deleteAll(int[] selectedIds) {
		productMangerService.deleteAll(selectedIds);
		return "redirect:/background/findAllCategory.action";

	}
	@RequestMapping("/getProductDetail")
	@ResponseBody
	public String getProductDetail(@RequestBody String data) {
		System.out.println("-----------------"+data);
		System.out.println();
		return data;
	}
	
	public void findProductLikeName(String name) {
		List<Product> list = productMangerService.findProductLikeName(name);
	}
}
