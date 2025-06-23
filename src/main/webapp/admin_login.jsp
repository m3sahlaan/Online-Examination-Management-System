<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f6;
            line-height: 1.6;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-box {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            display: flex;
        }
        .left-box {
            background-color: #eaf3eb;
            padding: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px 0 0 10px;
        }
        .left-box img {
            max-width: 200px;
        }
        .right-box {
            padding: 40px;
            width: 300px;
        }
        h2 {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
            font-size: 14px;
            color: #666;
        }
        input[type="text"],
        input[type="password"] {
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }
        .btn {
            background-color: #4caf50;
            color: #fff;
            padding: 10px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .forgot-password,
        .register {
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }
        .register a {
            color: #4caf50;
            text-decoration: none;
            font-weight: bold;
        }
        .forgot-password a {
            color: #888;
            text-decoration: none;
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
            margin-top: 5%;
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
                <li><a href="#" id="home">Home</a></li>
                <li><a href="#" id="faq-view">FAQ</a></li>
                <li><a href="#" id="contact-us-view">Contact</a></li>
                <li><a href="#" id="term&conditions">Terms & Conditions</a></li>
            </ul>
        </nav>
        <div class="search-bar">
            <input type="text" placeholder="Search Exam">
            <button>Search</button>
        </div>
    </header>

    <div class="container">
        <div class="login-box">
            <div class="left-box">
                <img src="admin.jpg" alt="Login Illustration">
            </div>
            <div class="right-box">
                <h2>Admin Login</h2>
                <!-- Form action should point to the servlet or back-end controller -->
                <form action=LoginServlet method=POST>
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="Enter your username or email" required>
                    
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>
                    
                    <input type="submit" class="btn" value="Sign in">
                    
                    <div class="forgot-password">
                        <a href="#">Forgot password?</a>
                    </div>
                    
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
    
    document.getElementById("faq-view").addEventListener("click", function() {
        window.location.href = "faq.jsp";
    });
    document.getElementById("contact-us-view").addEventListener("click", function() {
        window.location.href = "contactUs.jsp";
    });
    document.getElementById("term&conditions").addEventListener("click", function() {
        window.location.href = "TermsAndConditions.jsp";
    });
    document.getElementById("home").addEventListener("click", function() {
        window.location.href = "Index.jsp";
    });
    </script>
</body>

</html>
