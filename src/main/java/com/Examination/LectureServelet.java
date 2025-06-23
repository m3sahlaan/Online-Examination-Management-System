package com.Examination;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class LectureServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
            List<Lecture> lecDetails = LectureDBUtil.validate(username, password);
            if (lecDetails != null && !lecDetails.isEmpty()) {
                request.setAttribute("lecture", lecDetails);
                RequestDispatcher dis = request.getRequestDispatcher("lecture_dashboard.jsp");
                dis.forward(request, response);
            } else {
                // handle empty or null case
                System.out.println("No user data found.");
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}


