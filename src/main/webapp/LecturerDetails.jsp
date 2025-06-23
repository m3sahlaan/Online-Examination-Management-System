<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lecture Detail Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
            max-width: 500px;
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

        input[type="text"], input[type="number"], input[type="password"] {
            width: 100%;
            padding: 12px 15px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 25px;
            box-sizing: border-box;
            transition: 0.3s ease-in-out;
        }

        input[type="text"]:focus, input[type="number"]:focus, input[type="password"]:focus {
            border-color: #3a8dd5;
            box-shadow: 0 0 8px rgba(58, 141, 213, 0.4);
        }

        .button {
            width: 100%;
            background: linear-gradient(135deg, #1d6fa5, #3a8dd5); 
            border: none;
            padding: 15px;
            border-radius: 25px;
            color: white;
            font-size: 18px;
            cursor: pointer;
            transition: 0.3s ease-in-out;
            box-shadow: 0 4px 10px rgba(58, 141, 213, 0.3);
        }

        .button:hover {
            background: linear-gradient(135deg, #3a8dd5, #1d6fa5); /* Inverted blue gradient on hover */
            box-shadow: 0 6px 15px rgba(58, 141, 213, 0.6);
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
    <h2>Lecture Register Form</h2>
    <form action=AddLecture method=POST>
        
        <label for="lectureID">Lecture ID:</label>
        <input type="number" id="lectureID" name="lecID" placeholder="Enter Lecture ID" required>
        
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="fName" placeholder="Enter First Name" required>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lName" placeholder="Enter Last Name" required>

        <label for="specialization">Specialization:</label>
        <input type="text" id="specialization" name="special" placeholder="Enter Specialization" required>

        <label for="department">Department:</label>
        <input type="text" id="department" name="dept" placeholder="Enter Department" required>
        
        <label for="pass">Password:</label>
        <input type="password" id="pass" name="pass" placeholder="Enter First Name" required>

        <input type=submit name=submit value=Submit class=button>
    </form>
</div>

<script>
    document.getElementById('lectureForm').addEventListener('submit', function(event) {
        event.preventDefault();

        // Error div
        const errorDiv = document.getElementById('error');
        errorDiv.textContent = '';

        // Get form values
        const lectureID = document.getElementById('lectureID').value;
        const firstName = document.getElementById('firstName').value;
        const fastName = document.getElementById('fastName').value;
        const specialization = document.getElementById('specialization').value;
        const department = document.getElementById('department').value;

        // Simple validation
        if (!lectureID || !firstName || !fastName || !specialization || !department) {
            errorDiv.textContent = 'Please fill in all the fields.';
            return;
        }

        // If validation passes
        console.log('Lecture ID:', lectureID);
        console.log('First Name:', firstName);
        console.log('Fast Name:', fastName);
        console.log('Specialization:', specialization);
        console.log('Department:', department);

        alert('Form submitted successfully!');
    });
</script>

</body>
</html>
