package com.eshop.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eshop.entity.Food;
import com.eshop.service.FoodService;
import com.eshop.service.FtypeService;
import com.eshop.service.impl.FoodServiceImpl;
import com.eshop.service.impl.FtypeServiceImpl;
import com.eshop.util.PageDao;


@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	FoodService foodService = new FoodServiceImpl();
	FtypeService ftypeService = new FtypeServiceImpl();
	private PageDao pageDao = new PageDao();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding( "utf-8");
		response.setContentType( "text/ html; charset=UTF-8");
		String key = request.getParameter("key");
		if(key==null) {
			request.getRequestDispatcher("/account?username="+request.getParameter("username")+"&password="+request.getParameter("password")+"&cp="+request.getParameter("cp")+"&selected=0").forward(request, response);
		}else {
			String value = request.getParameter("value");
			
			HttpSession session = request.getSession();
			
			List<Food> allList = this.foodService.search(key, value);//带ftype的选择后的所有数据
			List<Food> list = pageDao.page(allList, 1);//带ftype的前10条数据
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			int page = pageDao.countPage(allList);
			
			session.setAttribute("allList", allList);//把所有的数据放到session域中
			
			request.setAttribute("username", username);
			request.setAttribute("password", password);
			request.setAttribute("selected", "1");//设置是否是选择后的列表
			request.setAttribute("list", list);//当前显示的数据列表
			request.setAttribute("page", page);//一共几页
			request.setAttribute("cp", request.getParameter("cp"));//当前几页
			request.setAttribute("count", allList.size());//一共多少条数据
			request.setAttribute("tlist", ftypeService.getAll());
			request.getRequestDispatcher("/main.jsp").forward(request, response);
		}
	}

}
