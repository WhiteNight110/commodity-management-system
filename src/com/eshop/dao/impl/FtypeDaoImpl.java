package com.eshop.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eshop.entity.Ftype;
import com.eshop.util.BaseDao;
import com.eshop.dao.FtypeDao;

public class FtypeDaoImpl implements FtypeDao{

	@Override
	public Ftype selectByTid(int tid) {
		String sql = "select * from ftype where tid=?";
		
		Ftype ftype = null;
		
		BaseDao baseDao = new BaseDao();
		
		baseDao.open();
		
		ResultSet rs = baseDao.execDQL(sql, tid);
		
		try {
			if(rs.next()) {
				ftype = new Ftype(rs.getInt("tid"),
							rs.getString("tname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		baseDao.close();
		
		return ftype;
	}

	@Override
	public List<Ftype> selectAll() {
		String sql = "select * from ftype";
		
		List<Ftype> list = new ArrayList<Ftype>();
		
		BaseDao baseDao = new BaseDao();
		
		baseDao.open();
		
		ResultSet rs = baseDao.execDQL(sql);
		
		try {
			while(rs.next()) {
				list.add(new Ftype(
						rs.getInt("tid"),
						rs.getString("tname")
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		baseDao.close();
		
		return list;
	}

}
