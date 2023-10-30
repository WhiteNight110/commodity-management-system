package com.eshop.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDao {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	
	private static final String URL = "jdbc:mysql://localhost:3306/webdatabase?useSSL=false";
	private static final String USERNAME = "root";
	private static final String PWD = "root";
	
	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//打开数据库连接
	public void open() {
		
		try {
			this.conn = DriverManager.getConnection(URL,USERNAME,PWD);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private void createStatement(String sql,Object...param) {
		try {
			this.ps = this.conn.prepareStatement(sql);
			
			for(int i=0;i<param.length;i++) {
				this.ps.setObject(i+1, param[i]);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	//执行dql
	
	public ResultSet execDQL(String sql,Object...param) {
		
		try {
			this.createStatement(sql,param);
			
			this.rs = this.ps.executeQuery();
			
			return this.rs; 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return null;
	}
	
	
	//执行dml
	
	public int execDML(String sql,Object...param) {
		
		try {
			
			this.createStatement(sql,param);
			
			
			return this.ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return -1;
	}	
	
	
	
		
	//关闭数据库连接
	
	public void close() {
		
		if(this.rs!=null) {
			try {
				this.rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				this.rs = null;
			}
		}
		
		
		if(this.ps!=null) {
			try {
				this.ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				this.ps = null;
			}
		}
		
		if(this.conn!=null) {
			try {
				this.conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				this.conn = null;
			}
		}
	}
	
	
}
