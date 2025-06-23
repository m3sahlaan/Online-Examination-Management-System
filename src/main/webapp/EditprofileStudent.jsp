<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student Profile</title>
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
            margin-bottom: 20px;
            font-weight: 600;
            color: #333;
        }

        label {
            font-weight: 600;
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"],
        input[type="date"],
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
        input[type="date"]:focus,
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
        String studentID = request.getParameter("id");
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String dob = request.getParameter("dob");
        String address = request.getParameter("address");
        String year = request.getParameter("year");
        String course = request.getParameter("course");
        String nic = request.getParameter("pass");
    %>

    <div class="form-container">
        <h2>Update Student Profile</h2>

        <form action="StudentUpdate" method="POST">
            <div class="form-group">
                <label for="studentID">Student ID</label>
                <input type="text" id="studentID" name="stdID" value="<%= studentID %>" readonly>
            </div>

            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" name="fName" value="<%= firstName %>" required>
            </div>

            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lName" value="<%= lastName %>" required>
            </div>

            <div class="form-group">
                <label for="dob">Date of Birth</label>
                <input type="text" id="dob" name="dob" value="<%= dob %>" required>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" value="<%= address %>" required>
            </div>

            <div class="form-group">
                <label for="year">Year</label>
                <input type="text" id="year" name="year" value="<%= year %>" required>
            </div>

            <div class="form-group">
                <label for="course">Course</label>
                <input type="text" id="course" name="course" value="<%= course %>" required>
            </div>

            <div class="form-group">
                <label for="nic">NIC</label>
                <input type="text" id="nic" name="nic" value="<%= nic %>" required>
            </div>

            <input type="submit" name="update" value="Update Profile">
        </form>
    </div>

</body>
</html>
