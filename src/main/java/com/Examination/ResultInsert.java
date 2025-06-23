package com.Examination;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ResultInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int scheduleID = Integer.parseInt(request.getParameter("scheduleID"));
		int totalMarks = Integer.parseInt(request.getParameter("totalMarks"));
		String grade = request.getParameter("grade");
		String resultStatus = request.getParameter("resultStatus");
		
		boolean isTrue;
		
		isTrue = ResultDBUtil.insertResult(scheduleID,totalMarks,grade,resultStatus);
		
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("admin_dashboard.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis1 = request.getRequestDispatcher("unsuccess.jsp");
			dis1.forward(request, response);
		}
	
	}

}

