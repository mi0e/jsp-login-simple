<%@page import="com.bean.UserBean"%>
<%@ page language="java"
	import="java.*,com.daoImp.DaoImp,java.sql.ResultSet
"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>主页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/login.css" />
</head>

<body>
	<div style="margin: 0 auto; width: 500px; padding: 10px">
		<%
	if (session.getAttribute("num") != null){
 	%>
		<form action="/demo/index.jsp" method="post">
			<h2>
				你好&nbsp;<u style="color:red"><%=session.getAttribute("num")%></u>&nbsp;，登录成功
			</h2>
			<span>学号：</span> <input type="text" name="num" /> &nbsp;&nbsp; <input
				type="submit" value="查询">
		</form>
		<%
				String num = request.getParameter("num");
				if (num != null){
					DaoImp user = new DaoImp();
					UserBean userBean = user.find(num);
					if (userBean.getNum() != null){
					%>
		<table border="1" class="table" style="margin: 15px auto; text-align: center;">
			<thead>
			<tr>
				<td>学号</td>
				<td>名字</td>
				<td>性别</td>
				<td>邮箱</td>
				<td>密码</td>
				<td>地区</td>
				<td>个人简介</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><%=userBean.getNum() %></td>
				<td><%=userBean.getName() %></td>
				<td><%=userBean.getSex() %></td>
				<td><%=userBean.getMail() %></td>
				<td><%=userBean.getPwd() %></td>
				<td><%=userBean.getArea() %></td>
				<td><%=userBean.getFeature() %></td>
				<td>
					<a href="/demo/servlet/DelServlet?num=<%=userBean.getNum()%>" onclick="javascript:alert('注意，删除后需要重新注册！')">删除</a>
					<a href="/demo/modify.jsp?num=<%=userBean.getNum()%>">修改</a>
				</td>
			</tr>
		</tbody>
		</table>
		<%
					 }else{ %>
		<h2>暂无数据</h2>
		<% }%>
		<%
			}
		}else{ 
		%>
		<h2 style="color:red">对不起，你无权访问！</h2>
		<a href="login.jsp">点我去登录</a>
		<%
		}		
		%>
	</div>
</body>
</html>
