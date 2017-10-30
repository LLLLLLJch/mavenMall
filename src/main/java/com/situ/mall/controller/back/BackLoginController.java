package com.situ.mall.controller.back;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.situ.mall.pojo.User;
import com.situ.mall.service.UserService;
import com.sun.org.apache.xpath.internal.operations.Mod;

@Controller
@RequestMapping("/getBackLogin")
public class BackLoginController {

	@Autowired
	private UserService userService;
	
	@RequestMapping("/gotoLoginPage")
	public String gotoLoginPage() {
		return "login";
		
	}
	@RequestMapping("/login")
	public String login(HttpServletRequest request,String userName,String password) {
		User user = userService.findUserByNameAndPasswordAdmin(userName, password);
		if(user != null){
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			List<User> onlineList = (List<User>) request.getServletContext().getAttribute("onlineList");
			onlineList.add(user);
			return "redirect:/index/goIndex.action";
		}
		return null;
		
	}
	@RequestMapping("/onlineUser")
	public String onlineUser(HttpServletRequest request,Model model) {
		List<User> onlineList = (List<User>) request.getServletContext().getAttribute("onlineList");
		model.addAttribute("onlineList",onlineList);
		return "olineUser";
	}
	
	@RequestMapping("/goexixt")
	public String goexixt(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null){
			User user = (User) session.getAttribute("user");
			session.invalidate();
		}
		return "";
	}
}
