package com.eshop.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.eshop.entity.Food;
import com.eshop.entity.Ftype;
import com.eshop.util.BaseDao;
import com.eshop.dao.FoodDao;
import com.eshop.dao.FtypeDao;

public class FoodDaoImpl implements FoodDao{
	FtypeDao tdi = new FtypeDaoImpl();
	@Override
	public Food selectByFid(int fid) {
		String sql = "select * from food where fid=?";
		
		Food food = null;
		
		BaseDao baseDao = new BaseDao();
		
		baseDao.open();
		
		ResultSet rs = baseDao.execDQL(sql,fid);
		
		try {
			if(rs.next()) {
				food = new Food(
						rs.getInt("fid"),
						rs.getInt("tid"),
						rs.getString("fname"),
						rs.getString("fpic"),
						rs.getDouble("fprice"),
						rs.getInt("forder"),
						rs.getString("fdesc"),
						rs.getString("fregtime"),null
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		baseDao.close();
		
		return food;
	}
	
	@Override
	public List<Food> selectAll() {
		String sql = "select * from food";
		
		List<Food> list = new ArrayList<Food>();
		
		BaseDao baseDao = new BaseDao();
		
		baseDao.open();
		
		ResultSet rs = baseDao.execDQL(sql);
		
		try {
			while(rs.next()) {
				list.add(new Food(
						rs.getInt("fid"),
						rs.getInt("tid"),
						rs.getString("fname"),
						rs.getString("fpic"),
						rs.getDouble("fprice"),
						rs.getInt("forder"),
						rs.getString("fdesc"),
						rs.getString("fregtime"),null
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		baseDao.close();
		
		return list;
		
	}
	
	@Override
	public List<Food> pageSelect(int cp) {
		String sql = "select * from food order by fid limit "+cp+", 10";
		
		List<Food> list = new ArrayList<Food>();
		
		BaseDao baseDao = new BaseDao();
		
		baseDao.open();
		
		ResultSet rs = baseDao.execDQL(sql);
		
		try {
			while(rs.next()) {
				list.add(new Food(
						rs.getInt("fid"),
						rs.getInt("tid"),
						rs.getString("fname"),
						rs.getString("fpic"),
						rs.getDouble("fprice"),
						rs.getInt("forder"),
						rs.getString("fdesc"),
						rs.getString("fregtime"),null
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		baseDao.close();
		
		return list;
		
	}

	@Override
	public List<Food> selectByTid(int tid) {
		String sql = "select * from food where tid=?";
		
		List<Food> list = new ArrayList<Food>();
		
		BaseDao baseDao = new BaseDao();
		
		baseDao.open();
		
		ResultSet rs = baseDao.execDQL(sql,tid);
		
		try {
			while(rs.next()) {
				list.add(new Food(
						rs.getInt("fid"),
						rs.getInt("tid"),
						rs.getString("fname"),
						rs.getString("fpic"),
						rs.getDouble("fprice"),
						rs.getInt("forder"),
						rs.getString("fdesc"),
						rs.getString("fregtime"),tdi.selectByTid(rs.getInt("tid"))
						));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		baseDao.close();
		
		return list;
	}

	@Override
	public int insert(Food food) {
		
		String sql = "insert food(tid,fname,fpic,fprice,forder,fdesc,fregtime) values(?,?,?,?,?,?,CURDATE())";
		int count = -1;
		
		BaseDao baseDao = new BaseDao();
		
		baseDao.open();
		
		count = baseDao.execDML(sql,food.getTid(),food.getFname(),food.getFpic(),food.getFprice(),food.getForder(),food.getFdesc());
			
		baseDao.close();
		
		return count;
	}

	@Override
	public int delete(int fid) {
		
		String sql = "delete from food where fid=?";
		
		int count = -1;
		
		BaseDao baseDao = new BaseDao();
		
		baseDao.open();
		
		count = baseDao.execDML(sql,fid);
			
		baseDao.close();
		
		return count;
	}


	@Override
	public int update(Food food) {
		//1：4可能修改的值，1个都没有--service
		//2:动态的组装sql
		//tid=?,fname=?,fpic=?,fprice=? where fid=?
		
		String sql = "update food set tid=?,fname=?,fpic=?,fprice=?,forder=?,fdesc=? where fid=?";
		
		Integer fid = food.getFid();
		
		Integer tid = food.getTid();
		String fname = food.getFname();
		String fpic = food.getFpic();
		Double fprice = food.getFprice();
		Integer forder = food.getForder();
		String fdesc = food.getFdesc();
		
		int count = -1;
		
		BaseDao baseDao = new BaseDao();
		
		baseDao.open();
		
		count = baseDao.execDML(sql,tid,fname,fpic,fprice,forder,fdesc,fid);
			
		baseDao.close();
		
		return count;
	}


	@Override
	public List<Food> search(String key, String value) {
		BaseDao baseDao = new BaseDao();
		
		baseDao.open();
		if(key.equals("ftype")) {
			String sql = "select * from ftype where tname like '%"+value+"%'";
			List<Food> list = new ArrayList<Food>();
			ResultSet trs = baseDao.execDQL(sql);//存放的是Ftype类型的数据
			try {
				while(trs.next()) {
					List<Food> tem = this.selectByTid(trs.getInt("tid"));
					for(int i = 0 ; i < tem.size() ; i++) {
						list.add(tem.get(i));
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			System.out.println("搜索key="+key+" value="+value+"结果"+list.toString());
			baseDao.close();
			
			return list;
			
		}else {
			String sql = "select * from food where "+key+" like '%"+value+"%'";
			List<Food> list = new ArrayList<Food>();
			
			ResultSet rs = baseDao.execDQL(sql);
			
			try {
				while(rs.next()) {
					list.add(new Food(
							rs.getInt("fid"),
							rs.getInt("tid"),
							rs.getString("fname"),
							rs.getString("fpic"),
							rs.getDouble("fprice"),
							rs.getInt("forder"),
							rs.getString("fdesc"),
							rs.getString("fregtime"),tdi.selectByTid(rs.getInt("tid"))
							));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("搜索key="+key+" value="+value+"结果"+list.toString());
			
			baseDao.close();
			
			return list;
		}
		
		
	}


	@Override
	public List<Food> combineQuery(String fname, String ftype, String fprice, String forder, String fdesc) {
		StringBuilder sb = new StringBuilder();
		
		if(fname!=null && !fname.equals("")) {
			sb.append("select * from food where fname like '%"+fname+"%' union ");
		}
		if(ftype!=null && !ftype.equals("")) {
			sb.append("select * from food where tid in (select tid from ftype where tname like '%"+ftype+"%') union ");
		}
		if(fprice!=null && !fprice.equals("")) {
			sb.append("select * from food where fprice like '%"+fprice+"%' union ");
		}
		if(forder!=null && !forder.equals("")) {
			sb.append("select * from food where forder like '%"+forder+"%' union ");
		}
		if(fdesc!=null && !fdesc.equals("")) {
			sb.append("select * from food where fdesc like '%"+fdesc+"%' union ");
		}
		sb.delete(sb.lastIndexOf("union"), sb.length());
		
		System.out.println(sb.toString());
		
		List<Food> list = new ArrayList<Food>();
		
		BaseDao baseDao = new BaseDao();
		
		baseDao.open();
		
		ResultSet rs = baseDao.execDQL(sb.toString());
		
		try {
			while(rs.next()) {
				list.add(new Food(
						rs.getInt("fid"),
						rs.getInt("tid"),
						rs.getString("fname"),
						rs.getString("fpic"),
						rs.getDouble("fprice"),
						rs.getInt("forder"),
						rs.getString("fdesc"),
						rs.getString("fregtime"),tdi.selectByTid(rs.getInt("tid"))
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
