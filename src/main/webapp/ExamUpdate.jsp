<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Exam Details</title>
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
        input[type="number"] {
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
        input[type="number"]:focus {
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
        String examID = request.getParameter("id");
        String examName = request.getParameter("examName");
        String course = request.getParameter("course");
        String lecID = request.getParameter("lecID");
        String examDate = request.getParameter("examDate");
        String duration = request.getParameter("duration");
        String totalMarks = request.getParameter("totalMarks");
        String status = request.getParameter("status");
    %>

    <div class="form-container">
        <h2>Update Exam Details</h2>

        <form action="ExamUpdate" method="POST">
            <div class="form-group">
                <label for="examID">Exam ID</label>
                <input type="text" id="examID" name="examID" value="<%= examID %>" readonly>
            </div>

            <div class="form-group">
                <label for="examName">Exam Name</label>
                <input type="text" id="examName" name="examName" value="<%= examName %>" required>
            </div>

            <div class="form-group">
                <label for="course">Course</label>
                <input type="text" id="course" name="course" value="<%= course %>" required>
            </div>

            <div class="form-group">
                <label for="lecID">Lecturer ID</label>
                <input type="text" id="lecID" name="lecID" value="<%= lecID %>" required>
            </div>

            <div class="form-group">
                <label for="examDate">Exam Date</label>
                <input type="date" id="examDate" name="examDate" value="<%= examDate %>" required>
            </div>

            <div class="form-group">
                <label for="duration">Duration (in minutes)</label>
                <input type="number" id="duration" name="duration" value="<%= duration %>" required>
            </div>

            <div class="form-group">
                <label for="totalMarks">Total Marks</label>
                <input type="number" id="totalMarks" name="totalMarks" value="<%= totalMarks %>" required>
            </div>

            <div class="form-group">
                <label for="status">Status</label>
                <input type="text" id="status" name="status" value="<%= status %>" required>
            </div>

            <input type="submit" name="update" value="Update Exam">
        </form>
    </div>

</body>
</html>
