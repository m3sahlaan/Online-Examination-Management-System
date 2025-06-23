package com.Examination;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class StudentRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname = request.getParameter("fName");
		String lname = request.getParameter("lName");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String year = request.getParameter("year");
		String course = request.getParameter("course");
		String pass = request.getParameter("pass");
		
		boolean isTrue;
		
		isTrue = StudentDBUtil.insertStudent(fname, lname, dob, address, year, course, pass);
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("student_login.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis1 = request.getRequestDispatcher("unsuccess.jsp");
			dis1.forward(request, response);
		}
	}

}
