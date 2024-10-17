package com.postblogs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.postblogs.entities.Contact;

public class ContactDao {
	private Connection con;

	public ContactDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean saveContactUsDetails(Contact contact) {
		boolean flag = false;
		try {
			String query = "Insert into contact_us(name,email,subject,message) values(?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1,contact.getName());
			pstmt.setString(2,contact.getEmail());
			pstmt.setString(3,contact.getSubject());
			pstmt.setString(4,contact.getMessage());
			
			pstmt.executeUpdate();
			flag=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
