

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class AdminUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		String id = request.getParameter("uid");
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String role = request.getParameter("role");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		boolean isTrue;
		
		isTrue = UserDBUtil.updateAdmin(id, uname, pass, role, email, phone);
		
		if (isTrue == true) {
			List<User> UserD = UserDBUtil.getUserID(id);
			request.setAttribute("userD", UserD);
			
			RequestDispatcher dis = request.getRequestDispatcher("userprofile.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
		}
		
		
	}

}
