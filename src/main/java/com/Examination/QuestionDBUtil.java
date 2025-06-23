package com.Examination;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class QuestionDBUtil {
	
	public static boolean insertQuestion(int ExamID, String Text, int Marks, String QuestionType) {
	    boolean isSuccess = false;

	    // DB Connection details
	    String url = "jdbc:mysql://localhost:3306/online_examinations";
	    String dbUser = "root";
	    String dbPass = "20030105";

	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        // Load the MySQL driver
	        Class.forName("com.mysql.cj.jdbc.Driver");

	        // Establish connection
	        conn = DriverManager.getConnection(url, dbUser, dbPass);

	        // SQL query with place holders
	        String sql = "INSERT INTO questiondetails (questionID,examID,questionText,Marks,questionType) VALUES (0,?, ?, ?, ?)";

	        // Prepare statement
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, ExamID);  
	        pstmt.setString(2, Text);  
	        pstmt.setInt(3, Marks);   
	        pstmt.setString(4, QuestionType); 

	        // Execute update
	        int rowsInserted = pstmt.executeUpdate();

	        // Check if any row was inserted
	        if (rowsInserted > 0) {
	            isSuccess = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // Cleanup resources
	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    return isSuccess;
	}

}
