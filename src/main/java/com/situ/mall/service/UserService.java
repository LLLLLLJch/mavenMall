package com.situ.mall.service;

import com.situ.mall.pojo.User;

public interface UserService {

	Boolean findUserByNameAndPassword(String userName, String password);

	Integer findUserIdByUserName(String name);

	Integer addUser(User user);

	User findUserByNameAndPasswordAdmin(String userName, String password);

	String findUserNameByUsrId(Integer user_id);

	int findAllUserCount();

}
