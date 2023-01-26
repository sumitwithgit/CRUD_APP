package com.crud.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.crud.entities.student;

public class studentDao 
{
	Connection con;
	
	public studentDao(Connection con) {
		this.con = con;
	}

	public boolean saveRecord(student student)
	{
		boolean f=false;
		try {
			String q="insert into student(name,email,mobile) values(?,?,?)";
			PreparedStatement psmt=this.con.prepareStatement(q);
			psmt.setString(1, student.getName());
			psmt.setString(2, student.getEmail());
			psmt.setInt(3, student.getMobile());
			
			psmt.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
	public ArrayList<student> getAllRecord()
	{
		ArrayList<student> list=new ArrayList<student>();
		try {
			
			String query="select * from student";
			Statement st=this.con.createStatement();
			ResultSet rs=st.executeQuery(query);
			while(rs.next())
			{
				student student=new student();
				student.setId(rs.getInt("id"));
				student.setName(rs.getString("name"));
				student.setEmail(rs.getString("email"));
				student.setMobile(rs.getInt("mobile"));
				
				list.add(student);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	public boolean deleteRecord(student student,int id)
	{
		boolean f=false;
		try {
			String q="delete from student where id=?";
			PreparedStatement psmt=this.con.prepareStatement(q);
			psmt.setInt(1, student.getId());
			
			psmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}

	public boolean editRecord(student student,int id) 
	{
		boolean f=false;
		try {
			String q="update student set name=?,mobile=? where id=?";
			PreparedStatement psmt=this.con.prepareStatement(q);
			psmt.setString(1, student.getName());
			psmt.setInt(2, student.getMobile());
			psmt.setInt(3, student.getId());
			
			psmt.executeUpdate();
			f=true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
