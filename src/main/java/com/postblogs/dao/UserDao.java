package com.postblogs.dao;
import java.sql.*;
import com.postblogs.entities.User;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean saveUser(User user) {
		boolean flag = false;
		try {
			String query = "Insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3,user.getPassword());
			pstmt.setString(4,user.getGender());
			pstmt.setString(5,user.getAbout());
			
			pstmt.executeUpdate();
			flag=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
			try {
				String query = "select * from user where email=? and password=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, email);
				pstmt.setString(2, password);
				
				ResultSet data = pstmt.executeQuery();
				if(data.next()) {
					user = new User();
					user.setName(data.getString("name"));
					user.setId(data.getInt("id"));
					user.setGender(data.getString("gender"));
					user.setAbout(data.getString("about"));
					user.setEmail(data.getString("email"));
					user.setPassword(data.getString("password"));
					user.setCreated_on(data.getTimestamp("created_on"));
					user.setProfile(data.getString("profile_photo"));
				}
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		return user;
	}
	
	public boolean checkUserByEmail(String email) {
		boolean flag = false;
			try {
				String query = "select * from user where email=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setString(1, email);
				
				ResultSet data = pstmt.executeQuery();
				if(data.next()) {
					flag = true;
				}
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		return flag;
	}
	
	public boolean updateUser(User user,int userid) {
		boolean flag = false;
		try {
			String query = "Update user set name=?,email=?,password=?,gender=?,about=?,profile_photo=? where id=?";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3,user.getPassword());
			pstmt.setString(4,user.getGender());
			pstmt.setString(5,user.getAbout());
			pstmt.setString(6,user.getProfile());
			pstmt.setInt(7,userid);
			
			pstmt.executeUpdate();
			flag=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public User getUserByUserId(int userid) {
		User user = null;
			try {
				String query = "select * from user where id=?";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.setInt(1, userid);
				
				ResultSet data = pstmt.executeQuery();
				if(data.next()) {
					user = new User();
					user.setName(data.getString("name"));
					user.setId(data.getInt("id"));
					user.setGender(data.getString("gender"));
					user.setAbout(data.getString("about"));
					user.setEmail(data.getString("email"));
					user.setPassword(data.getString("password"));
					user.setCreated_on(data.getTimestamp("created_on"));
					user.setProfile(data.getString("profile_photo"));
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		return user;
	}
	
}
