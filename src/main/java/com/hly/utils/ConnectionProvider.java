package com.hly.utils;

import java.sql.Connection;
import java.sql.DriverManager;

import jakarta.servlet.jsp.tagext.TryCatchFinally;

public class ConnectionProvider {

	public static Connection getConnection() {
		try {
			 Class.forName("com.mysql.cj.jdbc.Driver"); // Sửa tên driver
	            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/blood", "root", "12345");
			return connection;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void main(String[] args) {
		if(getConnection() != null)
			System.out.println("Oke");
		else
			System.out.println("Failse");
	}
}
