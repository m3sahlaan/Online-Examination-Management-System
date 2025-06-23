package com.Examination;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ExamInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int exID = Integer.parseInt(request.getParameter("eid"));
		String eName = request.getParameter("examName");
		String course = request.getParameter("course");
		int lecID = Integer.parseInt(request.getParameter("lecid"));
		String date = request.getParameter("exdate");
		int duration = Integer.parseInt(request.getParameter("Duration"));
		int marks = Integer.parseInt(request.getParameter("marks"));
		String stat = request.getParameter("status");
		
		boolean isTrue;
		
		isTrue = ExamDBUtil.AddExam(exID, eName, lecID, marks, course,duration, stat, date);
		
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
