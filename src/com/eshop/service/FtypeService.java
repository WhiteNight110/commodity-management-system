package com.eshop.service;

import java.util.List;

import com.eshop.entity.Ftype;

public interface FtypeService {
	List<Ftype> getAllWithFood();
	List<Ftype> getAll();
}
