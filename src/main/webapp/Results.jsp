<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Result</title>
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

        input, select {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            font-size: 16px;
            background-color: #f8f9fa;
            margin-bottom: 20px;
            transition: border-color 0.3s ease, background-color 0.3s ease;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #007bff;
            background-color: #e9f5ff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
        }

        input[type="submit"] {
            background-color: #002366;
            color: white;
            border: none;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, box-shadow 0.3s ease, transform 0.3s ease;
            padding: 12px;
            border-radius: 8px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 12px rgba(0, 86, 179, 0.2);
            transform: translateY(-2px);
        }

        input[type="submit"]:active {
            background-color: #004494;
            transform: translateY(0);
        }

        .error {
            color: red;
            font-size: 12px;
            margin-bottom: 10px;
        }

        /* Background shapes for styling */
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
    <h1>Submit Result</h1>
    <form id="resultForm" action="ResultInsert" method="POST">
        <!-- Error message area -->
        <div id="errorMessage" class="error"></div>

      
        <label for="scheduleID">Schedule ID:</label>
        <input type="number" id="scheduleID" name="scheduleID" required>

        <label for="totalMarks">Total Marks:</label>
        <input type="number" id="totalMarks" name="totalMarks" required>

        <label for="grade">Grade:</label>
        <input type="text" id="grade" name="grade" maxlength="2" required>

        <label for="resultStatus">Result Status:</label>
        <select id="resultStatus" name="resultStatus" required>
            <option value="">Select status</option>
            <option value="pass">Pass</option>
            <option value="fail">Fail</option>
        </select>

        <input type="submit" value="Submit Result">
    </form>
</div>

<script>
    // JavaScript validation
    document.getElementById('resultForm').addEventListener('submit', function (event) {
        // Prevent form submission for validation
        event.preventDefault();

        // Get form elements
        const scheduleID = document.getElementById('scheduleID').value;
        const totalMarks = document.getElementById('totalMarks').value;
        const grade = document.getElementById('grade').value;
        const resultStatus = document.getElementById('resultStatus').value;
        const errorMessage = document.getElementById('errorMessage');

        // Clear any previous error message
        errorMessage.textContent = '';

        // Validation checks
        if (scheduleID <= 0) {
            errorMessage.textContent = 'Schedule ID must be a positive number.';
            return;
        }

        if (totalMarks < 0 || totalMarks > 100) {
            errorMessage.textContent = 'Total Marks must be between 0 and 100.';
            return;
        }

        if (!grade.match(/^[A-F]$/)) {
            errorMessage.textContent = 'Grade must be a single letter between A and F.';
            return;
        }

        if (resultStatus === '') {
            errorMessage.textContent = 'Please select a valid result status.';
            return;
        }

        // If validation passes, submit the form 
        alert('Form submitted successfully!');
        document.getElementById('resultForm').submit();
    });
</script>

</body>
</html>
