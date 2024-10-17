package com.postblogs.helper;
import java.sql.*;

public class ConnectionProvider {
	private static Connection conn;
	
	public static Connection getConnection() {
		try {
			if(conn==null) {
				//Load driver class
				Class.forName("com.mysql.jdbc.Driver");
				
				//create connection
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/postblogs","root","root");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
