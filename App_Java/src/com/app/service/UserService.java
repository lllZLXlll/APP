package com.app.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.UserDao;

/**
 * 
 * 用户信息service
 *
 */
@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public Map<String, Object> queryUserInfo(){
		return userDao.queryUserInfo();
	}

	public Map<String, Object> queryUserInfoById(Long uid) {
		return userDao.queryUserInfoById(uid);
	}
	
}
