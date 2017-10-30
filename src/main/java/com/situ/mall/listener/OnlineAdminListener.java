package com.situ.mall.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.situ.mall.pojo.User;

public class OnlineAdminListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		ServletContext servletContext = session.getServletContext();
		List<User> onlineList = (List<User>) servletContext.getAttribute("onlineList");
		User user = (User) session.getAttribute("user");
		if (user != null) {
			onlineList.remove(user);
		}
		
	}

}
