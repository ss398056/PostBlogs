package com.postblogs.entities;

import java.sql.Timestamp;

public class Contact {
	private int id;
	private String name;
	private String email;
	private String subject;
	private String message;
	private Timestamp created_on;
	
	public Contact(int id, String name, String email, String subject, String message, Timestamp created_on) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.message = message;
		this.created_on = created_on;
	}

	public Contact(String name, String email, String subject, String message, Timestamp created_on) {
		super();
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.message = message;
		this.created_on = created_on;
	}

	public Contact(String name, String email, String subject, String message) {
		super();
		this.name = name;
		this.email = email;
		this.subject = subject;
		this.message = message;
	}

	public Contact() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Timestamp getCreated_on() {
		return created_on;
	}

	public void setCreated_on(Timestamp created_on) {
		this.created_on = created_on;
	}

	@Override
	public String toString() {
		return "Contact [id=" + id + ", name=" + name + ", email=" + email + ", subject=" + subject + ", message="
				+ message + ", created_on=" + created_on + "]";
	}
	
	
}
