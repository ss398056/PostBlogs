package com.postblogs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.postblogs.entities.Admin;

public class AdminDao {
	private Connection con;

	public AdminDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	public Admin getadminLogin(String username, String password,String role) {
		Admin admin = null;
			try {
				String query = "select * from admin where username=? and password=? and role=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, username);
				pstmt.setString(2, password);
				pstmt.setString(3, role);
				
				ResultSet data = pstmt.executeQuery();
				if(data.next()) {
					admin = new Admin();
					admin.setName(data.getString("name"));
					admin.setId(data.getInt("id"));
					admin.setUsername(data.getString("username"));
					admin.setPassword(data.getString("password"));
					admin.setPassword(data.getString("role"));
					admin.setCreated_on(data.getTimestamp("created_on"));
				}
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		return admin;
	}
	
}
