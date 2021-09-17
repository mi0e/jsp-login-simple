package com.util;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.sun.crypto.provider.RSACipher;


public class DBUtil {
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/db_stu?characterEncoding=utf-8";
	java.sql.Connection connect;
	java.sql.Statement sqlStatement;
	public Statement getCon(){
		try {
//			System.out.println(sql);
			Class.forName(driverName);
			connect = DriverManager.getConnection(url, "root", "root");
			sqlStatement = connect.createStatement();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sqlStatement;
	}
	public void getClose(){
		try {
			connect.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
