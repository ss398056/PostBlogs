package com.postblogs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.postblogs.entities.Category;

public class CategoryDao {
	private Connection con;

	public CategoryDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean addCategory(Category category) {
		boolean flag=false;
		try {
			String query = "insert into category(name,isActive) values(?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, category.getCategoryName());
			pstmt.setInt(2, category.getIsActive());
			pstmt.executeUpdate();
			flag = true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public ArrayList<Category> getAllCategory() {
		ArrayList<Category> list = new ArrayList<>();
		try {
			String query = "select * from category order by id desc";
			Statement pstmt = con.createStatement();
			ResultSet data = pstmt.executeQuery(query);
			while(data.next()) {
				Category c = new Category(data.getInt("id"),data.getString("name"),data.getInt("isActive"),data.getTimestamp("created_on"));
				list.add(c);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<Category> getAllActiveCategory() {
		ArrayList<Category> list = new ArrayList<>();
		try {
			String query = "select * from category where isActive=1";
			Statement pstmt = con.createStatement();
			ResultSet data = pstmt.executeQuery(query);
			while(data.next()) {
				list.add(new Category(data.getInt("id"),data.getString("name"),data.getInt("isActive"),data.getTimestamp("created_on")));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
