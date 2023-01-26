package com.crud.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crud.dao.studentDao;
import com.crud.db.connectionProvider;
import com.crud.entities.student;

/**
 * Servlet implementation class addRecord
 */
@MultipartConfig
@WebServlet("/addRecord")
public class addRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public addRecord() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text.html");
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		int mobile=Integer.parseInt(request.getParameter("mobile"));
		
		
		student student=new student(name, email, mobile);
		
		HttpSession session=request.getSession();
		session.setAttribute("currentStudent", student);
		
		
		
		studentDao sdao=new studentDao(connectionProvider.getConnection());
		boolean f=sdao.saveRecord(student);
		if(f) {
			out.write("done");
		}else {
			out.write("failed");
		}
	}

}
