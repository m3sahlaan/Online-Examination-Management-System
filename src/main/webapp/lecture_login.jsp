<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lecturer Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #f9fbe7);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            z-index: 1;
        }
        .login-box {
            background-color: #fff;
            padding: 40px;
            width: 400px;
            border-radius: 12px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            position: relative;
            z-index: 2;
        }
        .login-box h2 {
            font-size: 28px;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 10px;
        }
        .login-box p {
            font-size: 14px;
            color: #7f8c8d;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            font-size: 14px;
            color: #34495e;
            text-align: left;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="password"] {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ddd;
            font-size: 16px;
            width: 100%;
            transition: border-color 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #3498db;
            outline: none;
        }
        .btn {
            background-color: #3498db;
            color: #fff;
            padding: 12px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .btn:hover {
            background-color: #2980b9;
            transform: translateY(-3px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        .forgot-password,
        .register {
            font-size: 14px;
            margin-top: 15px;
        }
        .forgot-password a {
            color: #7f8c8d;
            text-decoration: none;
        }
        .register a {
            color: #3498db;
            font-weight: bold;
            text-decoration: none;
        }
        .logo-box {
            margin-bottom: 30px;
        }
        .logo-box img {
            max-width: 100px;
        }

        /* Background circles for styling */
        .bg-circle1, .bg-circle2 {
            position: absolute;
            border-radius: 50%;
            filter: blur(90px);
            opacity: 0.2;
        }
        .bg-circle1 {
            width: 400px;
            height: 400px;
            background: #3498db;
            top: -50px;
            left: -100px;
        }
        .bg-circle2 {
            width: 300px;
            height: 300px;
            background: #2ecc71;
            bottom: -80px;
            right: -100px;
        }
    </style>
</head>
<body>

    <!-- Decorative background circles -->
    <div class="bg-circle1"></div>
    <div class="bg-circle2"></div>

    <div class="container">
        <div class="login-box">
            <div class="logo-box">
                <!-- You can replace this with an actual logo image -->
                <img src="admin.jpg" alt="Logo">
            </div>
            <h2>Lecturer Login</h2>
            <p>Access your teaching materials and manage student grades</p>
            <!-- The form action points to a servlet for processing -->
            <form action="LectureServelet" method="POST">
                <label for="username">Lecture ID</label>
                <input type="text" id="username" name="username" placeholder="Enter your username or email" required>
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
                <button type="submit" class="btn">Login</button>
                <div class="forgot-password">
                    <a href="#">Forgot password?</a>
                </div>
                <div class="register">
                    <span>Need an account? <a href="LecturerDetails.jsp">Register</a></span>
                </div>
            </form>
        </div>
    </div>

</body>
</html>
