package com.Examination;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDBUtil {
	public static boolean insertFeedback(int examID, int stdID, String text, String rate) {
	    boolean isSuccess = false;

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
	        String sql = "INSERT INTO feedback (feedbackID, examID, studentID, feedbackText, rating) VALUES (0,?, ?, ?, ?)";

	        // Prepare statement
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, examID);  
	        pstmt.setInt(2, stdID);   
	        pstmt.setString(3, text);   
	        pstmt.setString(4, rate);  

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
	
	 public static List<Feedback> getFeedbackList() {
	        List<Feedback> feedbackList = new ArrayList<>();
	        String url = "jdbc:mysql://localhost:3306/online_examinations";
	        String dbUser = "root";
	        String dbPass = "20030105";

	        String sql = "SELECT feedbackID, feedbackText, rating FROM feedback";

	        try (Connection conn = DriverManager.getConnection(url, dbUser, dbPass);
	             PreparedStatement pstmt = conn.prepareStatement(sql);
	             ResultSet rs = pstmt.executeQuery()) {

	            // Load the MySQL driver
	            Class.forName("com.mysql.cj.jdbc.Driver");

	            while (rs.next()) {
	                int feedbackID = rs.getInt("feedbackID");
	                String feedbackText = rs.getString("feedbackText");
	                String rating = rs.getString("rating");

	                Feedback feedback = new Feedback(feedbackID, feedbackID, feedbackID, feedbackText, rating);
	                feedbackList.add(feedback);
	            }
	        } catch (Exception e) {
	            e.printStackTrace(); // Consider logging this instead
	        }

	        return feedbackList;
	    }
   
}



