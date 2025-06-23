<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Examination.FeedbackDBUtil" %>
<%@ page import="com.Examination.Feedback" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Feedback</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 80%;
            height: 80%;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .box {
            background-color: #e0e0e0;
            margin: 15px 0;
            padding: 15px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.1);
            background: linear-gradient(90deg, #eebebe, #b2c2f3);
            height: 8%;
        }

        .text {
            color: white;
            font-weight: bold;
            flex: 1;
            font-size: 120%;
        }

        .rating {
            color: #333;
            font-weight: bold;
            font-size: 100%;
            margin-left: 20px;
        }

        .back-btn {
            display: block;
            width: 100px;
            margin: 20px auto;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
        }

        .back-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Feedback</h1><br>

        <%
            // Get feedback list from database using FeedbackDBUtil
            List<Feedback> feedbackList = FeedbackDBUtil.getFeedbackList();
            if (feedbackList != null && !feedbackList.isEmpty()) {
                for (Feedback feedback : feedbackList) {
        %>
                    <div class="box">
                        <div class="text">
                            <%= feedback.getFeedbackID() %>. <%= feedback.getFeedbackTEXT() %>
                        </div>
                        <div class="rating">Rating: <%= feedback.getRating() %></div>
                    </div>
        <%
                }
            } else {
        %>
            <p>No feedback available.</p>
        <%
            }
        %>

        <!-- Back button to redirect to lecture_dashboard.jsp -->
        <a href="lecture_dashboard.jsp" class="back-btn">Back</a>
    </div>
</body>
</html>
