import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDBUtil {
	
	public static List<User> validate(String username, String password){
		ArrayList<User> ex = new ArrayList<>();
        
        String url = "jdbc:mysql://localhost:3306/online_examinations";
        String user = "root";
        String Pass = "20030105";
        
        // SQL query (use prepared statement to prevent SQL injection)
        String sql = "SELECT * FROM userdetails WHERE UserName = ? AND password = ?";
        
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
                        int UserID = rs.getInt(1);
                        String UserName = rs.getString(2);
                        String passw = rs.getString(3);
                        String Role = rs.getString(4);
                        String Email = rs.getString(5);
                        String Phone = rs.getString(6);
                        
                        // Create Exam object and add to list
                        User c = new User(UserID, UserName, passw, Role, Email, Phone);
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
	
	public static boolean insertAdmin(String name, String email, String phone, String uname, String pass, String role) {
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
	        String sql = "INSERT INTO userdetails (UserID, UserName, Password, Role, Email, PhoneNumber) VALUES (0,?, ?, ?, ?, ?)";

	        // Prepare statement
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, uname);  // Username
	        pstmt.setString(2, pass);   // Password
	        pstmt.setString(3, role);   // Role
	        pstmt.setString(4, email);  // Email
	        pstmt.setString(5, phone);  // Phone

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


public static boolean updateAdmin(String id, String UserName, String Pass, String Role, String email, String phone) {
	boolean isSuccess = false;

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Establish the connection
        conn = DBConnect.getConnection();

        // SQL UPDATE query
        String sql = "UPDATE userdetails SET UserName = ?, Password = ?, Role = ?, Email = ?, PhoneNumber = ? WHERE UserID = ?";

        // Prepare the statement
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, UserName);  // Set UserName
        pstmt.setString(2, Pass);      // Set Password
        pstmt.setString(3, Role);      // Set Role
        pstmt.setString(4, email);     // Set Email
        pstmt.setString(5, phone);     // Set PhoneNumber
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



public static List<User> getUserID(String ID){
	ArrayList<User> ex = new ArrayList<>();
    
	int convertID = Integer.parseInt(ID);
    String url = "jdbc:mysql://localhost:3306/online_examinations";
    String user = "root";
    String Pass = "20030105";
    
    String sql = "SELECT * FROM userdetails WHERE UserID = ?";
    
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
                    int UserID = rs.getInt(1);
                    String UserName = rs.getString(2);
                    String passw = rs.getString(3);
                    String Role = rs.getString(4);
                    String Email = rs.getString(5);
                    String Phone = rs.getString(6);
                    
                    // Create Exam object and add to list
                    User c = new User(UserID, UserName, passw, Role, Email, Phone);
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