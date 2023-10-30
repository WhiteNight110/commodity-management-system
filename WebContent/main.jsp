<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- 引入 Bootstrap -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <script src="js/jquery-3.4.1.js"></script>
    <script src="bootstrap/js/bootstrap.js"></script>
    
    <!-- 引入 font-awesome -->
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <title>商品管理系统</title>
</head>
<body>
<!-- 添加成功提示框 -->
	<div id="AddSuccess" class="alert alert-success alert-dismissible hide custom-alert" role="alert" 
		style="position: absolute; left: 50%;top:20%; transform: translate(-50%); text-align: center;z-index: 1;" > 
	  <span class="text-center"><strong>Success!</strong>添加成功</span>
	</div>
    <c:if test="${addMsg == 1}">
		<script type="text/javascript">
			$("#AddSuccess").addClass("show");
	        window.setTimeout(function(){
	            $("#AddSuccess").removeClass("show");
	        },1500);//显示的时间
		</script>
    </c:if>
    
    <!-- 添加失败提示框 -->
	<div id="AddFail" class="alert alert-danger alert-dismissible hide custom-alert" role="alert" 
		style="position: absolute; left: 50%;top:20%; transform: translate(-50%); text-align: center;z-index: 1;" > 
	  <span class="text-center"><strong>Warning!</strong>添加失败</span>
	</div>
    <c:if test="${addMsg == 0}">
		<script type="text/javascript">
			$("#AddFail").addClass("show");
	        window.setTimeout(function(){
	            $("#AddFail").removeClass("show");
	        },1500);//显示的时间
		</script>
    </c:if>
    
    <!-- 删除成功提示框 -->
	<div id="DelSuccess" class="alert alert-success alert-dismissible hide custom-alert" role="alert" 
		style="position: absolute; left: 50%;top:20%; transform: translate(-50%); text-align: center;z-index: 1;" > 
	  <span class="text-center"><strong>Success!</strong>删除成功</span>
	</div>
    <c:if test="${delMsg == 1}">
		<script type="text/javascript">
			$("#DelSuccess").addClass("show");
	        window.setTimeout(function(){
	            $("#DelSuccess").removeClass("show");
	        },1500);//显示的时间
		</script>
    </c:if>
    
    <!-- 删除失败提示框 -->
	<div id="DelFail" class="alert alert-danger alert-dismissible hide custom-alert" role="alert" 
		style="position: absolute; left: 50%;top:20%; transform: translate(-50%); text-align: center;z-index: 1;" > 
	  <span class="text-center"><strong>Warning!</strong>删除失败</span>
	</div>
    <c:if test="${delMsg == 0}">
		<script type="text/javascript">
			$("#DelFail").addClass("show");
	        window.setTimeout(function(){
	            $("#DelFail").removeClass("show");
	        },1500);//显示的时间
		</script>
    </c:if>
    
    <!-- 修改成功提示框 -->
	<div id="modSuccess" class="alert alert-success alert-dismissible hide custom-alert" role="alert" 
		style="position: absolute; left: 50%;top:20%; transform: translate(-50%); text-align: center;z-index: 1;" > 
	  <span class="text-center"><strong>Success!</strong>修改成功</span>
	</div>
    <c:if test="${modMsg == 1}">
		<script type="text/javascript">
			$("#modSuccess").addClass("show");
	        window.setTimeout(function(){
	            $("#modSuccess").removeClass("show");
	        },1500);//显示的时间
		</script>
    </c:if>
    
    <!-- 修改失败提示框 -->
	<div id="modFail" class="alert alert-danger alert-dismissible hide custom-alert" role="alert" 
		style="position: absolute; left: 50%;top:20%; transform: translate(-50%); text-align: center;z-index: 1;" > 
	  <span class="text-center"><strong>Warning!</strong>修改失败</span>
	</div>
    <c:if test="${modMsg == 0}">
		<script type="text/javascript">
			$("#modFail").addClass("show");
	        window.setTimeout(function(){
	            $("#modFail").removeClass("show");
	        },1500);//显示的时间
		</script>
    </c:if>
    
	<nav class="navbar navbar-inverse" role="navigation" background="#F0F8FF">
	  <div class="container-fluid">
	    <ul class="nav navbar-nav navbar-left">
	      <li>
	        <a style="font-size: 26px;">商品管理系统-系统管理员</a>
	      </li>
	    </ul>
	    
	    
	   
	    <span style="color: #CCCCCC;font-size: 26px;position: relative;top: 5px;"></span>
	    <ul class="nav navbar-nav navbar-right">
	      <li>
	        <a>欢迎您 ${username}</a>
	      </li>
	      <li>
	        <a href="login.jsp">安全退出</a>
	      </li>
	    </ul>
	  </div>
	</nav>


	<div class="container-fluid">
	  <div class="row">
	    
	    <!--右边内容-->
	  		<div class="container-fluid">
			    <div class="row">
			        <div class="col-sm-12">
			            <!-- 顶部搜索部分 -->
			            <div class="panel panel-default">
			                <div class="panel-heading">搜索/添加</div>
			                <div class="panel-body"  style="display: flex; justify-content: center; align-items: center;">
		                    	<div style="margin-left: 20px">
		                            <button  onclick="location.href='./refresh?cp=1&username=${username}&password=${password}'" class="btn btn-info ">
												<span style="margin-right: 5px"
		                                              class="glyphicon glyphicon-refresh" aria-hidden="true">
												</span>刷新列表
		                            </button>
		                        </div>
		                    	
			                    <form role="form" class="form-inline" action="<%=request.getContextPath()%>/search" method="post">
			                    	<input class="hide" name="cp" value="1">
			                    	<input class="hide" name="username" value="${username}">
			                    	<input class="hide" name="password" value="${password}">
			                    	<div class="form-group " style="margin-left: 20px">
			                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#combineQuery" style="margin-right: 15px">
													<span style="margin-right: 5px"
			                                              class="glyphicon glyphicon-search" aria-hidden="true">
													</span>组合查询
			                            </button>
			                        </div>
			                        <div class="form-group">
			                            <label for="name">字段：</label>
			                            <select name="key" class="form-control">
			                            	<option value="none" selected disabled hidden>请选择选项</option>
			                                <option value="ftype">商品类别</option>
			                                <option value="fname">商品名称</option>
			                                <option value="fdesc">商品介绍</option>
			                                <option value="forder">商品排名</option>
			                                <option value="fregtime">上架时间</option>
			                            </select>
			                        </div>
			                        <div class="form-group" style="margin-left: 20px">
			                            <label for="value">值：</label>
			                            <input type="text" class="form-control" name="value" placeholder="字段值" maxlength="12" style="width: 130px">
			                        </div>
			                        <div class="form-group " style="margin-left: 20px">
			                            <button type="submit" class="btn btn-info ">
													<span style="margin-right: 5px"
			                                              class="glyphicon glyphicon-search" aria-hidden="true">
													</span>开始搜索
			                            </button>
			                        </div>
			                        <div class="form-group " style="margin-left: 48px">
			                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addFood">
													<span style="margin-right: 5px" class="" aria-hidden="true">
														<i class="fa fa-user-plus">添加商品信息</i>
														</span>
			                            </button>
			                        </div>
			                    </form>
			                </div>
			            </div>
			            <!-- 列表展示-->
			            <div class="table-responsive">
			                <table class="table table-hover table-condensed" data-pagination="true" data-side-pagination="client" data-page-size="10">
			                    <thead>
			                    <tr>
			                        <th style="vertical-align: middle !important;text-align: center;" width="5%">商品ID</th>
			                        <th style="vertical-align: middle !important;text-align: center;" width="7%">商品类别</th>
			                        <th style="vertical-align: middle !important;text-align: center;" width="9%">商品名称</th>
			                        <th style="vertical-align: middle !important;text-align: center;" width="12%">商品图片</th>
			                        <th style="vertical-align: middle !important;text-align: center;" width="7%">商品单价</th>
			                        <th style="vertical-align: middle !important;text-align: center;" width="27%">商品介绍</th>
			                        <th style="vertical-align: middle !important;text-align: center;" width="8%">商品排名</th>
			                        <th style="vertical-align: middle !important;text-align: center;" width="9%">上架时间</th>
			                        <th style="vertical-align: middle !important;text-align: center;" width="16%">操作</th>
			                    </tr>
			                    </thead>
			                    <tbody>
			                    <c:forEach items="${list}" var="food">
			                        <tr>
			                            <td style="vertical-align: middle !important;text-align: center;" width="5%">${food.fid}</td>
										<td style="vertical-align: middle !important;text-align: center;" width="7%">${food.ftype.tname}</td>
										<td style="vertical-align: middle !important;text-align: center;" width="9%">${food.fname}</td>
										<td style="vertical-align: middle !important;text-align: center;" width="12%"><img src="http://localhost:8080/ShopHomework/foods/${food.fpic}" width="100px" height="100px"></td>
										<td style="vertical-align: middle !important;text-align: center;" width="7%">${food.fprice}</td>
										<td style="vertical-align: middle !important;text-align: center;" width="27%">${food.fdesc}</td>
										<td style="vertical-align: middle !important;text-align: center;" width="8%">${food.forder}</td>
										<td style="vertical-align: middle !important;text-align: center;" width="9%">${food.fregtime}</td>
			                            <td style="vertical-align: middle !important;text-align: center;" width="16%">
			                                <div class="btn-group">
			                                    <button type="button" class="btn btn-default "
			                                            data-fid="${food.fid}"
			                                            data-tid="${food.tid}"
			                                            data-tname="${food.ftype.tname}"
			                                            data-fname="${food.fname}"
			                                            data-fpic="http://localhost:8080/ShopHomework/foods/${food.fpic}"
			                                            data-fprice="${food.fprice}"
			                                            data-fdesc="${food.fdesc}"
			                                            data-forder="${food.forder}"
			                                            data-fregtime="${food.fregtime}"
			                                            data-toggle="modal"
			                                            data-target="#updateFood">
			                                        <i class="fa fa-user-o"> 修改</i>
			                                    </button>
			
			
			                                    <button type="button" class="btn btn-danger "
			                                    		data-fid="${food.fid}" data-fname="${food.fname}" 
			                                    		data-toggle="modal" onclick="" data-target="#delFood" >
			                                        <i class="fa fa-trash" > 删除</i>
			                                    </button>
			                                </div>
			                            </td>
			                        </tr>
			                    </c:forEach>
			                    </tbody>
			                </table>
			                <!-- combineQuery框 -->
			                <form method="post" action="<%=request.getContextPath()%>/combineQuery"  class="form-horizontal" style="margin-top: 0px" role="form"
			                      id="form_data" style="margin: 20px;">
			                    <input class="hide" name="cp" value="1">
			                    <div class="modal fade" id="combineQuery" tabindex="-1"
			                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			                        <div class="modal-dialog">
			                            <div class="modal-content">
			                                <div class="modal-header">
			                                    <button type="button" class="close" data-dismiss="modal"
			                                            aria-hidden="true">x</button>
			                                    <h4 class="modal-title" id="myModalLabel">组合查询商品信息</h4>
			                                </div>
			                                <div class="modal-body">
			                                    <form class="form-horizontal" role="form" >
			                                        <div class="form-group">
			                                            <label for="fname" class="col-sm-3 control-label">商品名称</label>
			                                            <div class="col-sm-9">
			                                                <input type="text" class="form-control" id="fname"
			                                                       name="fname" placeholder="请输入要查询的字段">
			                                            </div>
			                                        </div>
													
													<div class="form-group">
			                                            <label for="fname" class="col-sm-3 control-label">商品类型</label>
			                                            <div class="col-sm-9">
			                                                <input type="text" class="form-control" id="ftype"
			                                                       name="ftype" placeholder="请输入要查询的字段">
			                                            </div>
		                                        	</div>
													
			                                        <div class="form-group">
			                                            <label for="fprice" class="col-sm-3 control-label">商品单价</label>
			                                            <div class="col-sm-9">
			                                                <input type="number" class="form-control" id="fprice" min=1
			                                                       name="fprice" value="" placeholder="请输入要查询的字段">
			                                            </div>
			                                        </div>
			
			                                        <div class="form-group">
			                                            <label for="forder" class="col-sm-3 control-label">商品排名</label>
			                                            <div class="col-sm-9">
			                                                <input type="number" class="form-control" id="forder" min=1
			                                                       name="forder" value="" placeholder="请输入要查询的字段">
			                                            </div>
			                                        </div>
			                                        
			                                        <div class="form-group">
			                                            <label for="fdesc" class="col-sm-3 control-label">商品描述</label>
			                                            <div class="col-sm-9">
			                                                <input type="text" class="form-control" id="fdesc"
			                                                       name="fdesc" value="" placeholder="请输入要查询的字段">
			                                            </div>
			                                        </div>
			                                    </form>
			                                </div>
			                                <div class="modal-footer">
			                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			                                    <button type="submit" class="btn btn-primary">提交</button>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </form>
			                
			                
			                
			                
			                
			                <!-- add框示例（Modal） -->
			                <form method="post" action="<%=request.getContextPath()%>/add"  class="form-horizontal" style="margin-top: 0px" role="form"
			                      id="form_data" style="margin: 20px;" enctype="multipart/form-data" >
			                    <input class="hide" name="username" value="${username}">
			                    <input class="hide" name="password" value="${password}">
			                    <div class="modal fade" id="addFood" tabindex="-1"
			                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
			                        <div class="modal-dialog">
			                            <div class="modal-content">
			                                <div class="modal-header">
			                                    <button type="button" class="close" data-dismiss="modal"
			                                            aria-hidden="true">x</button>
			                                    <h4 class="modal-title" id="myModalLabel">添加商品信息</h4>
			                                </div>
			                                <div class="modal-body">
			                                    <form class="form-horizontal" role="form" >
			                                    	
			                                    
			                                        <div class="form-group">
			                                            <label for="fname" class="col-sm-3 control-label">商品名称</label>
			                                            <div class="col-sm-8">
			                                                <input type="text" required class="form-control" id="fname"
			                                                       name="fname" style="text-align:center" placeholder="请输入商品名称">
			                                            </div>
			                                        </div>
													
													<div class="form-group">
			                                            <label for="tid" class="col-sm-3 control-label">商品类别</label>
			                                            <div class="col-sm-8">
			                                                <select class="form-control" name="tid"  style="text-align:center">
			                                                    <c:forEach items="${tlist}" var="ftype">
			                                                        <option value="${ftype.tid}">${ftype.tname}</option>
			                                                    </c:forEach>
			                                                </select>
			                                            </div>
		                                        	</div>
													
													
			                                        <div class="form-group">
			                                            <label for="user_id" class="col-sm-3 control-label">商品图片</label>
			                                            <div class="col-sm-8">
			                                                
			                                                
			                                                <div><input type="file" required name="fpic" id="fpic" accept="image/*"/></div>
														    <div id="show-picture"></div>
														    <script>
														      var getUserPhoto = document.getElementById("fpic");
														  		getUserPhoto.onchange = function () {
														        var file = this.files;
														        console.log(file);
														        var reader = new FileReader();
														        reader.readAsDataURL(file[0]);
														        reader.onload = function () {
														          var image = document.createElement("img");
														          image.width = "400";
														          image.src = reader.result;
														          var showPicture = document.getElementById("show-picture");
														          showPicture.append(image);
														        };
														      };
														    </script>
			                                                       
			                                                       
			                                            </div>
			                                        </div>
			
			                                        <div class="form-group">
			                                            <label for="fprice" class="col-sm-3 control-label">商品单价</label>
			                                            <div class="col-sm-8">
			                                                <input type="number" required class="form-control" id="fprice" min=1
			                                                       name="fprice" value="" style="text-align:center" placeholder="请输入商品单价">
			                                            </div>
			                                        </div>
			
			                                        <div class="form-group">
			                                            <label for="forder" class="col-sm-3 control-label">商品排名</label>
			                                            <div class="col-sm-8">
			                                                <input type="number" required class="form-control" id="forder" min=1
			                                                       name="forder" value="" style="text-align:center" placeholder="请输入商品排名">
			                                            </div>
			                                        </div>
			                                        
			                                        <div class="form-group">
			                                            <label for="fdesc" class="col-sm-3 control-label">商品描述</label>
			                                            <div class="col-sm-8">
			                                                <textarea required class="form-control" id="fdesc"
			                                                       name="fdesc" style="text-align:center" placeholder="请输入商品描述"></textarea>
			                                            </div>
			                                        </div>
			                                    </form>
			                                </div>
			                                <div class="modal-footer" >
			                                    <button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
			                                    <button type="submit" class="btn btn-primary" >提交</button>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </form>
			                
			                
			                
			                
			                
		
			                <!-- update框示例（Modal） -->
			                <form method="post" action="<%=request.getContextPath()%>/update" class="form-horizontal" style="margin-top: 0px" role="form"
			                      id="form_data" style="margin: 20px;" enctype="multipart/form-data">
			                      
			                    	<input class="hide" name="username" value="${username}">
			                    	<input class="hide" name="password" value="${password}">
			                    <div class="modal fade" id="updateFood" tabindex="-1"
			                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			                        <div class="modal-dialog" >
			                            <div class="modal-content">
			                                
			                                <div class="modal-header">
			                                    <button type="button" class="close" data-dismiss="modal"
			                                            aria-hidden="true">x</button>
			                                    <h4 class="modal-title" id="myModalLabel">商品信息</h4>
			                                </div>
			                                <div class="modal-body">
			                                    <form class="form-horizontal" role="form">
			                                        <div class="form-group">
			                                            <label for="user_id" class="col-sm-3 control-label">商品ID</label>
			                                            <div class="col-sm-7">
			                                                <input  style="text-align:center" type="number" readonly="readonly" required class ="form-control" id="fid" name="fid">
			                                            </div>
			                                        </div>
			                                        
			                                        <div class="form-group">
			                                            <label for="tid" class="col-sm-3 control-label">商品类别</label>
			                                            <div class="col-sm-7">
			                                                <select  style="text-align:center" class="form-control" name="tid">
			                                                    <c:forEach items="${tlist}" var="ftype">
																	<option value="${ftype.tid}" class="type">${ftype.tname}</option>
			                                                    </c:forEach>
			                                                </select>
			                                                
			                                            </div>
		                                        	</div>
			                                        
			                                        <div class="form-group">
			                                            <label for="user_id" class="col-sm-3 control-label">商品名称</label>
			                                            <div class="col-sm-7">
			                                                <input  style="text-align:center" type="text" required class="form-control" id="fname"
			                                                       name="fname" value="" placeholder="">
			                                            </div>
			                                        </div>
			                                        
			                                        <div class="form-group">
			                                            <label for="user_id" class="col-sm-3 control-label">商品图片</label>
			                                            <div class="col-sm-7">
			                                                <img id="showFpic" src="" width="100px" height="100px">
			                                                
			                                                <input class="hide" name="fpic0" id="fpic0">
			                                                
			                                                <div><input type="file" name="fpic" id="fpic2" accept="image/*" limit="1"/></div>
														    <div id="show-picture2"></div>
														    <script>
														      var getUserPhoto = document.getElementById("fpic2");
														  		getUserPhoto.onchange = function () {
														        var file = this.files;
														        console.log(file);
														        var reader = new FileReader();
														        reader.readAsDataURL(file[0]);
														        reader.onload = function () {
														          var image = document.createElement("img");
														          image.width = "400";
														          image.src = reader.result;
														          var showPicture = document.getElementById("show-picture2");
														          while(showPicture.firstChild){
														              showPicture.removeChild(showPicture.firstChild);
														            }
														          showPicture.append(image);
														        };
														      };
														    </script>
			                                                       
			                                                       
			                                            </div>
			                                        </div>
													
													
													
			                                        <div class="form-group">
			                                            <label for="user_id" class="col-sm-3 control-label">商品单价</label>
			                                            <div class="col-sm-7">
			                                                <input  style="text-align:center" type="text" required class="form-control" id="fprice"
			                                                       name="fprice" value="" placeholder="">
			                                            </div>
			                                        </div>
			                                        
			                                        <div class="form-group">
			                                            <label for="user_id" class="col-sm-3 control-label">商品介绍</label>
			                                            <div class="col-sm-7">
			                                                <textarea style="text-align:center"  type="text" required class="form-control" id="fdesc"
			                                                       name="fdesc" rows=4 placeholder=""></textarea>
			                                            </div>
			                                        </div>
			                                        
			                                        <div class="form-group">
			                                            <label for="user_id" class="col-sm-3 control-label">商品排名</label>
			                                            <div class="col-sm-7">
			                                                <input style="text-align:center"  type="text" required class="form-control" id="forder"
			                                                       name="forder" value="" placeholder="">
			                                            </div>
			                                        </div>
			                                    </form>
			                                </div>
			                                
			                                
			                                <div class="modal-footer">
			                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			                                    <button type="submit" class="btn btn-primary">提交</button>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </form>
			                
			                
			                
			                
			                
							<!-- 删除模态框示例（Modal） -->
			                <form method="post" action="<%=request.getContextPath()%>/delete"
			                      class="form-horizontal" style="margin-top: 0px" role="form"
			                      id="form_data" style="margin: 20px;">
			                    	<input class="hide" name="username" value="${username}">
			                    	<input class="hide" name="password" value="${password}">
			                    <div class="modal fade" id="delFood" tabindex="-1"
			                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			                        <div class="modal-dialog">
			                            <div class="modal-content">
			                                <div class="modal-header">
			                                    <button type="button" class="close" data-dismiss="modal"
			                                            aria-hidden="true">×</button>
			                                    <h4 class="modal-title" id="myModalLabel">商品信息</h4>
			                                </div>
			                                <div class="modal-body">
			                                    <form class="form-horizontal" role="form">
			                                        <div class="form-group">
			                                            <div class="col-sm-9">
			                                                <h3 class="col-sm-18 control-label" id="deleteLabel">删除信息</h3>
			                                                <input type="hidden" class="form-control" id="fid"
			                                                       name="fid" placeholder=""> 
			                                            </div>
			                                        </div>
			                                    </form>
			                                </div>
			                                <div class="modal-footer">
			                                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			                                    <button type="submit" class="btn btn-danger">删除</button>
			                                    <span id="tip"> </span>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </form>
			                
			            </div>
			            
			            <div class="list-page" style="text-align: center;">
			            	共${count}条数据，当前<select  style="text-align:center; width : 60px; height:30px; 
			            								display: inline-block; margin: 10px" class="form-control" name="cp" 
														onchange="location.href = this.value;">
					                            	<c:forEach var="i" begin="1" end="${page}">
														<c:if test="${i==cp}">
															<option value="" class="type" selected="selected">${i}</option>
														</c:if>
														<c:if test="${i!=cp}">
															<option value="account?cp=${i}&username=${username}&password=${password}&selected=${selected}" class="type">${i}</option>
														</c:if>
					                                </c:forEach>
					                            </select>/${page}页
			            	<button  style="display: inline-block; margin:2px" onclick="location.href = 'account?cp=1&username=${username}&password=${password}&selected=${selected}'">首页</button>
			            	<button  style="display: inline-block; margin:2px" onclick="location.href = 'account?cp=${cp-1<1?1:cp-1}&username=${username}&password=${password}&selected=${selected}'">上一页</button>
			            	<button  style="display: inline-block; margin:2px" onclick="location.href = 'account?cp=${cp+1>page?page:cp+1}&username=${username}&password=${password}&selected=${selected}'">下一页</button>
			            	<button  style="display: inline-block; margin:2px" onclick="location.href = 'account?cp=${page}&username=${username}&password=${password}&selected=${selected}'">尾页</button>
			            	
			            	
			            </div>
			            
			            
			          
			        </div>
			    </div>
			</div>
	  	
	  	
	  	
	  </div>
	</div>
	<div class="footer" style="margin-top:20px">
	  <p class="text-center">
	    2023 © FoodManagementSystem
	  </p>
	</div>















	
	

<!-- 这里放<script> -->
<script>


    $('#updateFood').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var fid = button.data('fid')
        var tid = button.data('tid')
        var tname = button.data('tname')
        var fname = button.data('fname')
        var fpic = button.data('fpic')
        var fprice = button.data('fprice')
        var fdesc = button.data('fdesc')
        var forder = button.data('forder')
        var fregtime = button.data('fregtime')
        
        
        
        var modal = $(this)

        modal.find('.modal-title').text('修改商品信息')
        modal.find('#fid').val(fid)
        modal.find('#tname').val(tname)
        modal.find('#fname').val(fname)
        $('#showFpic').attr('src',fpic)
        modal.find('#fpic0').val(fpic)
        modal.find('#fprice').val(fprice)
        modal.find('#fdesc').val(fdesc)
        modal.find('#forder').val(forder)
        modal.find('#fregtime').val(fregtime)
        var list = modal.find('.type')
        for(var i=0;i<list.length;i++){
            if(tid == $(list.get(i)).val()){
                $(list.get(i)).prop('selected',true)
            }
        }
    })
	
    
    $('#delFood').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var fname = button.data('fname')
        var fid = button.data('fid')
        var modal = $(this)
        modal.find('.modal-title').text('删除商品信息')
        modal.find('#deleteLabel').text('是否删除  ' + fname + ',ID为 '+ fid + ' 的信息')
        modal.find('#fid').val(fid)
    })
    
</script>
</body>

</html>