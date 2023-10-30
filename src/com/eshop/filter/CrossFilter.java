package com.eshop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class CrossFilter implements Filter {

	
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub

		 HttpServletRequest httpServletRequest = (HttpServletRequest) req;
         HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
         System.out.println("拦截请求: " + httpServletRequest.getServletPath());
         httpServletResponse.setHeader("Access-Control-Allow-Origin", "*");
         httpServletResponse.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
         httpServletResponse.setHeader("Access-Control-Max-Age", "0");
         httpServletResponse.setHeader("Access-Control-Allow-Headers",
                 "Origin, No-Cache, X-Requested-With, If-Modified-Since, Pragma, Last-Modified, Cache-Control, Expires, Content-Type, X-E4M-With,userId,token");
         httpServletResponse.setHeader("Access-Control-Allow-Credentials", "true");
         httpServletResponse.setHeader("XDomainRequestAllowed", "1");
		chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig conf) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
//    /**
//     * Default constructor. 
//     */
//    public CrossFilter() {
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see Filter#destroy()
//	 */
//	public void destroy() {
//		// TODO Auto-generated method stub
//	}
//
//	/**
//	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
//	 */
//	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
//		System.out.println("过滤器");
//		
//		HttpServletRequest request = (HttpServletRequest)req;
//		
//		HttpServletResponse response = (HttpServletResponse)res;
//		
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("application/json;charset=utf-8");
//		response.addHeader("Access-Control-Allow-Origin",request.getHeader("Origin"));
//		response.addHeader("Access-Control-Allow-Credentials", "true");
//		//跨域
//		response.addHeader("Access-Control-Allow-Headers", 
//				"Accept,"
//				+ "Origin,"
//				+ "No-Cache,"
//				+ "X-Requested-With,"
//				+ "If-Modified-Since,"
//				+ "Pragma,"
//				+ "Last-Modified,"
//				+ "Cache-Control,"
//				+ "Expires,"
//				+ "Content-Type,"
//				+ "X-E4M-With");
//		
//		chain.doFilter(req, res);
//	}
//
//	/**
//	 * @see Filter#init(FilterConfig)
//	 */
//	public void init(FilterConfig fConfig) throws ServletException {
//		// TODO Auto-generated method stub
//	}

}
