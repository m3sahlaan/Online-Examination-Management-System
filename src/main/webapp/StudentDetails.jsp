<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Detail Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f0f3f5, #e9ecef); 
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 28px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #34495e;
        }

        input[type="text"], input[type="date"], select {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 25px;
            box-sizing: border-box;
            transition: 0.3s ease-in-out;
        }

        input[type="text"]:focus, input[type="date"]:focus, select:focus {
            border-color: #5a9cd1;
            box-shadow: 0 0 8px rgba(90, 156, 209, 0.4);
        }

        .button {
            width: 100%;
            background: linear-gradient(135deg, #3a80c1, #6fb3e0); /* Blue gradient button */
            border: none;
            padding: 15px;
            border-radius: 25px;
            color: white;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s ease-in-out;
            box-shadow: 0 4px 10px rgba(90, 156, 209, 0.3);
        }

        .button:hover {
            background: linear-gradient(135deg, #6fb3e0, #3a80c1); /* Inverted blue gradient on hover */
            box-shadow: 0 6px 15px rgba(90, 156, 209, 0.6);
        }

        .error {
            color: #e74c3c;
            font-size: 14px;
            margin-bottom: 15px;
            text-align: center;
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
                margin: 10px;
            }

            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Student Registration Form</h2>
    <form action=StudentRegister method=POST>
        <div class="error" id="error"></div>

        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="fName" placeholder="Enter First Name" required>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lName" placeholder="Enter Last Name" required>

        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" required>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" placeholder="Enter Address" required>

        <label for="year">Year:</label>
        <input type="text" id="year" name="year" placeholder="Enter Year" required>

        <label for="course">Course:</label>
        <input type="text" id="course" name="course" placeholder="Enter Course" required>
        
        <label for="pass">NIC:</label>
        <input type="text" id="pass" name="pass" placeholder="Enter your nic" required>

        <input type="submit" name="Register" value="Register" class="button">
    </form>
</div>

<script>
    document.getElementById('studentForm').addEventListener('submit', function(event) {
        event.preventDefault();

        const errorDiv = document.getElementById('error');
        errorDiv.textContent = '';

        const firstName = document.getElementById('firstName').value;
        const lastName = document.getElementById('lastName').value;
        const dob = document.getElementById('dob').value;
        const address = document.getElementById('address').value;
        const year = document.getElementById('year').value;
        const course = document.getElementById('course').value;

        // Simple validation
        if (!firstName || !lastName || !dob || !address || !year || !course) {
            errorDiv.textContent = 'Please fill in all the fields.';
            return;
        }

        // Log the values for debugging purposes
        console.log('First Name:', firstName);
        console.log('Last Name:', lastName);
        console.log('DOB:', dob);
        console.log('Address:', address);
        console.log('Year:', year);
        console.log('Course:', course);

        alert('Form submitted successfully!');

        // You can add code here to send the form data to the backend (e.g., using fetch or XMLHttpRequest).
    });
</script>

</body>
</html>
