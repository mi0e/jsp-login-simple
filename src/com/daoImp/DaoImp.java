package com.daoImp;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.bean.UserBean;
import com.dao.UserDao;
import com.mysql.jdbc.Connection;
import com.sun.org.apache.regexp.internal.recompile;
import com.sun.xml.internal.ws.Closeable;
import com.util.DBUtil;

public class DaoImp implements UserDao {

	public int save(UserBean user) {
		// TODO Auto-generated method stub
		try {
			DBUtil conn = new DBUtil();
			String sql = "insert into stu(num,name,sex,mail,pwd,area,feature)"
					+ " values('" + user.getNum() + "','" + user.getName()
					+ "','" + user.getSex() + "" + "','" + user.getMail()
					+ "','" + user.getPwd() + "','" + user.getArea() + "','"
					+ user.getFeature() + "');";
			Statement save = conn.getCon();
			save.executeUpdate(sql);
			conn.getClose();
		} catch (Exception e) {

		}
		// TODO: handle exception
		return 0;
	}

	public int modifyUser(UserBean user) {
		// TODO Auto-generated method stub
		DBUtil conn = new DBUtil();
		String sql = "update stu set name='"+user.getName()+"',pwd='"+user.getPwd()+"'," +
				"area='"+user.getArea()+"',mail='"+user.getMail()+"'," +
						"sex='"+user.getSex()+"',feature='"+user.getFeature()+"' where num='"+user.getNum()+"';";
		Statement mod = conn.getCon();
		try {
			mod.executeUpdate(sql);
			conn.getClose();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	

	public UserBean find(String num) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		DBUtil conn = new DBUtil();
		UserBean userBean = new UserBean();
		String sql = "select * from stu where num='" + num + "'";
		Statement chk = conn.getCon();
		try {
			rs = chk.executeQuery(sql);	
			if (rs.next()){
				userBean.setArea(rs.getString("area"));
				userBean.setNum(rs.getString("num"));
				userBean.setName(rs.getString("name"));
				userBean.setSex(rs.getString("sex"));
				userBean.setMail(rs.getString("mail"));
				userBean.setPwd(rs.getString("pwd"));
				userBean.setFeature(rs.getString("feature"));
				conn.getClose();	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userBean;

	}

	
	
	public boolean login(String num, String pwd) {
		// TODO Auto-generated method stub
		DBUtil conn = new DBUtil();
		ResultSet rs;
		String num_db = "";
		String pwd_db = "";
		String sql = "select num,pwd from stu where num='" + num + "'";
		Statement login = conn.getCon();
		try {
			rs = login.executeQuery(sql);
			while (rs.next()) {
				num_db = rs.getString("num");
				pwd_db = rs.getString("pwd");
			}
			conn.getClose();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (num_db.equals(num) && pwd_db.equals(pwd)) {
			return true;
			
		} else {
			return false;
		}
		
	}

	
	
	
	public boolean checkNum(String num) {
		// TODO Auto-generated method stub
		DBUtil conn = new DBUtil();
		ResultSet rs;
		String sql = "select num from stu where num='" + num + "'";
		Statement chkNum = conn.getCon();
		
		try {
			rs = chkNum.executeQuery(sql);
			if (rs.next()){
				return false;
			}else{
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	
	
	
	public int del(String num) {
		// TODO Auto-generated method stub
		DBUtil conn = new DBUtil();
		Statement del = conn.getCon();
		String sql = "DELETE FROM stu WHERE num = '"+num+"'";
		try {
			del.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

}
