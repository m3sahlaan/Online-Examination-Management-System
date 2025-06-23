<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Exam Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f7f7f7;
            line-height: 1.6;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 40px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            position: relative;
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

        .hero {
            background: linear-gradient(45deg, #ffe066, #00d4ff);
            height: 500px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            text-align: center;
            padding: 0 20px;
        }

        .hero-content {
            max-width: 600px;
        }

        .hero-content h2 {
            font-size: 48px;
            margin-bottom: 10px;
        }

        .hero-content p {
            font-size: 20px;
            margin-top: 10px;
        }

        .hero button {
            background-color: orange;
            border: none;
            padding: 12px 24px;
            color: white;
            cursor: pointer;
            margin-top: 20px;
            border-radius: 5px;
            font-size: 16px;
            transition: background 0.3s;
        }

        .hero button:hover {
            background-color: #d68e00;
        }

        .login-section {
            display: flex;
            justify-content: center;
            padding: 40px 20px;
            gap: 30px;
        }

        .login-box {
            width: 240px;
            height: 240px;
            background-color: #ddd;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            text-align: center;
            transition: transform 0.5s, box-shadow 0.3s; 
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: -40px;
        }

        .login-box:hover {
            transform: translateY(-10px); /* Hover effect */
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .login-box h3 {
            color: white;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .admin-login {
            background-color: #fcbf49;
        }

        .lecture-login {
            background-color: #0096c7;
        }

        .student-login {
            background-color: #52b788;
        }

        .login-box button {
            background-color: #fff;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            color: #333;
            margin-top: 10px;
            border-radius: 5px;
            transition: background 0.3s;
        }

        .login-box button:hover {
            background-color: #e6e6e6;
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

    <section class="hero">
        <div class="hero-content">
            <h2>Welcome</h2>
            <p>Safe and Stable Connection</p>
            <button id="about-us-btn">About Us</button>
        </div>
    </section>

    <section class="login-section">
        <div class="login-box admin-login">
    		<h3>Admin Login</h3>
    		<button id="admin-login-btn">View More</button>
		</div>
        <div class="login-box lecture-login">
            <h3>Lecture Login</h3>
            <button id="lecture-login-btn">View More</button>
        </div>
        <div class="login-box student-login">
            <h3>Student Login</h3>
            <button id="student-login-btn">View More</button>
        </div>
    </section>

    <footer>
        
        <div class="footer-bottom">
            <p>&copy; 2024 TestPro. All rights reserved.</p>
        </div>
    </footer>

    <script>
        // Function to animate login boxes
        function animateBox(box) {
            const originalPosition = box.style.transform;
            box.style.transform = originalPosition + ' translateY(-10px)'; // Move up
            setTimeout(() => {
                box.style.transform = originalPosition; // Move back down
            }, 500);
        }
        
        
        //view clicks
        document.getElementById("admin-login-btn").addEventListener("click", function() {
        window.location.href = "admin_login.jsp";
    	});
        document.getElementById("lecture-login-btn").addEventListener("click", function() {
            window.location.href = "lecture_login.jsp";
        });
        document.getElementById("student-login-btn").addEventListener("click", function() {
            window.location.href = "student_login.jsp";
        });
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
        document.getElementById("home").addEventListener("click", function() {
            window.location.href = "Index.jsp";
        });
        
        
    </script>
</body>
</html>
    