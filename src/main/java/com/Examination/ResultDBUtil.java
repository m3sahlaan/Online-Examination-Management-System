package com.Examination;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ResultDBUtil {
	
	public static boolean insertResult(int scheduleID, int totalMarks, String grade, String resultStatus) {
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
	        String sql = "INSERT INTO resultDetail (resultID,scheduleID,totalMarks,grade,resultStatus) VALUES (0,?, ?, ?, ?)";

	        // Prepare statement
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, scheduleID);  
	        pstmt.setInt(2, totalMarks);  
	        pstmt.setString(3, grade);   
	        pstmt.setString(4, resultStatus); 

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

	public static boolean updateResult(String scheduleID, String totalMarks, String grade, String resultStatus) {
	    boolean isSuccess = false;

	    String url = "jdbc:mysql://localhost:3306/online_examinations";
	    String dbUser = "root";
	    String dbPass = "20030105";

	    Connection conn = null;
	    PreparedStatement pstmt = null;

	    try {
	        // Establish the connection
	        conn = DriverManager.getConnection(url, dbUser, dbPass);

	        // SQL UPDATE query for results
	        String sql = "UPDATE resultdetail SET totalMarks = ?, grade = ?, resultStatus = ? WHERE scheduleID = ?";

	        // Prepare the statement
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, totalMarks); // Set totalMarks
	        pstmt.setString(2, grade);       // Set grade
	        pstmt.setString(3, resultStatus); // Set resultStatus (Pass/Fail)
	        pstmt.setString(4, scheduleID);  // Set scheduleID for the WHERE condition

	        // Execute the update query
	        int rowsUpdated = pstmt.executeUpdate();

	        // Check if any rows were affected
	        if (rowsUpdated > 0) {
	            isSuccess = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // Close the PreparedStatement and Connection in the finally block
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
