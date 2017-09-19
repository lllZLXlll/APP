package com.app.dao;

import java.util.Map;

public interface UserDao {
	public Map<String, Object> queryUserInfo();

	public Map<String, Object> queryUserInfoById(Long uid);
}
