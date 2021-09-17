<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="cn">
<head>
	<meta charset="UTF-8" />
	<title>登录</title>
	<link rel="stylesheet" href="css/login.css" />
</head>
<script src="javascript/js.js"></script>
<body>
<%
	String chk = request.getParameter("chk");
	if ( chk != null ){%>
		<script>alert("账号不存在或密码错误！");window.location.href="/demo/login.jsp"</script>
<% 			
	}
 %>
	<div id="wrapper">
			<h2>登录</h2>
		<nav class="switch_nav">
			<a href="register.jsp" class="switch_btn">注册</a>
			<a href="login.jsp" class="switch_btn on">登录</a>
		</nav>
		<div id="login">
			<form method="post" action="/demo/servlet/LogServlet" name="form2">
				<ul class="group_input">
					<li>
						<input type="text" placeholder="学号" name="num"/>
					</li>
					<li>
						<input type="password" placeholder="密码" name="pwd"/>
					</li>
				</ul>
				<button type="submit" class="submit_btn" onclick="return chk(form2)">登录</button>
				<button type="reset" class="submit_btn">重置</button>
			</form>
		</div>
	</div>
</body>
</html>
