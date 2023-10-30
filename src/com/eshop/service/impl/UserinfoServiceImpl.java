package com.eshop.service.impl;

import com.eshop.entity.Userinfo;
import com.eshop.dao.UserinfoDao;
import com.eshop.dao.impl.UserinfoDaoImpl;
import com.eshop.service.UserinfoService;

public class UserinfoServiceImpl implements UserinfoService{
	
	private UserinfoDao userinfoDao = new UserinfoDaoImpl();
	@Override
	public Userinfo login(Userinfo userinfo) {
		return userinfoDao.selectByUsernameAndUserpwd(userinfo);
	}
	@Override
	public int reg(Userinfo userinfo) {
		return userinfoDao.insert(userinfo);
	}
	@Override
	public boolean selectUsername(String username) {
		return userinfoDao.selectUsername(username);
	}
	
	

}
