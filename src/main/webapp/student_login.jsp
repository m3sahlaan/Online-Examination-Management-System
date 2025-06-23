<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - TEST PRO</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background-color: #e8f5e9;
        }
        
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
            width: 50%; 
            margin-left: 25%;
            margin-top: 8%;
        }

        .left-section {
            width: 40%; 
            background-color: #c8e6c9;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .left-section img {
            max-width: 100%;
            height: auto;
        }

        .right-section {
            width: 40%;
            padding: 40px;
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            width: 100%;
            max-width: 400px;
        }

        .form-container h1 {
            font-size: 32px;
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .form-container label {
            font-size: 14px;
            margin-bottom: 8px;
            display: block;
            color: #555;
        }

        .form-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        .form-container .login-btn {
            width: 100%;
            padding: 12px;
            background-color: #0288d1;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .form-container .login-btn:hover {
            background-color: #0277bd;
        }

        .forgot-password {
            display: block;
            margin-bottom: 20px;
            font-size: 12px;
            color: #0288d1;
            text-align: right;
        }

        .divider {
            text-align: center;
            margin: 20px 0;
            color: #888;
            position: relative;
        }

        .divider::before,
        .divider::after {
            content: "";
            position: absolute;
            width: 45%;
            height: 1px;
            background-color: #ccc;
            top: 50%;
        }

        .divider::before {
            left: 0;
        }

        .divider::after {
            right: 0;
        }

        .signup-text {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }

        .signup-text a {
            color: #0288d1;
            text-decoration: none;
        }

        .signup-text a:hover {
            text-decoration: underline;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            position: relative;
	    background: linear-gradient(45deg, #ffe066, #00d4ff);
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
           height: 50px; 
           margin-right: 25px; 
           mix-blend-mode: multiply;
        }

        nav {
           display: inline;
           position: relative;
        }

        nav ul {
            list-style-type: none;
            display: flex;
            gap: 30px; /* Increased gap between nav items */
        }

        nav ul li {
            position: relative;
        }

        nav ul li a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            transition: color 0.3s, padding 0.3s;
            padding: 12px 15px; /* Increased padding for larger hit area */
            border-radius: 5px;
        }

        nav ul li a:hover {
            background-color: rgba(255, 165, 0, 0.2); /* Light orange background on hover */
            color: orange;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Add shadow on hover */
        }

        .search-bar {
            display: flex;
            align-items: center;
	    display: inline-block;
        }

        .search-bar input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border 0.3s;
            width: 200px; /* Fixed width for input */
        }

        .search-bar input:focus {
            border-color: orange;
            outline: none;
        }

        .search-bar button {
            padding: 10px 15px;
            background-color: orange;
            color: white;
            border: none;
            cursor: pointer;
            margin-left: 5px;
            border-radius: 5px;
            transition: background 0.3s;
        }

        .search-bar button:hover {
            background-color: #d68e00;
        }


		footer {
            background-color: #333; /* Dark background for contrast */
            color: white;
            padding: 20px 40px;
            text-align: center;
            margin-top: 8%;
        }

        

        .footer-bottom {
            margin-top: 10px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<header>
        <div class="logo">
            <img src="testpro.png" alt="Logo">
            <h2>Online Examination System</h2>
        </div>
        <nav>
            <ul>
                <li><a href="Index.jsp" id="home">Home</a></li>
                <li><a href="faq.jsp" id="faq-view">FAQ</a></li>
                <li><a href="contactUs.jsp" id="contact-us-view">Contact</a></li>
                <li><a href="TermsAndConditions.jsp" id="term&conditions">Terms & Conditions</a></li>
            </ul>
        </nav>
        <div class="search-bar">
            <input type="text" placeholder="Search Exam">
            <button>Search</button>
        </div>
    </header>
    <div class="container">
        <div class="left-section">
            <div class="illustration">
                <img src="podiyan.jpg" alt="TEST PRO Illustration">
            </div>
            <h2>TEST PRO</h2>
            <p>Unleash Your Academic Success with TEST PRO's Exam Excellence Platform</p>
        </div>
        <div class="right-section">
            <div class="form-container">
                <h1><strong>STUDENT LOGIN</strong></h1>

                <!-- JSP form to handle login -->
                <form action=StudentLogin method=POST>
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter Your FirstName" required>

                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter Your NIC" required>

                    <button type="submit" class="login-btn">Sign in</button>

                    <p class="signup-text">New here? <a href="StudentDetails.jsp">Register</a></p>
                </form>

              
            </div>
        </div>
    </div>
    <footer>
        
        <div class="footer-bottom">
            <p>&copy; 2024 TestPro. All rights reserved.</p>
        </div>
    </footer>
    <script>
    document.getElementById("about-us-btn").addEventListener("click", function() {
        window.location.href = "aboutUs.jsp";
    });
    document.getElementById("faq-view").addEventListener("click", function() {
        window.location.href = "faq.jsp";
    });
    document.getElementById("contact-us-view").addEventListener("click", function() {
        window.location.href = "contactUs.jsp";
    });
    document.getElementById("term&conditions").addEventListener("click", function() {
        window.location.href = "TermsAndConditions.jsp";
    });
    document.getElementById("home").addEventListener("click", function(event) {
        event.preventDefault(); 
        window.location.href = "Index.jsp";
    });

    </script>
</body>
</html>
