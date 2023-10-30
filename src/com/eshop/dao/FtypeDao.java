package com.eshop.dao;

import java.util.List;

import com.eshop.entity.Ftype;

public interface FtypeDao {
	Ftype selectByTid(int tid);
	
	List<Ftype> selectAll();
	
}
