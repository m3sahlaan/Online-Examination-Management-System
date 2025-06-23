<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Examination Feedback Form</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        h1 {
            text-align: center;
            margin-bottom: 10px;
            color: #333;
        }

        p {
            text-align: center;
            margin-bottom: 20px;
            color: #555;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        input, select, textarea {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            width: 100%;
        }

        .button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .button:hover {
            background-color: #45a049;
        }

    </style>
    <script>
        function showAlert() {
            alert("Thank you for your feedback!");
            return true; // Allow the form to be submitted
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Examination Feedback</h1>
        <p>Please provide your feedback to help us improve the online examination experience.</p>
        <form action="FeedbackInsert" method="POST" onsubmit="return showAlert();"> 
            <label for="name">Exam ID:</label>
            <input type="text" id="name" name="examid" placeholder="Give the Exam ID" required>

            <label for="email">StudentID:</label>
            <input type="text" id="email" name="stdid" placeholder="Enter your Student ID" required>

            <label for="rating">Overall Experience:</label>
            <select id="rating" name="rating" required>
                <option value="" disabled selected>Choose rating</option>
                <option value="excellent">Excellent</option>
                <option value="good">Good</option>
                <option value="average">Average</option>
                <option value="poor">Poor</option>
            </select>

            <label for="feedback">Your Feedback:</label>
            <textarea id="feedback" name="feedback" rows="4" placeholder="Share your experience..." required></textarea>

            <input type="submit" name="submit" value="Submit Feedback" class="button">
        </form>
    </div>
</body>
</html>
