<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        form input[type="text"],
        form input[type="email"],
        form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        form input[type="submit"]:hover {
            background-color: #4cae4c;
        }

        .error {
            color: red;
            font-size: 12px;
            margin-bottom: 10px;
            display: none;
        }

        .success {
            color: green;
            font-size: 14px;
            text-align: center;
            margin-top: 20px;
        }

    </style>
    <script>
        function validateForm() {
            let name = document.forms["adminForm"]["name"].value;
            let email = document.forms["adminForm"]["email"].value;
            let phone = document.forms["adminForm"]["phone"].value;
            let role = document.forms["adminForm"]["role"].value;
            let uname = document.forms["adminForm"]["uname"].value;
            let pass = document.forms["adminForm"]["pass"].value;
            let error = false;

            // Basic validation for empty fields
            if (name == "" || email == "" || phone == "" || role == "" || uname == "" || pass == "") {
                document.getElementById('error').style.display = 'block';
                error = true;
            } else {
                document.getElementById('error').style.display = 'none';
            }

            // Email validation
            const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
            if (!email.match(emailPattern)) {
                document.getElementById('emailError').style.display = 'block';
                error = true;
            } else {
                document.getElementById('emailError').style.display = 'none';
            }

            return !error;
        }
    </script>
</head>
<body>

    <div class="container">
        <h2>Add New Admin</h2>
        <form name="adminForm" action="AdminInsertServlet" method="POST" onsubmit="return validateForm()">
            <div id="error" class="error">All fields are required!</div>
            <div id="emailError" class="error">Please enter a valid email address!</div>

            Name: <input type="text" name="name" placeholder="Enter full name"><br>
            Email: <input type="email" name="email" placeholder="Enter email"><br>
            Phone Number: <input type="text" name="phone" placeholder="Enter phone number"><br>
            Role: <input type="text" name="role" placeholder="Enter role"><br>
            Username: <input type="text" name="uname" placeholder="Enter username"><br>
            Password: <input type="password" name="pass" placeholder="Enter password"><br>
            <input type="submit" name="Add" value="Add Admin">
        </form>
    </div>

</body>
</html>
