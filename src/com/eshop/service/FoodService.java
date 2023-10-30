package com.eshop.service;

import java.util.Collection;
import java.util.List;

import com.eshop.entity.Food;

public interface FoodService {
	
	List<Food> getAllWithFtype();
	List<Food> pageSelectWithFtype(int cp);
	Food getByFid(int fid);
	List<Food> getAll();
	List<Food> search(String key,String value);
	boolean add(int tid,String fname,String fpic,Double fprice,int forder,String fdesc);
	boolean remove(int fid);
	int update(Food food);
	List<Food> combineQuery(String fname, String ftype, String fprice, String forder, String fdesc);
}
