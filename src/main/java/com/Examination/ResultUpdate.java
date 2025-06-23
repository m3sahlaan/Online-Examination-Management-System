package com.Examination;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ResultUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from request parameters
        String scheduleID = request.getParameter("scheduleID");
        String totalMarks = request.getParameter("totalMarks");
        String grade = request.getParameter("grade");
        String resultStatus = request.getParameter("resultStatus");
        
  

            boolean isUpdated = ResultDBUtil.updateResult(scheduleID, totalMarks, grade, resultStatus);
            
            System.out.println("Update Result: " + isUpdated); // Debugging line

            if (isUpdated) {
                System.out.println("Redirecting to admin_dashboard.jsp"); // Debugging line
                response.sendRedirect("admin_dashboard.jsp");
            } else {
                System.out.println("Redirecting to unsuccess.jsp"); // Debugging line
                response.sendRedirect("unsuccess.jsp");
            }
        }

}



