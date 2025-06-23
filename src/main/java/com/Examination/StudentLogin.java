package com.Examination;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
            List<Student> StdDetails = StudentDBUtil.validate(username, password);
            if (StdDetails != null && !StdDetails.isEmpty()) {
                request.setAttribute("Student", StdDetails);
                RequestDispatcher dis = request.getRequestDispatcher("student_profile.jsp");
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


