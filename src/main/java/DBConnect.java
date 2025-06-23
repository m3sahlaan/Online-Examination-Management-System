import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static String url = "jdbc:mysql://localhost:3306/online_examinations";
    private static String dbUser = "root";
    private static String dbPass = "Sabeshan@271";
    private static Connection conn;
    
    public static Connection getConnection() {
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		conn = DriverManager.getConnection(url, dbUser, dbPass);
    		
    	}catch(Exception e){
    		System.out.println("Database connection is not success ful!!!");
    	}
    	return conn;
    }
    
}
