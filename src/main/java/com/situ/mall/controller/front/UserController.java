package com.situ.mall.controller.front;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.pojo.Cart;
import com.situ.mall.pojo.Product;
import com.situ.mall.pojo.User;
import com.situ.mall.service.CartService;
import com.situ.mall.service.ProductMangerService;
import com.situ.mall.service.UserService;
import com.situ.mall.vo.BuyCartVO;
import com.situ.mall.vo.CartItemVO;

@Controller
@RequestMapping("/getLogin")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ProductMangerService productMangerService;
	@Autowired
	private CartService cartService;

	@RequestMapping("/goexist.shtml")
	public String goexist(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		String username = (String) session.getAttribute("username");
		session.invalidate();
		return "login";
	}
	
	@RequestMapping("/login.shtml")
	@ResponseBody
	public Boolean checkLogin(String userName, String password, HttpServletRequest request) {
		System.out.println("-------------------------" + userName);
		if (userName == null || userName.trim().equals("") || password == null || password.trim().equals("")) {
			return false;
		}
		System.out.println("_________________________"+userName);
		System.out.println("_________________________"+password);
		Boolean isSuccess = userService.findUserByNameAndPassword(userName, password);
		if (isSuccess) {
			HttpSession session = request.getSession(true);
			session.setAttribute("username", userName);

			// springmvc
			ObjectMapper objectMapper = new ObjectMapper();
			// 只有对象里面不是null的才转换
			objectMapper.setSerializationInclusion(Inclusion.NON_NULL);

			Cookie[] cookies = request.getCookies();
			// 1.如果cookie有这个购物车对象，那就从cookie里面取出这个购物车对象
			if (null != cookies && cookies.length > 0) {
				BuyCartVO buyCartVO = new BuyCartVO();
				for (Cookie cookie : cookies) {
					if ("buy_cart_cookie".equals(cookie.getName())) {
						// 之前已经有购物车
						String value = cookie.getValue();
						try {
							buyCartVO = objectMapper.readValue(value, BuyCartVO.class);
							System.out.println("----------------------" + buyCartVO);
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
				List<CartItemVO> list = buyCartVO.getItems();
				int userId = userService.findUserIdByUserName(userName);
				Cart cart = new Cart();
				List<Cart> existList = cartService.findCartByUserId(userId);
				if (existList == null || existList.size() == 0) {
					for (CartItemVO item : list) {
						Product product = productMangerService.findProductByIdAddCart(item.getProduct().getId());
						cart.setProduct(product);
						cart.setProduct_id(product.getId());
						cart.setUser_id(userId);
						cart.setQuantity(item.getQuantity());
						cartService.add(cart);
					}
				}else {
					for (CartItemVO item : list) {
						boolean isExist = false;
						for (Cart car : existList) {
							if (car.getProduct_id() == item.getProduct().getId()) {
								isExist = true;
								cartService.update(car.getQuantity(), item.getQuantity(), car.getProduct_id());
								break;
							}
						}
						if (isExist == false) {
							Product product = item.getProduct();
							cart.setProduct(product);
							cart.setUser_id(userId);
							cart.setProduct_id(product.getId());
							cart.setQuantity(item.getQuantity());
							cartService.add(cart);
						}
					}
				}
			}
		}
		return isSuccess;
	}

	@RequestMapping("/goLogin.shtml")
	public String goLogin(HttpServletRequest request,String relUrl,Model model) {
		System.out.println("----------------"+relUrl);
		HttpSession session = request.getSession();
		if (session.getAttribute("userName") == null) {
			model.addAttribute("relUrl", relUrl);
			return "login";
		} else {
			return "index";
		}
	}

	public void findUserIdByUserName(String name) {
		Integer userId = userService.findUserIdByUserName(name);
	}

	@RequestMapping("/goRegister")
	public String goRegister() {
		return "register";
	}

	@RequestMapping("/gotoRegister.shtml")
	@ResponseBody
	public Boolean gotoRegister(String userName, String password, String email, String phone, String question,
			String answer) {
		User user = new User(userName, password, email, phone, question, answer, 1, new Date(), new Date());
		System.out.println("_---------------------------------" + user);
		Integer result = userService.addUser(user);
		Boolean isSuccess = false;
		if (result > 0) {
			isSuccess = true;
			return isSuccess;
		}
		return isSuccess;
	}
}
