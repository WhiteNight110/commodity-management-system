package com.eshop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eshop.service.FoodService;
import com.eshop.service.FtypeService;
import com.eshop.service.impl.FoodServiceImpl;
import com.eshop.service.impl.FtypeServiceImpl;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	FoodService foodService = new FoodServiceImpl();
	FtypeService ftypeService = new FtypeServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fid = request.getParameter("fid");
		int delMsg = -1;
		if(fid==null||fid.equals("")) {
			delMsg = 0;
		}else {
			boolean flag = foodService.remove(Integer.parseInt(fid));
			if(flag) {
				delMsg = 1;
			}else {
				delMsg = 0;
			}
		}
		request.setAttribute("delMsg", delMsg);
		request.getRequestDispatcher("/account?username="+request.getParameter("username")+"&password="+request.getParameter("password")+"&cp=1&selected=0").forward(request, response);
	}

}
