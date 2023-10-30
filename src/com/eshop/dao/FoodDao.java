package com.eshop.dao;

import java.util.List;

import com.eshop.entity.Food;

public interface FoodDao {
	List<Food> selectAll();
	List<Food> pageSelect(int cp);
	List<Food> selectByTid(int tid);
	Food selectByFid(int fid);
	int insert(Food food);
	int delete(int fid);
	int update(Food food);
	List<Food> search(String key,String value);
	List<Food> combineQuery(String fname, String ftype, String fprice, String forder, String fdesc);
}
