<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>Register</title>

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
<div class="container" style="position: relative;">
	<div id="regMsg" class="alert alert-danger alert-dismissible hide custom-alert" role="alert" style="position: absolute; left: 50%;top:0; transform: translate(-50%); text-align: center;" > 
	  <span class="text-center"><strong>Warning!</strong> 两次输入密码不一致</span>
	</div>
    <c:if test="${regMsg == 0}">
		<script type="text/javascript">
			$("#regMsg").addClass("show");
	        window.setTimeout(function(){
	            $("#regMsg").removeClass("show");
	        },1500);//显示的时间
		</script>
    </c:if>
    
    <div id="regMsg2" class="alert alert-danger alert-dismissible hide custom-alert" role="alert" style="position: absolute; left: 50%;top:0; transform: translate(-50%); text-align: center;" > 
	  <span class="text-center"><strong>Warning!</strong> 该账号已存在</span>
	</div>
    <c:if test="${regMsg == 1}">
		<script type="text/javascript">
			$("#regMsg2").addClass("show");
	        window.setTimeout(function(){
	            $("#regMsg2").removeClass("show");
	        },1500);//显示的时间
		</script>
    </c:if>
    
    
    <div class="form row">
        <form class="form-horizontal col-sm-offset col-md-offset-3" action = "<%=request.getContextPath()%>/reg">
            <h3 class="form-title">注册</h3>
                <div class="col-sm-9 col-md-9">
                    <div class="form-group">
						<!--        用户名图标和用户名输入框            -->
                        <i class="fa fa-user" aria-hidden="true"></i>
                        <input class="form-control required" type="text" name="username" id="username" placeholder="请输入用户名" required>
                    </div>
						<!--        密码图标和密码输入框                -->
                    <div class="form-group">
                        <i class="fa fa-key" aria-hidden="true"></i>
                        <input class="form-control required" type="password" name="password" id="password" placeholder="请输入密码" required>
                    </div>
						<!--          确认密码              -->
                    <div class="form-group">
                        <i class="fa fa-check-circle-o" aria-hidden="true"></i>
                        <input class="form-control required" type="password" name="resetpw" id="resetpw" placeholder="请确认密码" required>
                    </div>

                    <div class="form-group">
                    </div>

						<!--注册按钮-->
                    <div class="form-group">
                        <input type="submit" value="注册" class="btn btn-success pull-right">
                        <input type="button" onclick="javascrtpt:window.location.href='./login.jsp'" class="btn btn-info pull-left" id="back_btn" value="返回"/>
                    </div>


                </div>
        </form>
    </div>
</div>
</body>
</html>
