package com.Examination;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StudentDBUtil {
	public static List<Student> validate(String username, String password){
		ArrayList<Student> ex = new ArrayList<>();
        
        String url = "jdbc:mysql://localhost:3306/online_examinations";
        String user = "root";
        String Pass = "20030105";
        
        // SQL query (use prepared statement to prevent SQL injection)
        String sql = "SELECT * FROM studentdetails WHERE firstName = ? AND NIC = ?";
        
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
                        int StdID = rs.getInt(1);
                        String fname = rs.getString(2);
                        String lname = rs.getString(3);
                        String DOB = rs.getString(4);
                        String address = rs.getString(5);
                        String year = rs.getString(6);
                        String course = rs.getString(7);
                        String nic = rs.getString(8);
                        
                        
                        // Create Exam object and add to list
                        Student c = new Student(StdID, fname, lname, DOB, address, course, year, nic);
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

public static boolean insertStudent(String fname, String lname, String dob, String address, String year, String course, String nic) {
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
        String sql = "INSERT INTO studentdetails (StudentID, firstName, lastName, DOB, Address, Year, Course, NIC) VALUES (0,?, ?, ?, ?, ?, ?, ?)";

        // Prepare statement
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, fname);  // Username
        pstmt.setString(2, lname);   // Password
        pstmt.setString(3, dob);   // Role
        pstmt.setString(4, address);  // Email
        pstmt.setString(5, year);  // Phone
        pstmt.setString(6, course);
        pstmt.setString(7, nic);
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
public static List<Student> getUserID(String ID){
	ArrayList<Student> ex = new ArrayList<>();
    
	int convertID = Integer.parseInt(ID);
    String url = "jdbc:mysql://localhost:3306/online_examinations";
    String user = "root";
    String Pass = "20030105";
    
    String sql = "SELECT * FROM studentdetails WHERE StudentID = ?";
    
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
                    int stdID = rs.getInt(1);
                    String fName = rs.getString(2);
                    String lName = rs.getString(3);
                    String dob = rs.getString(4);
                    String address = rs.getString(5);
                    String year = rs.getString(6);
                    String Course = rs.getString(7);
                    String nic = rs.getString(8);
                    
                    // Create Exam object and add to list
                    Student c = new Student(stdID, fName, lName, dob, address, year, Course, nic);
                    ex.add(c);
                }
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    return ex;
}
public static boolean updateStudent(String id, String fName, String lName, String dob, String Address, String year, String course, String nic) {
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
        String sql = "UPDATE studentdetails SET  firstName = ?, lastName = ?, DOB = ?, Address = ?, Year = ?, Course = ?, NIC = ? WHERE StudentID = ?";

        // Prepare the statement
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, fName);  // First name as a UserName
        pstmt.setString(2, lName);      
        pstmt.setString(3, dob);      
        pstmt.setString(4, Address);     
        pstmt.setString(5, year);     
        pstmt.setString(6, course); 
        pstmt.setString(7, nic); // NIC will be user Password
        pstmt.setString(8, id);   
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