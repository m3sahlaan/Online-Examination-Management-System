<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terms and Conditions</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e9f3ff; /* Light blue background */
            font-family: 'Arial', sans-serif;
            color: #2c3e50; /* Dark blue text */
        }
        main {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }
        .terms-container {
            max-width: 800px;
            background: rgba(255, 255, 255, 0.95); /* Semi-transparent white background */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s, box-shadow 0.2s;
            width: 80%;
        }
        .terms-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }
        h1, h2 {
            color: #2980b9; /* Bright blue */
            font-weight: 700;
            background-color: #d5e9f7; /* Soft blue background */
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            font-weight: bold; /* Make headings bold */
        }
        p, li {
            font-size: 1rem;
            font-weight: bold; /* Make text bold */
        }
        ul {
            margin-top: 15px;
            padding-left: 20px;
        }
        hr {
            border: 1px solid #2980b9; /* Blue line */
            margin: 20px 0;
        }
        footer {
            text-align: center;
            margin-top: 30px;
            font-size: 0.9rem;
            color: #6c757d; /* Grey text */
            font-weight: bold; /* Make footer text bold */
        }
        .accordion-button:not(.collapsed) {
            background-color: #2980b9; /* Bright blue */
            color: white;
            font-weight: bold; /* Make button text bold */
        }
        .accordion-button {
            background-color: #3498db; /* Medium blue */
            color: white;
            font-weight: bold; /* Make button text bold */
        }
        .accordion-button:hover {
            background-color: #2980b9; /* Bright blue on hover */
        }
        .table-container {
            margin-top: 20px;
        }
        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
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
<body>
<header>
        <div class="logo">
            <img src="testpro.png" alt="Logo">
            <h2>Online Examination System</h2>
        </div>
        <nav>
            <ul>
                <li><a href="Index.jsp" id="home">Home</a></li>
                <li><a href="faq.jsp" id="faq-view">FAQ</a></li>
                <li><a href="contactUs.jsp" id="contact-us-view">Contact</a></li>
                <li><a href="TermAndConditions.jsp" id="term&conditions">Terms & Conditions</a></li>
            </ul>
        </nav>
        <div class="search-bar">
            <input type="text" placeholder="Search Exam">
            <button>Search</button>
        </div>
    </header>

<main>
    <article class="terms-container">
        <header class="mb-4">
            <h1 class="text-center">Terms and Conditions</h1>
        </header>

        <hr>

        <div class="accordion" id="termsAccordion">
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        1. Introduction
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#termsAccordion">
                    <div class="accordion-body">
                        <p>These terms govern your use of the TestPro online examination management system, including exam participation, question paper management, result generation, and related activities. By using our platform, you acknowledge that you have read, understood, and agree to these terms.</p>
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        2. Exam Participation
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#termsAccordion">
                    <div class="accordion-body">
                        <ul>
                            <li><strong>Eligibility:</strong> To participate in exams, students must be registered users of the TestPro system.</li>
                            <li><strong>Exam Integrity:</strong> Students must adhere to academic integrity policies during online examinations.</li>
                            <li><strong>Technical Requirements:</strong> Ensure a stable internet connection and compatible device for the best experience.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        3. Question Paper Management
                    </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#termsAccordion">
                    <div class="accordion-body">
                        <ul>
                            <li><strong>Creation:</strong> Lecturers can create and manage question papers through their accounts.</li>
                            <li><strong>Approval:</strong> All question papers are subject to review and approval by the administration.</li>
                            <li><strong>Updates:</strong> Lecturers must update question papers as needed to ensure content accuracy.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="headingFour">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                        4. Results Generation
                    </button>
                </h2>
                <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#termsAccordion">
                    <div class="accordion-body">
                        <ul>
                            <li><strong>Result Processing:</strong> Results are generated automatically after exam completion.</li>
                            <li><strong>Access:</strong> Students can view their results through their accounts on the TestPro system.</li>
                            <li><strong>Feedback:</strong> Students are encouraged to provide feedback on their exam experience.</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="accordion-item">
                <h2 class="accordion-header" id="headingFive">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                        5. Privacy and Data Usage
                    </button>
                </h2>
                <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#termsAccordion">
                    <div class="accordion-body">
                        <p>We are committed to protecting your personal data. Any information you provide during registration will be used solely for system management purposes and in accordance with our Privacy Policy.</p>
                    </div>
                </div>
            </div>
        </div>

        <hr>
    </article>
</main>

<footer>
        
        <div class="footer-bottom">
            <p>&copy; 2024 TestPro. All rights reserved.</p>
        </div>
    </footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
	
	
    document.getElementById("about-us-btn").addEventListener("click", function() {
        window.location.href = "aboutUs.jsp";
    });
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

</body>
</html>
