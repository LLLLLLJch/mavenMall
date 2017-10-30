package com.situ.mall.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.mall.dao.UserDao;
import com.situ.mall.pojo.User;
import com.situ.mall.service.UserService;
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public Boolean findUserByNameAndPassword(String userName, String password) {
		return userDao.findUserByNameAndPassword(userName,password)>0;
	}

	@Override
	public Integer findUserIdByUserName(String name) {
		return userDao.findUserIdByUserName(name);
	}

	@Override
	public Integer addUser(User user) {
		return userDao.addUser(user);
	}

	@Override
	public User findUserByNameAndPasswordAdmin(String userName, String password) {
		return userDao.findUserByNameAndPasswordAdmin(userName, password);
	}

	@Override
	public String findUserNameByUsrId(Integer user_id) {
		return userDao.findUserNameByUsrId(user_id);
	}

	@Override
	public int findAllUserCount() {
		return userDao.findAllUserCount();
	}

}
