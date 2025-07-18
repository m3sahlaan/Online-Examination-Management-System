<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lecture Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
        }

        .wrapper {
            display: flex;
            width: 100%;
        }

        .sidebar {
            width: 250px;
            background-color: #343a40;
            color: white;
            height: 100vh;
            position: fixed;
        }

        .sidebar-header {
            padding: 20px;
            background: #007bff;
            text-align: center;
        }

        .list-items {
            list-style: none;
            padding: 20px 0;
        }

        .list-items li {
            padding: 15px 20px;
        }

        .list-items li a {
            text-decoration: none;
            color: white;
            display: flex;
            align-items: center;
        }

        .list-items li a i {
            margin-right: 10px;
        }

        .list-items li a:hover, .list-items li a.active {
            background-color: #007bff;
        }

        .main-content {
            margin-left: 250px;
            width: calc(100% - 250px);
            padding: 20px;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }

        .user-info {
            display: flex;
            align-items: center;
        }

        .user-info span {
            margin-right: 20px;
        }

        .logout {
            text-decoration: none;
            color: #007bff;
        }

        .dashboard-cards {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            flex: 1;
            padding: 20px;
            border-radius: 8px;
            color: white;
            text-align: center;
            position: relative;
        }

        .card h2 {
            font-size: 48px;
        }

        .card p {
            font-size: 20px;
        }

        .card a {
            position: absolute;
            bottom: 20px;
            right: 20px;
            color: white;
            text-decoration: none;
        }

        .card.blue {
            background-color: #17a2b8;
        }

        .card.yellow {
            background-color: #ffc107;
        }

        .card.red {
            background-color: #dc3545;
        }

        .form-container {
            display: none;
            margin-top: 20px;
        }

        .form-container form input[type="text"],
        .form-container form input[type="email"],
        .form-container form input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .form-container form input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .form-container form input[type="submit"]:hover {
            background-color: #4cae4c;
        }

        .section {
            display: none; /* Hide all sections by default */
        }

        .student-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .student-table th, .student-table td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        .student-table th {
            background-color: #4facfe;
            color: white;
        }

        .student-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .student-table tr:hover {
            background-color: #ddd;
        }

        .list-container {
            width: 80%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        

    </style>
    <script>
        // Function to show only the section clicked and hide all others
        function showSection(section) {
            document.querySelectorAll('.section').forEach(function (el) {
                el.style.display = 'none'; // Hide all sections
            });
            document.getElementById(section).style.display = 'block'; // Show the requested section
        }

        // Show the dashboard by default when the page loads
        window.onload = function() {
            showSection('dashboardSection'); // Show dashboard by default
        }
    </script>
    <script>
        // Simulating data fetching from a backend or database
        const studentList = [
            { id: 1, name: "John Doe", faculty: "Computer Science" },
            { id: 2, name: "Jane Smith", faculty: "Information Technology" }
        ];
    
        const examList = [
            { id: 1, examName: "Midterm Exam", duration: "2 hours" },
            { id: 2, examName: "Final Exam", duration: "3 hours" }
        ];
    
        const resultList = [
            { id: 1, studentName: "John Doe", score: "85%" },
            { id: 2, studentName: "Jane Smith", score: "90%" }
        ];
    
        // Function to update card counts
        function updateCardCounts() {
            document.getElementById('studentCount').textContent = studentList.length;
            document.getElementById('lectureCount').textContent = lectureList.length;
            document.getElementById('examCount').textContent = examList.length;
            document.getElementById('resultCount').textContent = resultList.length;
        }
    
        // Call the function when the page loads
        window.onload = function() {
            showSection('dashboardSection'); // Show dashboard by default
            updateCardCounts(); // Update card counts
        }
    </script>
</head>
<body>
    <div class="wrapper">
        <nav class="sidebar">
            <div class="sidebar-header">
                <h3>LOGO</h3>
            </div>
            <ul class="list-items">
                <li><a href="#" class="active" onclick="showSection('dashboardSection')"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="#" onclick="showSection('studentListSection')"><i class="fas fa-users"></i> Student List</a></li>
                <li><a href="#" onclick="showSection('examListSection')"><i class="fas fa-file-alt"></i> Exam List</a></li>
                <li><a href="#" onclick="showSection('resultsListSection')"><i class="fas fa-poll"></i> Results List</a></li>
                <li><a href="QuestionBank.jsp" onclick="showSection('QuestionListSection')"><i class="fas fa-poll"></i> Add Questions</a></li>
                <li><a href="ViewFeedback.jsp" onclick="showSection('resultsListSection')"><i class="fas fa-poll"></i> View Feedback</a></li>
                <li><a href="LogoutServlet"><i class="fas fa-sign-out-alt"></i> Log out</a></li>
            </ul>
        </nav>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Topbar -->
            <header class="topbar">
                <h4>Dashboard</h4>
                 <div class="user-info">
                   <c:forEach var="user" items="${userD}">
                   		<span>${user.firstName}</span>
                   </c:forEach>
                   </div>
            </header>

            <!-- Dashboard Section -->
            <div id="dashboardSection" class="section">
                <h2>Welcome to the Admin Dashboard</h2>
                <div class="dashboard-cards">
                    <div class="card blue" onclick="showSection('studentListSection')">
                        <h2 id="studentCount">0</h2> <!-- Updated to use an ID -->
                        <p>Students</p>
                        <a href="#">View</a>
                    </div>
                    <div class="card yellow" onclick="showSection('examListSection')">
                        <h2 id="examCount">0</h2> <!-- Updated to use an ID -->
                        <p>Exams</p>
                        <a href="#">View</a>
                    </div>
                    <div class="card red" onclick="showSection('resultsListSection')">
                        <h2 id="resultCount">0</h2> <!-- Updated to use an ID -->
                        <p>Results</p>
                        <a href="#">View</a>
                    </div>
                </div>
            </div>

            <!-- Student List Section -->
            <div id="studentListSection" class="section">
    <h2>Students List</h2>
    <table class="student-table">
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Faculty</th>
            <th>Action</th>
        </tr>

			        <%
			            String jdbcUrl = "jdbc:mysql://localhost:3306/online_examinations"; 
			            String jdbcUser = "root"; 
			            String jdbcPassword = "20030105";
			            Connection conn = null;
			            Statement stmt = null;
			            ResultSet rs = null;
			
			            try {
			                // Load JDBC driver (Optional in newer versions of JDBC)
			                Class.forName("com.mysql.cj.jdbc.Driver");
			
			                // Establishing a database connection
			                conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
			
			                // Creating a statement to execute SQL query
			                stmt = conn.createStatement();
			
			                // SQL query to retrieve student data
			                String sql = "SELECT * FROM studentdetails";
			                rs = stmt.executeQuery(sql);
			
			                // Loop through the result set to display each student
			                while (rs.next()) {
			                    int id = rs.getInt("StudentID");
			                    String fullName = rs.getString("firstName");
			                    String faculty = rs.getString("Course");
			        %>
			                    <tr>
			                        <td><%= id %></td>
			                        <td><%= fullName %></td>
			                        <td><%= faculty %></td>
			                        <td><a href="StudentDelete?id=<%= id %>">Delete</a></td>
			                    </tr>
			        <%
			                }
			            } catch (Exception e) {
			                out.println("Error: " + e.getMessage());
			            } finally {
			                // Close the JDBC resources
			                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
			                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
			                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
			            }
			        %>
			    </table>
			</div>

            <!-- Exam List Section -->
            <div id="examListSection" class="list-container section">
                <h2>Exams List</h2>
               <table class="exam-table">
        <tr>
            <th>Exam ID</th>
            <th>Exam Name</th>
            <th>Lecture ID</th>
            <th>Course Name</th>
            <th>Duration</th>
            <th>Exam Date</th>
            <th>Status</th>
            <th>Total Marks</th>
            <th>Action</th>
        </tr>

			        <%  
			        
			            try {
			                // Load JDBC driver (Optional in newer versions of JDBC)
			                Class.forName("com.mysql.cj.jdbc.Driver");
			
			                // Establishing a database connection
			                conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
			
			                // Creating a statement to execute SQL query
			                stmt = conn.createStatement();
			
			                // SQL query to retrieve student data
			                String sql = "SELECT * FROM examdetail";
			                rs = stmt.executeQuery(sql);
			
			                // Loop through the result set to display each student
			                while (rs.next()) {
			                    int exid = rs.getInt("examID");
			                    String exName = rs.getString("examName");
			                    int lectID = rs.getInt("lecID");
			                    String course = rs.getString("Course");
			                    int duration = rs.getInt("duration");
			                    String date = rs.getString("examDate");
			                    String status = rs.getString("status");
			                    int marks = rs.getInt("TotalMarks");
			        %>
			                    <tr>
			                        <td><%= exid %></td>
			                        <td><%= exName %></td>
			                        <td><%= lectID %></td>
			                        <td><%= course %></td>
			                        <td><%= duration %></td>
			                        <td><%= date %></td>
			                        <td><%= status %></td>
			                        <td><%= marks %></td>
			                        <td><a href="ExamUpdate.jsp?id=<%= exid %>&examName=<%= exName %>&course=<%= course %>&lecID=<%= lectID %>&examDate=<%= date %>&duration=<%= duration %>&totalMarks=<%= marks %>&status=<%= status %>">Edit</a>|<a href="ExamDelete?id=<%= exid %>">Delete</a></td>
			                    </tr>
			        <%
			                }
			            } catch (Exception e) {
			                out.println("Error: " + e.getMessage());
			            } finally {
			                // Close the JDBC resources
			                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
			                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
			                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
			            }
			        %>
			    </table>
			</div>

            <!-- Results List Section -->
            <div id="resultsListSection" class="section">
    <h2>Result List</h2>
    <table class="result-table">
        <tr>
            <th>Result ID</th>
            <th>Schedule ID</th>
            <th>Total Marks</th>
            <th>Grade</th>
            <th>Result Status</th>
            <th>Action</th>
        </tr>

			        <%
			            try {
			                // Load JDBC driver (Optional in newer versions of JDBC)
			                Class.forName("com.mysql.cj.jdbc.Driver");
			
			                // Establishing a database connection
			                conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
			
			                // Creating a statement to execute SQL query
			                stmt = conn.createStatement();
			
			                // SQL query to retrieve student data
			                String sql = "SELECT * FROM resultdetail";
			                rs = stmt.executeQuery(sql);
			
			                // Loop through the result set to display each student
			                while (rs.next()) {
			                    int r_id = rs.getInt("resultID");
			                    int s_id = rs.getInt("scheduleID");
			                    int marks = rs.getInt("totalMarks");
			                    String grade = rs.getString("grade");
			                    String status = rs.getString("resultStatus");
			        %>
			                    <tr>
			                        <td><%= r_id %></td>
			                        <td><%= s_id %></td>
			                        <td><%= marks %></td>
			                        <td><%= grade %></td>
			                        <td><%= status %></td>
			                        <td><a href="resultUpdate.jsp?id=<%= r_id %>&sid=<%= s_id %>&marks=<%= marks %>&grade=<%= grade %>&status=<%= status %>">Edit</a> |
    <a href="ResultDelete?id=<%= r_id %>">Delete</a></td>
			                    </tr>
			        <%
			                }
			            } catch (Exception e) {
			                out.println("Error: " + e.getMessage());
			            } finally {
			                // Close the JDBC resources
			                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
			                if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
			                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
			            }
			        %>
			    </table>
			</div>
        </div>
    </div>
</body>
</html>
