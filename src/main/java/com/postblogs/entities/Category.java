package com.postblogs.entities;

import java.sql.Timestamp;

public class Category {
	private int id;
	private String categoryName;
	private int isActive;
	private Timestamp created_on;
	
	public Category(int id, String categoryName, int isActive, Timestamp created_on) {
		super();
		this.id = id;
		this.categoryName = categoryName;
		this.isActive = isActive;
		this.created_on = created_on;
	}

	public Category(String categoryName, int isActive) {
		super();
		this.categoryName = categoryName;
		this.isActive = isActive;
	}
	

	public Category() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	public Timestamp getCreated_on() {
		return created_on;
	}

	public void setCreated_on(Timestamp created_on) {
		this.created_on = created_on;
	}
	
	
}
