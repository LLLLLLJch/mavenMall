package com.situ.mall.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.situ.mall.pojo.User;

public class OnlineContextListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// 创建在线管理员集合，每当有管理员登录就往里面添加
		List<User> onlineList = new ArrayList<User>();
		ServletContext servletContext = sce.getServletContext();
		servletContext.setAttribute("onlineList", onlineList);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub

	}

}
