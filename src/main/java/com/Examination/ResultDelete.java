package com.Examination;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ResultDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String resID = request.getParameter("id"); // Changed parameter name to scheduleID

        if (resID != null && !resID.isEmpty()) {
            try {
                // Database connection setup
                Class.forName("com.mysql.cj.jdbc.Driver"); // Use the appropriate driver
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examinations", "root", "20030105");

                // SQL delete query for deleting a result
                String query = "DELETE FROM resultdetail WHERE resultID = ?"; // Updated table name to results
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setInt(1, Integer.parseInt(resID)); // Set the schedule ID in the query

                // Execute the delete operation
                int result = pstmt.executeUpdate();

                pstmt.close();
                con.close();

                // Optionally redirect to a success page or back to the list of results
                response.sendRedirect("admin_dashboard.jsp"); // Adjust this to the appropriate page after deletion

            } catch (Exception e) {
                e.printStackTrace();
                // Handle errors (you can display a message on error or log it)
                response.sendRedirect("errorPage.jsp"); // Optionally, redirect to an error page
            }
        } else {
            // If scheduleID is not provided, redirect to the list page or handle error
            response.sendRedirect("resultsList.jsp"); // Adjust this to the appropriate page
        }
    }
}

