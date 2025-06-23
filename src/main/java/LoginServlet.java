

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
            List<User> userDetails = UserDBUtil.validate(username, password);
            if (userDetails != null && !userDetails.isEmpty()) {
                request.setAttribute("userD", userDetails);
                RequestDispatcher dis = request.getRequestDispatcher("admin_dashboard.jsp");
                dis.forward(request, response);
            } else {
                // handle empty or null case
                System.out.println("No user data found.");
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}


