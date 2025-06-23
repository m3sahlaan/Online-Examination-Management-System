package com.Examination;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FeedbackInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int examID = Integer.parseInt(request.getParameter("examid"));
		int stdID = Integer.parseInt(request.getParameter("stdid"));
		String text = request.getParameter("feedback");
		String rate = request.getParameter("rating");
		
		boolean isTrue;
		
		isTrue = FeedbackDBUtil.insertFeedback(examID, stdID, text, rate);
		
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


