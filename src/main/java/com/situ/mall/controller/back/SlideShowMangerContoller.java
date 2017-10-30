package com.situ.mall.controller.back;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.pojo.SlideShow;
import com.situ.mall.service.SlideShowService;
import com.situ.mall.vo.PageBean;

@Controller
@RequestMapping("/backgroundslideshow")
public class SlideShowMangerContoller {
	@Autowired
	private SlideShowService slideShowService;
	
	@RequestMapping("/findAllSlideShow")
	public String findAllSlideShow(String pageIndexStr,String pageSizeStr,Model model) {
		int pageIndex = 1;
		if(pageIndexStr != null && !pageIndexStr.equals("")){
			pageIndex = Integer.parseInt(pageIndexStr);
		}
		int pageSize = 3;
		if(pageSizeStr != null && !pageSizeStr.equals("")){
			pageSize = Integer.parseInt(pageSizeStr);
		}
		PageBean<SlideShow> pageBean = slideShowService.findAllSlideShow(pageIndex,pageSize);
		model.addAttribute("pageBean", pageBean);
		return "backMangerSlideShowIndex";
	}
	@RequestMapping("/getAddSlideShow")
	public String getAddSlideShow() {
		return "backMangerAddSlideShow";
	}
	@RequestMapping("/addSlideShow")
	public String addSlideShow(SlideShow slideShow) {
		Date date = new Date();
		slideShow.setCreate_time(date);
		slideShowService.addSlideShow(slideShow);
		return "redirect:/backgroundslideshow/findAllSlideShow.action";
	}
	@RequestMapping("/updateStatus")
	public String updateStatus(Integer id,Integer status) {
		slideShowService.updateStatus(id,status);
		return "redirect:/backgroundslideshow/findAllSlideShow.action";
	}
	@RequestMapping("/deleteSlideShow")
	public String deleteSlideShow(Integer id) {
		Integer result = slideShowService.deleteSlideShow(id); 
		return "redirect:/backgroundslideshow/findAllSlideShow.action";
	}
	@RequestMapping("/deleteAll")
	public String deleteAll(int [] selectedIds) {
		for (int i : selectedIds) {
			System.out.println("-----------------"+i);
		}
		System.out.println("----------------------"+selectedIds);
		slideShowService.deleteAll(selectedIds);
		return "redirect:/backgroundslideshow/findAllSlideShow.action";
	}
	public void SelectAllSlideShows() {
		slideShowService.selectAllSlideShows();
	}
	
}