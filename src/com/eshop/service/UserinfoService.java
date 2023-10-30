package com.eshop.service;

import com.eshop.entity.Userinfo;

public interface UserinfoService {
	Userinfo login(Userinfo userinfo);
	int reg(Userinfo userinfo);
	boolean selectUsername(String username);
}
