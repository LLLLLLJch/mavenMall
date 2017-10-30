package com.situ.mall.dao;

import org.apache.ibatis.annotations.Param;

import com.situ.mall.pojo.User;

public interface UserDao {

	Integer findUserByNameAndPassword(@Param(value="userName")String userName, @Param(value="password")String password);

	Integer findUserIdByUserName(String name);

	Integer addUser(User user);

	User findUserByNameAndPasswordAdmin(@Param(value="userName")String userName, @Param(value="password")String password);

	String findUserNameByUsrId(Integer user_id);

	int findAllUserCount();

}
