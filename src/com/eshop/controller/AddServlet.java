package com.eshop.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.eshop.service.FoodService;
import com.eshop.service.FtypeService;
import com.eshop.service.impl.FoodServiceImpl;
import com.eshop.service.impl.FtypeServiceImpl;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/add")
@MultipartConfig
public class AddServlet extends HttpServlet {
	FoodService foodService = new FoodServiceImpl();
	FtypeService ftypeService = new FtypeServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding( "utf-8");
		response.setContentType( "text/ html; charset=UTF-8");
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		String username = null;
		String password = null;
		int addMsg = -1;
		if(isMultipart) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items;
			try {
				items = upload.parseRequest(request);
				Iterator<FileItem> iter = items.iterator();
				int tid = -1;
				String fname = null;
				String fpic = null;
				Double fprice = null;
				int forder = -1;
				String fdesc = null;
				while(iter.hasNext()) {
					FileItem item = iter.next();
					String itemName = item.getFieldName();
					//判断是普通数据还是文件
					if(item.isFormField()) {
						//数据
						if(itemName.equals("tid")) {
							tid = Integer.parseInt(item.getString("UTF-8"));
							System.out.println("tid = "+tid);
						}else if(itemName.equals("fname")) {
							fname = item.getString("UTF-8");
						}else if(itemName.equals("fprice")) {
							fprice = Double.parseDouble(item.getString("UTF-8"));
						}else if(itemName.equals("forder")) {
							forder = Integer.parseInt(item.getString("UTF-8"));
						}else if(itemName.equals("fdesc")) {
							fdesc = item.getString("UTF-8");
						}else if(itemName.equals("username")) {
							username = item.getString("UTF-8");
						}else if(itemName.equals("password")) {
							password = item.getString("UTF-8");
						}
					}else {
						//文件上传
						//文件名
						fpic = UUID.randomUUID().toString().replaceAll("-", "")+"_"+item.getName();
						System.out.println("filename = "+fpic);
						//定义文件路径
						String path = request.getServletContext().getRealPath("foods");
						System.out.println("path = "+path);
						File file = new File(path,fpic);
						//上传
						item.write(file);	
					}
				}
				boolean flag = foodService.add(tid, fname, fpic, fprice, forder, fdesc);
				if(flag) {
					addMsg = 1;//"添加成功"
				}else {
					addMsg = 0;//"添加失败"
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}else {
			addMsg = 0;//"添加失败"
		}
		System.out.println("addMsg="+addMsg);
		request.setAttribute("addMsg", addMsg);
		request.getRequestDispatcher("/account?username="+username+"&password="+password+"&cp=1&selected=0").forward(request, response);
	}

}
