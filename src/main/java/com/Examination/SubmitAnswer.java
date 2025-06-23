package com.Examination;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class SubmitAnswer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jdbcUrl = "jdbc:mysql://localhost:3306/online_examinations"; 
        String jdbcUser = "root"; 
        String jdbcPassword = "20030105";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);

            // Assuming userID is obtained from session or request
            int userID = 1; // Example: replace with actual user ID logic

            // Loop through the submitted answers
            for (int i = 1; i <= 5; i++) {
                String mcqAnswer = request.getParameter("question_" + i);
                String subjectiveAnswer = request.getParameter("subjective_" + i);

                String answer = (mcqAnswer != null) ? mcqAnswer : subjectiveAnswer;
                
                // Only insert if there is an answer
                if (answer != null && !answer.trim().isEmpty()) {
                    String sql = "INSERT INTO studentanswerdetail (answerID, questionID, answerText) VALUES (0, ?, ?)";
                    pstmt = conn.prepareStatement(sql);
                    
                    pstmt.setInt(1, i); // Assuming questionID corresponds to the loop index
                    pstmt.setString(2, answer);
                    pstmt.executeUpdate();
                }
            }

            // Redirect to student_profile.jsp after successful submission
            response.sendRedirect("student_login.jsp");

        } catch (Exception e) {
            e.printStackTrace(); // Handle exception
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (Exception ignore) {}
            if (conn != null) try { conn.close(); } catch (Exception ignore) {}
        }
    }
}
