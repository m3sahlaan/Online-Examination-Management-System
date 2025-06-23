package com.Examination;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class StudentUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("stdID");
		String fname = request.getParameter("fName");
		String lname = request.getParameter("lName");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String year = request.getParameter("year");
		String course = request.getParameter("course");
		String pass = request.getParameter("nic");
		
		boolean isTrue;
		
		isTrue = StudentDBUtil.updateStudent(id, fname, lname, dob, address, year, course, pass);
		
		if (isTrue == true) {
			List<Student> StdDetails = StudentDBUtil.getUserID(id);
			request.setAttribute("Student", StdDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("student_profile.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
  }
}
