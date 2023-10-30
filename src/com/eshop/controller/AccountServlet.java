package com.eshop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eshop.service.FoodService;
import com.eshop.service.FtypeService;
import com.eshop.service.impl.FoodServiceImpl;
import com.eshop.service.impl.FtypeServiceImpl;
import com.eshop.entity.Food;
import com.eshop.entity.Userinfo;
import com.eshop.service.UserinfoService;
import com.eshop.service.impl.UserinfoServiceImpl;
import com.eshop.util.PageDao;


@WebServlet("/account")
public class AccountServlet extends HttpServlet {
	private UserinfoService userinfoService = new UserinfoServiceImpl();
	private FoodService foodService = new FoodServiceImpl();
	private FtypeService ftypeService = new FtypeServiceImpl();
	private PageDao pageDao = new PageDao();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String userpwd = request.getParameter("password");
		String selected = request.getParameter("selected");
		int cp = Integer.parseInt(request.getParameter("cp"));
		Userinfo user = userinfoService.login(new Userinfo(null, username, userpwd));
		HttpSession session = request.getSession();
		if(user!=null) {
			if(selected.equals("0")) {
				List<Food> list = foodService.pageSelectWithFtype(10*(cp-1));
				List<Food> allList = foodService.getAll();
				int page = pageDao.countPage(allList);
				int count = allList.size();
				session.setAttribute("username", username);
				session.setAttribute("password", userpwd);
				request.setAttribute("list", list);//展示的10条分页列表，food属性中需要带ftype
				request.setAttribute("page", page);//一共几页
				request.setAttribute("cp", cp);//当前几页
				request.setAttribute("count", count);//一共多少条数据
				request.setAttribute("tlist", ftypeService.getAll());//总类型列表
				request.setAttribute("selected", 0);//是否是选择后的 默认是0
				request.getRequestDispatcher("/main.jsp").forward(request, response);
			}else {//处理选择后的列表的数据
				List<Food> allList = (List<Food>) request.getSession().getAttribute("allList");
				int page = pageDao.countPage(allList);
				int count = allList.size();
				request.setAttribute("username", username);
				request.setAttribute("password", userpwd);
				List<Food> list = pageDao.page(allList, cp);
				request.setAttribute("list", list);//展示的10条分页列表，food属性中需要带ftype
				request.setAttribute("page", page);//一共几页
				request.setAttribute("cp", cp);//当前几页
				request.setAttribute("count", count);//一共多少条数据
				request.setAttribute("tlist", ftypeService.getAll());//总类型列表
				request.setAttribute("selected", 1);//是否是选择后的
				request.getRequestDispatcher("/main.jsp").forward(request, response);
				
				
			}
		}else {
			request.setAttribute("isLogin", 0);
			request.setAttribute("username", username);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
