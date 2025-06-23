package com.Examination;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class QuestionInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int examID = Integer.parseInt(request.getParameter("examID"));
		String text = request.getParameter("questionText");
		int marks = Integer.parseInt(request.getParameter("marks"));
		String qType = request.getParameter("questionType");
		
		boolean isTrue;
		
		isTrue = QuestionDBUtil.insertQuestion(examID,text,marks,qType);
		
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("lecture_dashboard.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis1 = request.getRequestDispatcher("unsuccess.jsp");
			dis1.forward(request, response);
		}
	}
		
	}


