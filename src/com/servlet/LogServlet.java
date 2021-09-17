package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daoImp.DaoImp;

public class LogServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String num = new String(request.getParameter("num").getBytes("ISO-8859-1"),"UTF-8");
		String pwd = new String(request.getParameter("pwd").getBytes("ISO-8859-1"),"UTF-8");
		DaoImp user = new DaoImp();
		HttpSession session = request.getSession();
		if (user.login(num, pwd)) {
			session.setAttribute("num", num);
			session.setAttribute("pwd", pwd);
			response.sendRedirect("/demo/index.jsp");
		} else {
			response.sendRedirect("/demo/login.jsp?chk=1");
		}
	}

}
