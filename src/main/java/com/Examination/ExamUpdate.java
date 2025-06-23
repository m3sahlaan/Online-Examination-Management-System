package com.Examination;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ExamUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from request parameters
        String examID = request.getParameter("examID");
        String examName = request.getParameter("examName");
        String course = request.getParameter("course");
        String lecID = request.getParameter("lecID");
        String examDate = request.getParameter("examDate");
        String duration = request.getParameter("duration");
        String totalMarks = request.getParameter("totalMarks");
        String status = request.getParameter("status");
        
        // Flag to check the update status
        boolean isUpdated;
        
        // Call the method to update exam details in the database
        isUpdated = ExamDBUtil.updateExam(examID, examName, course, lecID, examDate, duration, totalMarks, status);
        
        if (isUpdated) {
            // If the update is successful, retrieve the updated exam details
            
            // Forward to the exam profile page
            RequestDispatcher dispatcher = request.getRequestDispatcher("lecture_dashboard.jsp");
            dispatcher.forward(request, response);
        } else {
            // If the update failed, forward to the error/unsuccessful page
            RequestDispatcher dispatcher = request.getRequestDispatcher("unsuccess.jsp");
            dispatcher.forward(request, response);
        }
    }
}

