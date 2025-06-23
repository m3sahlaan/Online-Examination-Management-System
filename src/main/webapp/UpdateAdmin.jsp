<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Admin Details</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            background-color: white;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0px 15px 25px rgba(0, 0, 0, 0.1);
            width: 400px;
            transition: transform 0.3s ease;
        }

        .form-container:hover {
            transform: translateY(-10px);
        }

        h2 {
            text-align: center;
            margin-bottom: 10px;
            font-weight: 600;
            color: #333;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 2px;
            color: #555;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
            transition: border 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus {
            border: 1px solid #4facfe;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #4facfe;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #00f2fe;
            box-shadow: 0px 5px 15px rgba(0, 242, 254, 0.5);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group input[readonly] {
            background-color: #f0f0f0;
            color: #888;
        }

        .form-footer {
            text-align: center;
            margin-top: 20px;
            color: #888;
        }

        .form-footer a {
            color: #4facfe;
            text-decoration: none;
            font-weight: 600;
        }

        .form-footer a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String role = request.getParameter("role");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
	%>

    <div class="form-container">
        <h2>Update Admin</h2>

        <form action="AdminUpdate" method="POST">
            <div class="form-group">
                <label for="uid">UserID</label>
                <input type="text" id="uid" name="uid" value="<%= id %>" readonly>
            </div>

            <div class="form-group">
                <label for="uname">User Name</label>
                <input type="text" id="uname" name="uname" value="<%= uname %>" required>
            </div>

            <div class="form-group">
                <label for="pass">Password</label>
                <input type="password" id="pass" name="pass" value="<%= pass %>" required>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="<%= email %>" required>
            </div>

            <div class="form-group">
                <label for="role">Role</label>
                <input type="text" id="role" name="role" value="<%= role %>" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" id="phone" name="phone" value="<%= phone %>" required>
            </div>

            <input type="submit" name="update" value="Update">
        </form>

        <div class="form-footer">
            <p><a href="admin_dashboard.jsp">Go Back</a></p>
        </div>
    </div>

</body>
</html>

