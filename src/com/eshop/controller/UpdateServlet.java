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

import com.eshop.entity.Food;
import com.eshop.entity.Ftype;
import com.eshop.service.FoodService;
import com.eshop.service.FtypeService;
import com.eshop.service.impl.FoodServiceImpl;
import com.eshop.service.impl.FtypeServiceImpl;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/update")
@MultipartConfig
public class UpdateServlet extends HttpServlet {
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
		int modMsg = -1;
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		String username = null;
		String password = null;
		if(isMultipart) {
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> items;
			try {
				items = upload.parseRequest(request);
				Iterator<FileItem> iter = items.iterator();
				int fid = -1;
				int tid = -1;
				String fname = null;
				String fpic0 = null;
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
						if(itemName.equals("fid")) {
							fid = Integer.parseInt(item.getString("UTF-8"));
							System.out.println("修改后的fid="+fid);
						}else if(itemName.equals("tid")) {
							tid = Integer.parseInt(item.getString("UTF-8"));
							System.out.println("修改后的tid="+tid);
						}else if(itemName.equals("fname")) {
							fname = item.getString("UTF-8");
							System.out.println("修改后的fname="+fname);
						}else if(itemName.equals("fprice")) {
							fprice = Double.parseDouble(item.getString("UTF-8"));
							System.out.println("修改后的fprice="+fprice);
						}else if(itemName.equals("forder")) {
							forder = Integer.parseInt(item.getString("UTF-8"));
							System.out.println("修改后的forder="+forder);
						}else if(itemName.equals("fdesc")) {
							fdesc = item.getString("UTF-8");
							System.out.println("修改后的fdesc="+fdesc);
						}else if(itemName.equals("fpic0")) {
							fpic0 = item.getString("UTF-8");
						}else if(itemName.equals("username")) {
							username = item.getString("UTF-8");
						}else if(itemName.equals("password")) {
							password = item.getString("UTF-8");
						}
					}else {
						//文件上传
						//文件名
						fpic = item.getName();
						System.out.println("filename = "+fpic);
						if(fpic.equals("")||fpic==null) {
						}else {
							//定义文件路径
							String path = request.getServletContext().getRealPath("foods");
							System.out.println("path = "+path);
							File file = new File(path,fpic);
							//上传
							item.write(file);
						}
					}
				}
				System.out.println("修改前的fpic="+fpic0);
				if(fpic==null||fpic.equals("")) fpic = fpic0.substring(1+fpic0.lastIndexOf("/"));
				System.out.println("forder="+forder+"fdesc"+fdesc+" fpic="+fpic);
				int flag = foodService.update(new Food(fid,tid,fname,fpic,fprice,forder,fdesc,null,null));
				if(flag!=-1) {
					modMsg = 1;
				}else {
					modMsg = 0;
				}
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}else {
			modMsg = 0;
		}
		System.out.println("modMsg="+modMsg);
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setHeader("Expires", "0"); // Proxies

		request.setAttribute("modMsg", modMsg);
		request.getRequestDispatcher("/account?username="+username+"&password="+password+"&cp=1&selected=0").forward(request, response);
	}

}
