package com.Examination;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LectureDBUtil {
		
		public static List<Lecture> validate(String username, String password){
			ArrayList<Lecture> ex = new ArrayList<>();
	        
	        String url = "jdbc:mysql://localhost:3306/online_examinations";
	        String user = "root";
	        String Pass = "20030105";
	        
	        // SQL query (use prepared statement to prevent SQL injection)
	        String sql = "SELECT * FROM lecturedetail WHERE lectureID = ? AND Password = ?";
	        
	        try {
	            // Load MySQL driver
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            
	            // Establish connection and prepare statement
	            try (Connection conn = DriverManager.getConnection(url, user, Pass);
	                 PreparedStatement pstmt = conn.prepareStatement(sql)) {
	                
	                // Set parameters for the prepared statement
	                pstmt.setString(1, username);
					pstmt.setString(2, password);
	                
	                // Execute query and process result set
	                try (ResultSet rs = pstmt.executeQuery()) {
	                    if (rs.next()) {
	                    	int lecID = rs.getInt(1);
	                    	String fName = rs.getString(2);
	                    	String lName = rs.getString(3);
	                    	String special = rs.getString(4);
	                    	String dept = rs.getString(5);
	                    	String pass = rs.getString(6);
	                        
	                        // Create Exam object and add to list
	                        Lecture c = new Lecture(lecID, fName, lName, special, dept, pass);
	                        ex.add(c);
	                    }else {
	                    	System.out.println("dosen't work");
	                    }
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        
	        return ex;
}


public static boolean insertLecture(String fname, String lname, String special, String Dept, String pass) {
		    boolean isSuccess = false;

		    // DB Connection details
		    String url = "jdbc:mysql://localhost:3306/online_examinations";
		    String dbUser = "root";
		    String dbPass = "20030105";

		    Connection conn = null;
		    PreparedStatement pstmt = null;

		    try {
		        // Establish connection (no need to load driver explicitly in modern JDBC)
		        conn = DriverManager.getConnection(url, dbUser, dbPass);

		        // Correct SQL query: remove lectureID if it's AUTO_INCREMENT
		        String sql = "INSERT INTO lecturedetail (lectureID, firstName, lastName, Specialization, Department, Password) VALUES (0, ?, ?, ?, ?, ?)";
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, fname);  // Set firstName
		        pstmt.setString(2, lname);  // Set lastName
		        pstmt.setString(3, special); // Set Specialization
		        pstmt.setString(4, Dept);    // Set Department
		        pstmt.setString(5, pass);
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
public static boolean updateLecture(String id, String firstName, String lastName, String special, String Dept, String pass) {
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
        String sql = "UPDATE lecturedetail SET  firstName = ?, lastName = ?, Specialization = ?, Department = ?, Password = ? WHERE UserID = ?";

        // Prepare the statement
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, firstName);  // Set UserName
        pstmt.setString(2, lastName);      // Set Password
        pstmt.setString(3, special);      // Set Role
        pstmt.setString(4, Dept);     // Set Email
        pstmt.setString(5, pass);     // Set PhoneNumber
        pstmt.setString(6, id);        // Set UserID for the WHERE condition

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
public static List<Lecture> getUserID(String ID){
	ArrayList<Lecture> ex = new ArrayList<>();
    
	int convertID = Integer.parseInt(ID);
    String url = "jdbc:mysql://localhost:3306/online_examinations";
    String user = "root";
    String Pass = "20030105";
    
    String sql = "SELECT * FROM lecturedetail WHERE UserID = ?";
    
    try {
        // Load MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Establish connection and prepare statement
        try (Connection conn = DriverManager.getConnection(url, user, Pass);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            // Set parameters for the prepared statement
            pstmt.setInt(1, convertID);
            
            // Execute query and process result set
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int lecID = rs.getInt(1);
                    String fName = rs.getString(2);
                    String lName = rs.getString(3);
                    String special = rs.getString(4);
                    String dept = rs.getString(5);
                    String pass = rs.getString(6);
                    
                    // Create Exam object and add to list
                    Lecture c = new Lecture(lecID, fName, lName, special, dept, pass);
                    ex.add(c);
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    return ex;
}


}

