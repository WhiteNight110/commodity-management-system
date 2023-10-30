package com.eshop.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.eshop.entity.Food;
import com.eshop.entity.Ftype;
import com.eshop.dao.FoodDao;
import com.eshop.dao.FtypeDao;
import com.eshop.dao.impl.FoodDaoImpl;
import com.eshop.dao.impl.FtypeDaoImpl;
import com.eshop.service.FoodService;

public class FoodServiceImpl implements FoodService{
	
	private FoodDao foodDao = new FoodDaoImpl();
	private FtypeDao ftypeDao = new FtypeDaoImpl();
	@Override
	public List<Food> pageSelectWithFtype(int cp){
		List<Food> list = foodDao.pageSelect(cp);
		Map<Integer,Ftype> map = new HashMap<Integer, Ftype>();
		
		for(int i=0;i<list.size();i++) {
			Food f = list.get(i);
			int tid = f.getTid();
			
			Ftype ftype = map.get(tid);
			
			if(ftype == null) {
				ftype = ftypeDao.selectByTid(tid);
				map.put(tid,ftype);
			}
			
			f.setFtype(ftype);
			
		}
		
				
		return list;
	}
	
	@Override
	public List<Food> getAllWithFtype() {
		
		List<Food> list = foodDao.selectAll();
		Map<Integer,Ftype> map = new HashMap<Integer, Ftype>();
		
		int count = 0;
		
		for(int i=0;i<list.size();i++) {
			Food f = list.get(i);
			int tid = f.getTid();
			
			Ftype ftype = map.get(tid);
			
			if(ftype == null) {
				count++;
				ftype = ftypeDao.selectByTid(tid);
				map.put(tid,ftype);
			}
			
			f.setFtype(ftype);
			
		}
		
		System.out.println("有"+count+"条食物数据");
				
		return list;
	}

	@Override
	public boolean add(int tid,String fname,String fpic,Double fprice,int forder,String fdesc) {
		int count = foodDao.insert(new Food(null,tid,fname,fpic,fprice,forder,fdesc,null,null));
		if(count>0)
			return true;
		return false;
	}

	@Override
	public boolean remove(int fid) {
		int count = foodDao.delete(fid);
		if(count>0)
			return true;
		return false;
	}

	@Override
	public Food getByFid(int fid) {
		return foodDao.selectByFid(fid);
	}

	@Override
	public List<Food> getAll() {
		return foodDao.selectAll();
	}

	@Override
	public List<Food> search(String key, String value) {
		if(value.equals("")) return this.foodDao.selectAll();
		
		return this.foodDao.search(key, value);
	}

	@Override
	public int update(Food food) {
		return foodDao.update(food);
	}

	@Override
	public List<Food> combineQuery(String fname, String ftype, String fprice, String forder, String fdesc) {
		return foodDao.combineQuery(fname,ftype,fprice,forder,fdesc);
	}
	
}
