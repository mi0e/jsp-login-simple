<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="cn">
<head>
	<meta charset="UTF-8" />
	<title>注册</title>
	<link rel="stylesheet" href="css/login.css">	
</head>
<script src="javascript/js.js"></script>
<body>
<%
	String k = request.getParameter("k");
	if (k != null){ %>
		<script>alert("学号重复！");window.location.href="/demo/register.jsp"</script>
<%	}%>
	<div id="wrapper">
			<h2>注册</h2>	
		<nav class="switch_nav">
			<a href="register.jsp" class="switch_btn on">注册</a>
			<a href="login.jsp" class="switch_btn">登录</a>
		</nav>
		<form name="form1" method="post" action="/demo/servlet/RegServlet">
			<ul class="group_input">
				<li>
					<input type="text" placeholder="用户名" id="name" name="name"/>
				</li>
				<li>
					<input type="text" placeholder="学号" id="num" name="num"/>
				</li>
				<li>
					<input type="text" placeholder="邮箱" id="mail" name="mail"/>
				</li>
				<li>
					<input type="password" placeholder="密码" id="pwd" name="pwd"/>
				</li>
				<li style="height: 45px;width: 300px;">
					<div style="position: relative;top: 20%;">
						<span>户籍：</span>
						<select class="select" name="area" id="area">
							<option selected></option>
							<option value="江西省">江西省</option>
							<option value="浙江省">浙江省</option>
							<option value="安徽省">安徽省</option>
							<option value="江苏省">江苏省</option>
						</select>
					</div>
				</li>
				<li class="height">
					<div style="position: relative;top: 20%;">
						<span>性别:</span>
						<label><input name="sex" id="input-box" type="radio" name="sex" value="男" checked="checked"/> 男  </label>
						<label><input name="sex" id="input-box" type="radio" name="sex" value="女"/> 女 </label>
					</div>
				</li>
				<li class="height">
					<textarea placeholder="自我介绍" cols="40" id="feature" rows="3" name="feature"></textarea>
				</li>
			</ul>
			<button type="submit" class="submit_btn" onclick="return sendSubmit(form1)">注册</button>
			<button type="reset" class="submit_btn">重置</button>			
		</form>
	</div>
</body>
</html>
