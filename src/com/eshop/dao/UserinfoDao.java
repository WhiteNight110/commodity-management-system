package com.eshop.dao;

import com.eshop.entity.Userinfo;

public interface UserinfoDao {
	Userinfo selectByUsernameAndUserpwd(Userinfo userinfo);
	int insert(Userinfo userinfo);
	boolean selectUsername(String username);
}
