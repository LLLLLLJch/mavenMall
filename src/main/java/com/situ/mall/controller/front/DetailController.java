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
import com.situ.mall.vo.CartItemVO;

@Controller
@RequestMapping("/getDetailPage")
public class DetailController {

	@Autowired
	private ProductMangerService productMangerService;
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;

	@RequestMapping("/getDetail.shtml")
	@ResponseBody
	public Boolean getDetail(String username, Integer quantity, Integer product_id, Model model) {
		Cart cart = new Cart();
		Integer userId = userService.findUserIdByUserName(username);

		List<Cart> list = cartService.findCartAndProductByUserId(userId);
		Product product = productMangerService.findProductByIdAddCart(product_id);
		for (Cart existCart : list) {
			if (product.getName().equals(existCart.getProduct().getName())) {
				Boolean isSuccess = cartService.update(existCart.getQuantity(), quantity, product_id);
				return isSuccess;
			}
		}
		cart.setProduct(product);
		cart.setUser_id(userId);
		cart.setChecked(1);
		cart.setProduct_id(product_id);
		cart.setQuantity(quantity);
		Boolean isSuccess = cartService.add(cart);
		return isSuccess;

	}

	@RequestMapping("/getDetailNoUserName")
	public String getDetailNoUserName(Integer quantity, Integer productId, Model model, HttpServletRequest request,
			HttpServletResponse response) {
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
		// 2.如果cookie没有这个购物车对象,才需要new BuyCartVO
		if (buyCartVO == null) {
			buyCartVO = new BuyCartVO();
		}

		// 把购物项放到购物车里面
		if (null != productId) {
			Product productTemp = productMangerService.findById(productId);
			Product product = new Product();
			product.setId(productId);
			product.setStock(productTemp.getStock());
			CartItemVO cartItemVO = new CartItemVO();
			cartItemVO.setProduct(product);
			cartItemVO.setQuantity(quantity);

			buyCartVO.add(cartItemVO);
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

		// 放到域对象中返回到前端展示的这个购物车，需要将Product对象填满数据才行
		List<CartItemVO> items = buyCartVO.getItems();
		for (CartItemVO item : items) {
			Product product = productMangerService.findById(item.getProduct().getId());
			item.setProduct(product);
		}

		model.addAttribute("buyCartVO", buyCartVO);

		return "cart_cookie";
	}

	@RequestMapping("/getDetailHaveUserName.shtml")
	@ResponseBody
	public boolean getDetailHaveUserName(String username, Integer quantity, Integer productId, Model model) {
		Integer userId = userService.findUserIdByUserName(username);
		List<Cart> list = cartService.findCartByUserId(userId);
		Cart cart = new Cart();
		boolean isSuccess = false;
		if (list == null || list.size() == 0) {
			Product product = productMangerService.findProductByIdAddCart(productId);
			cart.setUser_id(userId);
			cart.setProduct(product);
			cart.setQuantity(quantity);
			isSuccess = cartService.add(cart);
			return isSuccess;
		} else {
			for (Cart exixtcart : list) {
				if (productId == exixtcart.getProduct_id()) {
					isSuccess = cartService.update(exixtcart.getQuantity(), quantity,productId );
					return isSuccess;
				}
			}
		}
		Product product = productMangerService.findProductByIdAddCart(productId);
		cart.setUser_id(userId);
		cart.setProduct(product);
		cart.setProduct_id(productId);
		cart.setQuantity(quantity);
		isSuccess = cartService.add(cart);
		return isSuccess;
		
	}

}
