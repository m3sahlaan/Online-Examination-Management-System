
public class User {
    private int userID;
    private String userName;
    private String password;
    private String role;
    private String email;
    private String phone;
    
    public User(int userID, String userName, String password, String role, String email, String phone) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.role = role;
        this.email = email;
        this.phone = phone;
    }

  
    public int getUserID() {
        return userID;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }
}

	
	
	
	


