package com.Examination;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class ExamDBUtil {
	public static boolean AddExam(int examID,String exName, int lecID, int totMarks, String course, int duration, String status, String Date) {
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

	        // SQL query with placeholders
	        String sql = "INSERT INTO examdetail (examID, examName, Course, lecID, examDate, duration, TotalMarks, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	        // Prepare statement
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, examID);  
	        pstmt.setString(2, exName );  
	        pstmt.setString(3, course);   
	        pstmt.setInt(4, lecID);  
	        pstmt.setString(5, Date);
	        pstmt.setInt(6, duration);
	        pstmt.setInt(7, totMarks);
	        pstmt.setString(8, status);
	        

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



public static boolean updateExam(String examID, String examName, String course, String lecID, String examDate, String duration, String totalMarks, String status) {
    boolean isSuccess = false;

    String url = "jdbc:mysql://localhost:3306/online_examinations";
    String dbUser = "root";
    String dbPass = "20030105";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Establish the connection
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        // SQL UPDATE query
        String sql = "UPDATE examdetail SET examName = ?, Course = ?, lecID = ?, examDate = ?, duration = ?, TotalMarks = ?, status = ? WHERE examID = ?";

        // Prepare the statement
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, examName);   // Set examName
        pstmt.setString(2, course);     // Set Course
        pstmt.setString(3, lecID);      // Set lecID (lecturer ID)
        pstmt.setString(4, examDate);   // Set examDate
        pstmt.setString(5, duration);   // Set duration
        pstmt.setString(6, totalMarks); // Set TotalMarks
        pstmt.setString(7, status);     // Set status (Active/Inactive)
        pstmt.setString(8, examID);     // Set examID for the WHERE condition

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
