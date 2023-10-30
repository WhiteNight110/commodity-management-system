package com.eshop.service.impl;

import java.util.List;

import com.eshop.entity.Ftype;
import com.eshop.dao.FoodDao;
import com.eshop.dao.FtypeDao;
import com.eshop.dao.impl.FoodDaoImpl;
import com.eshop.dao.impl.FtypeDaoImpl;
import com.eshop.service.FtypeService;

public class FtypeServiceImpl implements FtypeService{
	
	private FoodDao foodDao = new FoodDaoImpl();
	private FtypeDao ftypeDao = new FtypeDaoImpl();

	@Override
	public List<Ftype> getAllWithFood() {
		
		List<Ftype> list = ftypeDao.selectAll();
		
		for(int i=0;i<list.size();i++) {
			Ftype ftype = list.get(i);
			ftype.setFoodList(foodDao.selectByTid(ftype.getTid()));
		}
		
		
		
		return list;
	}

	@Override
	public List<Ftype> getAll() {
		return ftypeDao.selectAll();
	}

	
	
}
