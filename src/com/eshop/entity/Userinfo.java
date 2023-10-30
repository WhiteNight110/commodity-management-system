package com.eshop.entity;

public class Userinfo {
	private Integer userid;
	private String userpwd;
	private String username;
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Userinfo(Integer userid, String username, String userpwd) {
		super();
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
	}
	public Userinfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Userinfo [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + "]";
	}
	
	
}
