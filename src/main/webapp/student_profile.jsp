<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            display: flex;
            background-color: #f0f2f5;
            color: #333;
        }
        
        .container1 {
            display: flex;
            width: 100%;
        }
        
        .sidebar {
            width: 250px;
            background: linear-gradient(145deg, #343a40, #23272b);
            color: white;
            height: 100vh;
            position: fixed;
            box-shadow: 2px 0 15px rgba(0, 0, 0, 0.1);
            padding-top: 20px;
        }
        
        .student-id {
            text-align: center;
            padding-bottom: 20px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .student-id img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 15px;
            border: 3px solid #007bff;
        }
        
        .student-id p {
            font-size: 16px;
            color: #adb5bd;
            margin-top: 10px;
        }
        
        .sidebar-menu {
            list-style: none;
            padding: 20px 0;
        }
        
        .sidebar-menu li {
            padding: 15px 25px;
            transition: background-color 0.3s ease;
            cursor: pointer;
        }
        
        .sidebar-menu li a {
            text-decoration: none;
            color: white;
            display: flex;
            align-items: center;
            font-size: 16px;
        }
        
        .sidebar-menu li a i {
            margin-right: 10px;
            font-size: 18px;
        }
        
        .sidebar-menu li:hover, .sidebar-menu li a.active {
            background-color: #007bff;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        
        .footer {
            position: absolute;
            bottom: 20px;
            left: 0;
            width: 100%;
            padding: 10px;
            text-align: center;
            font-size: 12px;
            color: #ccc;
        }
        
        .main-content {
            margin-left: 250px;
            padding: 30px;
            width: calc(100% - 250px);
            background-color: #ffffff;
            border-radius: 10px;
            min-height: calc(100vh - 60px);
        }
        
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            border-bottom: 1px solid #dee2e6;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        header h3 {
            font-size: 26px;
            color: #343a40;
        }
        
        header p {
            color: #6c757d;
            font-size: 14px;
        }
        
        .edit-profile-btn {
            background-color: #007bff;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 25px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.2);
        }
        
        .edit-profile-btn:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 20px rgba(0, 123, 255, 0.4);
        }
        
        .profile-info {
            display: flex;
            justify-content: space-between;
            margin-top: 40px;
            gap: 20px;
        }
        
        .profile-details, .result-summary {
            width: 48%;
            background-color: #f9f9f9;
            padding: 25px;
            border-radius: 10px;
            border: 1px solid #dee2e6;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        
        .profile-details h4, .result-summary h4 {
            font-size: 20px;
            margin-bottom: 20px;
            color: #343a40;
        }
        
        .profile-details p, .result-summary p {
            font-size: 16px;
            margin-bottom: 15px;
            color: #6c757d;
        }
        
        .result-box {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 15px;
            background: linear-gradient(145deg, #007bff, #0056b3);
            color: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 123, 255, 0.2);
        }
        
        .result-box h2 {
            font-size: 42px;
            font-weight: bold;
        }
        
        .result-box i {
            font-size: 42px;
            opacity: 0.8;
        }
        
        .result-table {
            margin-top: 20px;
        }
        
        .result-table table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }
        
        .result-table th, .result-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }
        
        .result-table th {
            background-color: #007bff;
            color: white;
            font-size: 16px;
        }
        
        .result-table tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        
        .result-table tr:hover {
            background-color: #e9ecef;
        }

        .section {
            display: none;
        }

        .active-section {
            display: block;
        }
    </style>
    <script>
    // Function to show only the section clicked and hide all others
    function showSection(section) {
        document.querySelectorAll('.section').forEach(function (el) {
            el.classList.remove('active-section');
        });
        document.getElementById(section).classList.add('active-section');
    }

    // Show the profile by default when the page loads
    window.onload = function() {
        showSection('profile'); // Show profile by default
    }
    </script>
</head>
<body>
   <c:forEach var="user" items="${Student}">
        <c:set var="stdID" value="${user.stdID}"/>
        <c:set var="fname" value="${user.fName}"/>
        <c:set var="lname" value="${user.lName}"/>
        <c:set var="password" value="${user.pass}"/>
        <c:set var="dob" value="${user.DOB}"/>
        <c:set var="add" value="${user.address}"/>
        <c:set var="course" value="${user.course}"/>
        <c:set var="year" value="${user.year}"/>
        
      <c:url value="EditprofileStudent.jsp" var="StudentEdit">
        <c:param name="id" value="${stdID}"/>
        <c:param name="fname" value="${fname}"/>
        <c:param name="pass" value="${password}"/>
        <c:param name="dob" value="${dob}"/>
        <c:param name="address" value="${add}"/>
        <c:param name="year" value="${year}"/>
        <c:param name="lname" value="${lname}" />
        <c:param name="course" value="${course}" />
    </c:url>
    <div class="container1">
        <!-- Sidebar -->
        <nav class="sidebar">
            <div class="student-id">
                
            </div>
            <ul class="sidebar-menu">
                <li><a href="#" onclick="showSection('profile')" class="active"><i class="fas fa-user"></i> Profile</a></li>
                <li><a href="#" onclick="showSection('results')"><i class="fas fa-chart-line"></i> Results</a></li>
                <li><a href="feedback.jsp" onclick="showSection('feedbackSection')"><i class="fas fa-comment-dots"></i> Add Feedback</a></li>
                <li><a href="displayQuestions.jsp" onclick="showSection('feedbackSection')"><i class="fas fa-pencil-alt"></i> Attempt </a></li>
                <li><a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Log out</a></li>
            </ul>
            <div class="footer">
                &copy; 2024 University
            </div>
        </nav>
        
        <!-- Main Content -->
        <div class="main-content">
            <header>
                <div>
                    <h3>Welcome, ${fname}</h3>
                    <p>Student Dashboard</p>
                </div>
                <a href="${StudentEdit}" class="edit-profile-btn">Edit Profile</a>
            </header>
            
            <!-- Profile Section -->
            <section id="profile" class="section active-section">
                <div class="profile-info">
                    <div class="profile-details">
                        <h4>Personal Information</h4>
                        <p>Student ID: ${stdID}</p>
                        <p>Name: ${fname} ${lname}</p>
                        <p>Date of Birth: ${dob}</p>
                        <p>Address: ${add}</p>
                        <p>Course: ${course}</p>
                        <p>Year: ${year}</p>
                    </div>
                </div>
            </section>
            
            <!-- Results Section -->
            <section id="results" class="section">
                <div class="result-summary">
                    <h4>Results Summary</h4>
                    <div class="result-box">
                        <div>
                            <h2>3.9</h2>
                            <p>GPA</p>
                        </div>
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <div class="result-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Subject</th>
                                    <th>Grade</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Database Systems</td>
                                    <td>A</td>
                                </tr>
                                <tr>
                                    <td>Operating Systems</td>
                                    <td>B+</td>
                                </tr>
                                <tr>
                                    <td>Web Development</td>
                                    <td>A-</td>
                                </tr>
                                <!-- Add more rows as needed -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </div>
    </div>
   </c:forEach>
</body>
</html>
