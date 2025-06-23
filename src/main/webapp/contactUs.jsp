<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Online Examination System</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f0f2f5;
            height: 100vh;
            background-image: linear-gradient(135deg, #f9f9f9 0%, #eef2f3 100%);
        }

        .container {
            background-color: #fff;
            padding: 30px;
            max-width: 500px;
            width: 100%;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            margin-left: 33%;
            margin-top: 5%;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        h1 {
            margin-bottom: 20px;
            text-align: center;
            color: #007BFF;
            font-weight: 600;
            font-size: 28px;
            letter-spacing: 1px;
        }

        p {
            margin-bottom: 25px;
            text-align: center;
            color: #666;
            font-size: 16px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-size: 14px;
            color: #333;
            font-weight: 500;
        }

        input, textarea {
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            background-color: #fafafa;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        input:focus, textarea:focus {
            border-color: #007BFF;
            outline: none;
        }

        textarea {
            resize: none;
        }

        button {
            padding: 14px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
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
<body>

    <div class="container">
        <h1>Contact Us</h1>
        <p>If you have any questions or need assistance, please fill out the form below, and we will get back to you as soon as possible.</p>

        <form action="submit_contact.jsp" method="POST">
            <label for="name">Full Name:</label>
            <input type="text" id="name" name="name" required placeholder="Enter your full name">

            <label for="index">Index Number:</label>
            <input type="text" id="index" name="index" required placeholder="Enter your index number">

            <label for="email">Email Address:</label>
            <input type="email" id="email" name="email" required placeholder="Enter your email">

            <label for="subject">Subject:</label>
            <input type="text" id="subject" name="subject" required placeholder="Subject of your message">

            <label for="message">Message:</label>
            <textarea id="message" name="message" rows="6" required placeholder="Write your message here..."></textarea>

            <button type="submit">Submit</button>
        </form>
    </div>

</body>
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
</html>
