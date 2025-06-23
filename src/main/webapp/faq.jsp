<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <style>
      * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: "Roboto", sans-serif;
      }
  
      .wrapper {
        max-width: 60%;
        margin: 5% auto;
        padding: 2%;
        background-color: #f8f6fa;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }
  
      .wrapper > p,
      .wrapper > h1 {
        margin: 5%;
        text-align: center;
        margin-bottom: 2%;
      }
  
      .wrapper > h1 {
        letter-spacing: 3px;
        font-size: 2.5rem;
        color: #5a3f78;
      }
  
      .accordion {
        background-color: white;
        color: rgba(0, 0, 0, 0.8);
        cursor: pointer;
        font-size: 1.4rem;
        width: 100%;
        padding: 1.5rem 2.5rem;
        margin-bottom: 10px;
        border-radius: 10px;
        outline: none;
        transition: background-color 0.3s ease, box-shadow 0.3s ease;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-weight: bold;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      }
  
      .accordion i {
        font-size: 1.6rem;
      }
  
      .accordion:hover {
        background-color: #e0d1ea;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
      }
  
      .pannel {
        padding: 1.5%;
        background-color: #f2e6f3;
        display: none;
        overflow: hidden;
        border-radius: 10px;
        transition: max-height 0.3s ease;
      }
  
      .pannel p {
        color: rgba(0, 0, 0, 0.7);
        font-size: 1.2rem;
        line-height: 1.6;
      }
  
      .faq {
        margin: 2% 0;
      }
  
      .faq.active .pannel {
        display: block;
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
  
  <div class="wrapper">
    <h1>Frequently Asked Questions</h1><br>
  
    <div class="faq">
      <button class="accordion">
        What is TestPro?
        <i style="font-size:24px" class="fa">&#11163;</i>
      </button>
      <div class="pannel">
        <p>
            TestPro is an online system where students can take exams, lecturers can upload question papers, and admins manage results. It's designed to streamline the online examination process for educational institutions.
        </p>
      </div>
    </div>
  
    <div class="faq">
      <button class="accordion">
        How do students take an exam?
        <i style="font-size:24px" class="fa">&#11163;</i>
      </button>
      <div class="pannel">
        <p>
            Students can log in, navigate to the "Exams" section, and start their assigned exams. The exam must be completed within the specified time limit.
        </p>
      </div>
    </div>
  
    <div class="faq">
      <button class="accordion">
        How do lecturers upload question papers?
        <i style="font-size:24px" class="fa">&#11163;</i>
      </button>
      <div class="pannel">
        <p>
            Lecturers can upload or create question papers in TestPro by logging in, accessing the "Add Question Paper" section, and following the instructions to add questions or upload files.
        </p>
      </div>
    </div>
  
    <div class="faq">
      <button class="accordion">
        How are results generated?
        <i style="font-size:24px" class="fa">&#11163;</i>
      </button>
      <div class="pannel">
        <p>
            After an exam, admins generate results through the system. Objective questions are graded automatically, while subjective answers require manual grading by the lecturer.
        </p>
      </div>
    </div>
  
    <div class="faq">
      <button class="accordion">
        Can students view their results?
        <i style="font-size:24px" class="fa">&#11163;</i>
      </button>
      <div class="pannel">
        <p>
            Yes, once the results are published by the admin, students can log in and view their scores in the "Results" section of their dashboard.
        </p>
      </div>
    </div>
  
    <div class="faq">
      <button class="accordion">
        What should I do if I face technical issues during an exam?
        <i style="font-size:24px" class="fa">&#11163;</i>
      </button>
      <div class="pannel">
        <p>
            TestPro saves your progress automatically. If an issue arises, you can resume the exam once the issue is resolved. Contact your lecturer or admin for further assistance.
        </p>
      </div>
    </div>
  </div>
  <footer>
        
        <div class="footer-bottom">
            <p>&copy; 2024 TestPro. All rights reserved.</p>
        </div>
    </footer>
  
  <script>
    var acc = document.getElementsByClassName("accordion");
    var i;
  
    for (i = 0; i < acc.length; i++) {
      acc[i].addEventListener("click", function () {
        this.classList.toggle("active");
        this.parentElement.classList.toggle("active");
  
        var pannel = this.nextElementSibling;
  
        if (pannel.style.display === "block") {
          pannel.style.display = "none";
        } else {
          pannel.style.display = "block";
        }
      });
    }
    
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
  