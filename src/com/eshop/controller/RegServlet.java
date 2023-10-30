package com.eshop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eshop.entity.Userinfo;
import com.eshop.service.UserinfoService;
import com.eshop.service.impl.UserinfoServiceImpl;

/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/reg")
public class RegServlet extends HttpServlet {
	UserinfoService userinfoService = new UserinfoServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String resetpw = request.getParameter("resetpw");
		int regMsg = -1;
		boolean flag = userinfoService.selectUsername(username);
		if(flag==true) {
			//账号已存在
			regMsg = 1;
			request.setAttribute("regMsg", 1);
			System.out.println("该账号已存在");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}else {
			if(password.equals(resetpw)) {
				regMsg = userinfoService.reg(new Userinfo(null,username,password));
				System.out.println("注册成功");
				response.sendRedirect("login.jsp");
			}else {
				regMsg = 0;
				request.setAttribute("regMsg", regMsg);
				System.out.println("注册失败");
				request.getRequestDispatcher("register.jsp").forward(request, response);
			}
		}
		
	}

}
