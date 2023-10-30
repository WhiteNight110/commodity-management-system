package com.eshop.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.eshop.entity.Userinfo;
import com.eshop.util.BaseDao;
import com.eshop.dao.UserinfoDao;

public class UserinfoDaoImpl implements UserinfoDao{

	@Override
	public Userinfo selectByUsernameAndUserpwd(Userinfo userinfo) {
		
		String sql = "select * from userinfo where username=? and userpwd=?";
		
		Userinfo getUser = null;
		
		BaseDao baseDao = new BaseDao();
		
		baseDao.open();
		
		ResultSet rs = baseDao.execDQL(sql, userinfo.getUsername(),userinfo.getUserpwd());
		
		try {
			if(rs.next()) {
				getUser = new Userinfo(rs.getInt("userid"),
						userinfo.getUsername(),"******");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		baseDao.close();
		
		return getUser;
		
	}

	@Override
	public int insert(Userinfo userinfo) {
		String sql = "INSERT userinfo(username,userpwd) values(?,?)";
		
		int count = -1;
		
		BaseDao baseDao = new BaseDao();
		
		baseDao.open();
		
		count = baseDao.execDML(sql,userinfo.getUsername(),userinfo.getUserpwd());
			
		baseDao.close();
		
		return count;
	}

	@Override
	public boolean selectUsername(String username) {
		String sql = "select * from userinfo where username='"+username+"'";
		
		BaseDao baseDao = new BaseDao();
		
		baseDao.open();
		
		ResultSet rs = baseDao.execDQL(sql);
			
		
		boolean flag = false;
		try {
			if(rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		baseDao.close();
		
		return flag;
	}
	
}
