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
 * Servlet implementation class editRecord
 */

@MultipartConfig
@WebServlet("/editRecord")
public class editRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editRecord() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		
		int id=Integer.parseInt(request.getParameter("uid"));
		String name=request.getParameter("name");
		int mobile=Integer.parseInt(request.getParameter("mobile"));
		
		System.out.println(id);
		System.out.println(name);
		System.out.println(mobile);
		
		
		student student=new student(id, name, mobile);
		
		
		studentDao sdao=new studentDao(connectionProvider.getConnection());
		boolean f=sdao.editRecord(student,id);
		if(f) {
			out.write("done");
		}else {
			out.write("failed");
		}
	}

}
