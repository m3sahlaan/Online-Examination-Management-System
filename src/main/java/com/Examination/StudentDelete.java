package com.Examination;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


public class StudentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");

        if (id != null && !id.isEmpty()) {
            try {
                // Database connection setup
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_examinations", "root", "Sabeshan@271");

                // SQL delete query
                String query = "DELETE FROM studentdetails WHERE StudentID = ?";
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setInt(1, Integer.parseInt(id)); // Set the ID in the query

                // Execute the delete operation
                pstmt.executeUpdate();

                pstmt.close();
                con.close();

                

            } catch (Exception e) {
                e.printStackTrace();
                // Handle errors (you can display a message on error or log it)
                response.sendRedirect("errorPage.jsp"); // Optionally, redirect to an error page
            }
        } else {
            // If ID is not provided, redirect to the list page or handle error
            response.sendRedirect("index.jsp");
        }
    }
}
