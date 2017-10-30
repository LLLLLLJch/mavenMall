package com.situ.mall.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.situ.mall.pojo.User;

public class LoginFilter implements Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		 HttpServletRequest req = (HttpServletRequest) request;
	       HttpServletResponse resp = (HttpServletResponse) response;
	       String uri = req.getRequestURI();
	       // /Java1705Web/login.jsp   /Java1705Web/loginFilter
	       System.out.println(uri);
	       System.out.println("11111111111111111111111111111");
	       String requestPath = uri.substring(uri.lastIndexOf("/") + 1, uri.length());
	       if (	 requestPath.equals("checkImg")|| requestPath.equals("login.action")
	    		   || requestPath.equals("login.jsp")
	    		   || requestPath.equals("gotoLoginPage.action")) {
	           //直接放行
	           chain.doFilter(request, response);
	       } else {
	    	   HttpSession session = req.getSession();
				User user = (User) session.getAttribute("user");
				if (user == null) {
					resp.sendRedirect(req.getContextPath() + "/getBackLogin/gotoLoginPage.action");
					return;
				} else {
					chain.doFilter(request, response);
				}
	       }
	}

	@Override
	public void destroy() {
		
	}

}
