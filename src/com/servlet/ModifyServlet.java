package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.UserBean;
import com.daoImp.DaoImp;

public class ModifyServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
		String num = new String(request.getParameter("num").getBytes("ISO-8859-1"),"UTF-8");
		String mail = new String(request.getParameter("mail").getBytes("ISO-8859-1"),"UTF-8");
		String pwd = new String(request.getParameter("pwd").getBytes("ISO-8859-1"),"UTF-8");
		String area = new String(request.getParameter("area").getBytes("ISO-8859-1"),"UTF-8");
		String sex = new String(request.getParameter("sex").getBytes("ISO-8859-1"),"UTF-8");
		String feature = new String(request.getParameter("feature").getBytes("ISO-8859-1"),"UTF-8");
		DaoImp user = new DaoImp();
		UserBean userBean = new UserBean();
		userBean.setArea(area);
		userBean.setFeature(feature);
		userBean.setMail(mail);
		userBean.setName(name);
		userBean.setNum(num);
		userBean.setPwd(pwd);
		userBean.setSex(sex);
		user.modifyUser(userBean);
		response.sendRedirect("/demo/index.jsp?num="+num);
	}
}
