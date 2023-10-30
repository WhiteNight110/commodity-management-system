<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

    <!--font-awesome 核心CSS 文件-->
    <link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.4.1.js"></script>
    
    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>

	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="bootstrap/js/bootstrap.js"></script>
  
    <!-- 引入 font-awesome -->
	
	<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	

	<link rel="stylesheet" type="text/css" href="bootstrap/login.css">
	
	
	
    
</head>
<body>
	<div style="position: relative;">
		
		<div id="loginMsg" class="alert alert-danger alert-dismissible hide custom-alert" role="alert" style="position: absolute; left: 50%;top:0; transform: translate(-50%); text-align: center;" > 
		  <span class="text-center"><strong>Warning!</strong> 用户名或密码错误</span>
		</div>
	    <c:if test="${isLogin == 0}">
			<script type="text/javascript">
				$("#loginMsg").addClass("show");
		        window.setTimeout(function(){
		            $("#loginMsg").removeClass("show");
		        },1500);//显示的时间
			</script>
	    </c:if>
		<div class="container">
		    <div class="form row" >
				
		        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" action="<%=request.getContextPath()%>/account" style = "position = fixed">
		        	<input class="hide" name="cp" value="1"/>
		        	<input class="hide" name="selected" value="0"/>
		            <h3 class="form-title">登录</h3>
		            <div class="col-sm-9 col-md-9">
		                <div class="form-group">
		                    <!--        用户名图标和用户名输入框            -->
		                    <i class="fa fa-user" aria-hidden="true"></i>
		                    <input class="form-control" type="text" name="username" id="username" placeholder="请输入用户名" required autofocus 
		                    	value=${username==null? "":username } >
		                </div>
		                    <!--        密码图标和密码输入框                -->
		                <div class="form-group">
		                    <i class="fa fa-key" aria-hidden="true"></i>
		                    <input class="form-control " type="password" name="password" id="password" placeholder="请输入密码" required>
		                </div>
		                <!--        用超链接跳转到注册页面               -->
		                <div class="form-group">
		                    <br>
		                    <a href="register.jsp?regMsg=-1">没有账号？立即注册</a>
		                </div>
		                    <!--         登录按钮           -->
		                <div class="form-group" id="loginBtn">
		                    <input type="submit" value="登录" class="btn btn-success pull-right">
		                </div>
		                
		                
		                
		            </div>
		            
		        </form>
		        
		    </div>
		</div>
	</div>
	
</body>
</html>
