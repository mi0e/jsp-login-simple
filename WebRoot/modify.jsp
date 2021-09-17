<%@ page language="java" import="java.util.*,com.bean.UserBean,com.daoImp.DaoImp" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="cn">
<head>
	<meta charset="UTF-8" />
	<title>修改</title>
	<link rel="stylesheet" href="css/login.css">	
</head>
<script src="javascript/js.js"></script>
<body>
<%
	String num = request.getParameter("num");
	DaoImp user = new DaoImp();
	UserBean userBean = user.find(num);
	if (userBean.getName() != null && session.getAttribute("num") != null){
 %>
	<div id="wrapper">
			<h2>修改信息</h2>	
		<nav class="switch_nav">
			
		</nav>
		<form name="form3" method="post" action="/demo/servlet/ModifyServlet">
			<ul class="group_input">
				<li>
					<input type="text" placeholder="用户名" id="name" name="name" value="<%=userBean.getName() %>"/>	
				</li>
				<li>
					<input type="text" placeholder="学号" readonly="readonly" id="num" name="num" value="<%=userBean.getNum() %>"/>
					<span style="color: red">&nbsp;学号无法修改</span>
				</li>
				<li>
					<input type="text" placeholder="邮箱" id="mail" name="mail" value="<%=userBean.getMail() %>"/>
				</li>
				<li>
					<input type="password" placeholder="密码" id="pwd" name="pwd" value="<%=userBean.getPwd() %>"/>
				</li>
				<li style="height: 45px;width: 300px;">
					<div style="position: relative;top: 20%;">
						<span>户籍：</span>
						<select class="select" name="area" id="area">
							<option value="<%=userBean.getArea() %>" selected><%=userBean.getArea() %></option>
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
					<textarea placeholder="自我介绍" cols="40" id="feature" rows="3" name="feature"><%=userBean.getFeature() %></textarea>
				</li>
			</ul>
			<button type="submit" class="submit_btn" onclick="mod(form3)">修改</button>	
			<a href="/demo/index.jsp"><button type="button" class="submit_btn">返回</button></a>
		</form>
	</div>
	<%}else{ %>
	<h2>错误，无法修改</h2><a href="/demo/register.jsp">点击去注册</a>
	<%} %>
</body>
</html>
