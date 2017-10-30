package com.situ.mall.controller.front;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.mall.pojo.Cart;
import com.situ.mall.pojo.Product;
import com.situ.mall.service.CartService;
import com.situ.mall.service.ProductMangerService;
import com.situ.mall.service.UserService;
import com.situ.mall.vo.BuyCartVO;

@Controller
@RequestMapping("/getCart")
public class CartControllerFront {

	@Autowired
	private ProductMangerService productMangerService;
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;

	@RequestMapping("/goCart.shtml")
	public String goCart(String username, Model model) {
		Integer userId = userService.findUserIdByUserName(username);
		List<Cart> list = cartService.findCartByUserId(userId);
		for (Cart cart : list) {
			Product product = productMangerService.findProductByIdAddCart(cart.getProduct_id());
			cart.setProduct(product);
			System.out.println("-------------------------" + cart.getProduct_id());
			System.out.println("-------------------" + product);
		}
		model.addAttribute("list", list);
		return "cart";
	}

	@RequestMapping("/deleteCart.shtml")
	public String deleteCart(Integer id, String username) {
		System.out.println("-----------------------" + username);
		Integer result = cartService.deleteCart(id);
		return "redirect:/getCart/goCart.shtml?username=" + username + "";
	}

	@RequestMapping("/deleteCartNoUserName.shtml")
	public String deleteCartNoUserName(Integer productId, Model model, HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println("----------------------" + productId);
		// springmvc
		ObjectMapper objectMapper = new ObjectMapper();
		// 只有对象里面不是null的才转换
		objectMapper.setSerializationInclusion(Inclusion.NON_NULL);

		BuyCartVO buyCartVO = null;
		Cookie[] cookies = request.getCookies();
		// 1.如果cookie有这个购物车对象，那就从cookie里面取出这个购物车对象
		if (null != cookies && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if ("buy_cart_cookie".equals(cookie.getName())) {
					// 之前已经有购物车
					// "{\"items\":[{\"product\":{\"id\":45},\"amount\":1}],\"productId\":45}"
					String value = cookie.getValue();
					try {
						buyCartVO = objectMapper.readValue(value, BuyCartVO.class);

					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}

		if (null != productId) {

			buyCartVO.deleteCartItem(productId);
			buyCartVO.setProductId(productId);

			// 把购物车对象BuyCartVO以json形式写到cookie里面
			StringWriter stringWriter = new StringWriter();
			try {
				objectMapper.writeValue(stringWriter, buyCartVO);
			} catch (IOException e) {
				e.printStackTrace();
			}

			// 将购物车json数据放到cookie里面
			Cookie cookie = new Cookie("buy_cart_cookie", stringWriter.toString());
			// 默认关闭浏览器cookie销毁
			cookie.setMaxAge(60 * 60 * 24);

			cookie.setPath("/");

			// 将cookie发送给浏览器
			response.addCookie(cookie);
		}
		return "redirect:/getDetailPage/getDetailNoUserName.shtml";
	}

	@RequestMapping("/addOneProduct.shtml")
	public void addOneProduct(Integer cartId) {
		Cart cart = cartService.findCheckedCartById(cartId);
		System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeeeeeee" + cartId);
		cartService.addOneProduct(cart.getQuantity(), cartId);
	}

	@RequestMapping("/subOneProduct.shtml")
	public void subOneProduct(Integer cartId) {
		Cart cart = cartService.findCheckedCartById(cartId);
		cartService.subOneProduct(cart.getQuantity(), cartId);
	}

	@RequestMapping("/cleanCartHaveUserName.shtml")
	@ResponseBody
	public boolean cleanCartHaveUserName(String username) {
		int userId = userService.findUserIdByUserName(username);
		boolean isSuccess = cartService.deleteCartByUserId(userId);
		return isSuccess;
	}

	@RequestMapping("/cleanCartNoUserName.shtml")
	@ResponseBody
	public boolean cleanCartNoUserName(HttpServletResponse response) {
		Cookie cookie = new Cookie("buy_cart_cookie", null);
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		boolean isSuccess = true;
		return isSuccess;

	}
}
