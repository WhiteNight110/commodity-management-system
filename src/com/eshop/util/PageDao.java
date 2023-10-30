package com.eshop.util;

import java.util.ArrayList;
import java.util.List;

import com.eshop.entity.Food;

public class PageDao {
	
	public int countPage(List<Food> list) {
		int len = list.size();
		int page = -1;
		page = len%10==0 ? len/10:(len/10)+1;
		return page;
	}
	public List<Food> page(List<Food> list,int n) {//返回该列表的第n页数据
		List<Food> res = new ArrayList<Food>();
		for(int i = (n-1)*10 ; i < list.size()&& i<n*10 ; i++) {
			res.add(list.get(i));
		}
		return res;
	}
}
