<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Question Detail</title>
    <style>
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #f0f3f5, #e9ecef);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
            animation: fadeIn 1s ease;
            transition: transform 0.3s ease;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h1 {
            text-align: center;
            color: #343a40;
            margin-bottom: 20px;
            font-size: 24px;
            position: relative;
        }

        h1::after {
            content: '';
            display: block;
            width: 50px;
            height: 5px;
            background: #007bff;
            margin: 10px auto 0;
            border-radius: 5px;
        }

        label {
            display: block;
            font-size: 14px;
            color: #495057;
            margin-bottom: 8px;
        }

        input, textarea, select {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            font-size: 16px;
            background-color: #f8f9fa;
            margin-bottom: 20px;
            transition: border-color 0.3s ease, background-color 0.3s ease;
        }

        input:focus, select:focus, textarea:focus {
            outline: none;
            border-color: #007bff;
            background-color: #e9f5ff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
        }

        input[type="submit"], input[type="reset"] {
            background-color: #002366;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease, transform 0.3s ease;
            padding: 12px;
            border-radius: 8px;
            margin-right: 10px; /* Add space between buttons */
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 12px rgba(0, 86, 179, 0.2);
            transform: translateY(-2px);
        }

        input[type="submit"]:active, input[type="reset"]:active {
            background-color: #004494;
            transform: translateY(0);
        }

        .error {
            color: red;
            font-size: 12px;
            margin-bottom: 10px;
        }

      
        body::before, body::after {
            content: "";
            position: absolute;
            border-radius: 50%;
            background: rgba(0, 123, 255, 0.1);
            filter: blur(80px);
            z-index: -1;
        }

        body::before {
            width: 600px;
            height: 600px;
            top: -100px;
            left: -150px;
            background: rgba(0, 123, 255, 0.2);
        }

        body::after {
            width: 500px;
            height: 500px;
            bottom: -120px;
            right: -150px;
            background: rgba(0, 123, 255, 0.2);
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Add Question Detail</h1>
    <form id="questionForm" action=QuestionInsert method="POST">
        <div id="errorMessage" class="error"></div>

        <label for="examID">Exam ID:</label>
        <input type="number" id="examID" name="examID" placeholder="Enter Exam ID" required>

        <label for="questionText">Question Text:</label>
        <textarea id="questionText" name="questionText" placeholder="Enter Question Text" required></textarea>

        <label for="marks">Marks:</label>
        <input type="number" id="marks" name="marks" placeholder="Enter Marks" required min="1" max="100">

        <label for="questionType">Question Type:</label>
        <select id="questionType" name="questionType" required>
            <option value="">Select Type</option>
            <option value="MCQ">MCQ</option>
            <option value="Subjective">Subjective</option>
        </select>
        
        <div style="display: flex; justify-content: space-between;">
            <input type="submit" value="Submit">
            <input type="reset" value="Reset">
        </div>
    </form>
</div>

<script>
    // JavaScript validation and form submission handling
    document.getElementById('questionForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent form submission to validate first

        const examID = document.getElementById('examID').value;
        const questionText = document.getElementById('questionText').value;
        const marks = document.getElementById('marks').value;
        const questionType = document.getElementById('questionType').value;
        const errorMessage = document.getElementById('errorMessage');

        // Clear any previous error message
        errorMessage.textContent = '';

        // Validation checks
        if (examID <= 0) {
            errorMessage.textContent = 'Exam ID must be a positive number.';
            return;
        }

        if (marks < 1 || marks > 100) {
            errorMessage.textContent = 'Marks must be between 1 and 100.';
            return;
        }

        if (questionType === '') {
            errorMessage.textContent = 'Please select a valid question type.';
            return;
        }

        // If validation passes, you can submit the form
        alert('Form submitted successfully!');

        // we simply submit the form
        document.getElementById('questionForm').submit();
    });
</script>

</body>
</html>
