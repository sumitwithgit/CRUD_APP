package com.crud.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.crud.dao.studentDao;
import com.crud.db.connectionProvider;
import com.crud.entities.student;

/**
 * Servlet implementation class deleteRecord
 */
@WebServlet("/deleteRecord")
public class deleteRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public deleteRecord() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		int id=Integer.parseInt(request.getParameter("user_id"));
		System.out.println(id);
		
		student student=new student();
		student.setId(id);
		
		
		studentDao sdao=new studentDao(connectionProvider.getConnection());
		boolean f=sdao.deleteRecord(student,id);
		if(f) {
			out.write("done");
		}else {
			out.write("failed");
		}
	}

}
