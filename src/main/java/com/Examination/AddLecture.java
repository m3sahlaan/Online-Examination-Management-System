package com.Examination;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddLecture extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("fName");
		String lname = request.getParameter("lName");
		String special = request.getParameter("Special");
		String dept = request.getParameter("dept");
		String pass = request.getParameter("pass");
		
		
		boolean isTrue;
		
		isTrue = LectureDBUtil.insertLecture(fname, lname, special,dept,pass);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("lecture_login.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis1 = request.getRequestDispatcher("unsuccess.jsp");
			dis1.forward(request, response);
		}
	
	}

}
