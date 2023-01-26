package com.crud.entities;

public class student 
{
	private int id;
	private String name;
	private String email;
	private int mobile;
	public student(int id, String name, String email, int mobile) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.mobile = mobile;
	}
	public student() {
	}
	public student(String name, String email, int mobile) {
		this.name = name;
		this.email = email;
		this.mobile = mobile;
	}
	
	public student(int id, String name, int mobile) {
		this.id = id;
		this.name = name;
		this.mobile = mobile;
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
	public int getMobile() {
		return mobile;
	}
	public void setMobile(int mobile) {
		this.mobile = mobile;
	}
	
	
}
