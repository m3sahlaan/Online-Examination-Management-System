<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Examination</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            
        }

        .container {
            width: 80%;
            height: 200%;
            margin: 20px auto;
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
        }

        .left-section {
            flex-grow: 1;
        }

        .right-section {
            width: 25%;
            margin-left: 20px;
        }

        .test-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .timer-box {
            display: flex;
            align-items: center;
        }

        .mark-for-review {
            background-color: #dcdcdc;
            padding: 5px 10px;
            margin-right: 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .timer {
            background-color: #007bff;
            color: white;
            padding: 10px;
            border-radius: 5px;
            font-weight: bold;
        }

        .question-panel {
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .question {
            margin-bottom: 20px;
        }

        form label {
            display: block;
            margin-bottom: 10px;
        }

        .answer-status {
            margin-bottom: 20px;
        }

        .status-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }

        .status {
            display: inline-block;
            padding: 10px;
            text-align: center;
            border-radius: 50%;
            font-size: 16px;
            font-weight: bold;
        }

        .completed {
            background-color: #28a745;
            color: white;
        }

        .not-answered {
            background-color: #dc3545;
            color: white;
        }

        .marked-for-review {
            background-color: #ffc107;
            color: white;
        }

        .current {
            background-color: #17a2b8;
            color: white;
        }

        .navigation {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .nav-button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        #skip-btn {
            background-color: #6c757d;
            color: white;
        }

        #prev-btn {
            background-color: #007bff;
            color: white;
        }

        #next-btn {
            background-color: #28a745;
            color: white;
        }

        #finish-btn {
            background-color: #dc3545;
            color: white;
        }
        /* Add a new class to highlight the selected answer */
    .selected-answer {
        background-color: #28a745; /* Green for selected answers */
        color: white;
        }

    </style>
</head>

<body>
    <div class="container">
        <div class="left-section">
            <header class="test-header">
                <h2>Online Examination</h2>
                <div class="timer-box">
                    <span class="mark-for-review" id="mark-review-btn">Mark for Review</span>
                    <span class="timer" id="timer">01:28:10</span>
                </div>
            </header>

            <form action="SubmitAnswer" method="post" id="questionForm">
                <div class="question-panel" id="questions-container">
                    <%
                        String jdbcUrl = "jdbc:mysql://localhost:3306/online_examinations"; 
                        String jdbcUser = "root"; 
                        String jdbcPassword = "20030105";
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
                            
                            // Retrieve questions from the database
                            String sql = "SELECT * FROM questiondetails";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);
                            
                            int questionCounter = 0;
                            
                            // Loop through the result set to display each question
                            while (rs.next()) {
                                int questionID = rs.getInt("questionID");
                                String questionText = rs.getString("questionText");
                                int marks = rs.getInt("marks");
                                String questionType = rs.getString("questionType");

                                %>
                                <div class="question" id="question-<%= questionID %>">
                                    <p><strong>Question<%= questionID %>:</strong> <%= questionText %></p>
                                    <div class="options">
                                        <%
                                        if ("MCQ".equals(questionType)) {
                                            String optionQuery = "SELECT optionText, isCorrect FROM mcq_options WHERE questionID = " + questionID;
                                            Statement optionStmt = conn.createStatement();
                                            ResultSet optionRs = optionStmt.executeQuery(optionQuery);

                                            while (optionRs.next()) {
                                                String optionText = optionRs.getString("optionText");
                                                %>
                                                <input type="radio" name="question_<%= questionID %>" value="<%= optionText %>" onchange="saveAnswer(<%= questionID %>, this.value)"><%= optionText %><br>
                                                <%
                                            }
                                            optionRs.close();
                                            optionStmt.close();
                                        } else {
                                            %>
                                            <textarea name="subjective_<%= questionID %>" rows="4" cols="50" placeholder="Your answer here..." onchange="saveAnswer(<%= questionID %>, this.value)"></textarea>
                                            <%
                                        }
                                        %>
                                    </div>
                                </div>
                                <%
                                questionCounter++;
                            }
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                            e.printStackTrace();
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                            if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
                        }
                    %>
                </div>

                <div class="navigation">
                    <button type="button" id="prev-btn" class="nav-button">PREVIOUS</button>
                    <button type="button" id="skip-btn" class="nav-button">SKIP</button>
                    <button type="button" id="next-btn" class="nav-button">NEXT</button>
                    <button type="submit" id="finish-btn" class="nav-button">SUBMIT</button>
                </div>
            </form>
        </div>

        <div class="right-section">
            <div class="answer-status">
                <h3>Answer Status</h3>
                <div class="status-grid" id="status-grid">
                   
                </div>
            </div>
        </div>
    </div>

    <script>
        const questionsContainer = document.getElementById("questions-container");
        const statusGrid = document.getElementById("status-grid");
        let currentQuestionIndex = 0;
        let answers = {};

        // Initialize the status grid dynamically based on question count
        const questions = questionsContainer.getElementsByClassName('question');
        for (let i = 0; i < questions.length; i++) {
            const span = document.createElement('span');
            span.classList.add('status');
            span.innerText = i + 1;
            span.classList.add('not-answered');
            span.dataset.index = i; 

            span.addEventListener('click', () => {
                currentQuestionIndex = span.dataset.index;
                displayQuestion(currentQuestionIndex);
            });

            statusGrid.appendChild(span);
        }

        // Display the first question
        displayQuestion(currentQuestionIndex);

        // Navigation buttons
        document.getElementById("next-btn").addEventListener("click", () => {
            if (currentQuestionIndex < questions.length - 1) {
                currentQuestionIndex++;
                displayQuestion(currentQuestionIndex);
            }
        });

        document.getElementById("prev-btn").addEventListener("click", () => {
            if (currentQuestionIndex > 0) {
                currentQuestionIndex--;
                displayQuestion(currentQuestionIndex);
            }
        });

        document.getElementById("skip-btn").addEventListener("click", () => {
            currentQuestionIndex++;
            if (currentQuestionIndex >= questions.length) currentQuestionIndex = questions.length - 1;
            displayQuestion(currentQuestionIndex);
        });
        document.getElementById("finish-btn").addEventListener("click", (event) => {
            // Prevent the default form submission behavior
            event.preventDefault();

            // Show confirmation alert before submission
            if (confirm("Are you sure you want to submit the exam?")) {
                // Submit the form (you can adjust this logic if using AJAX)
                document.getElementById("questionForm").submit();

                // Display a success message upon submission
                alert("Exam Finished Successfully!");

              
            }
        });

        function displayQuestion(index) {
            // Hide all questions
            for (let i = 0; i < questions.length; i++) {
                questions[i].style.display = 'none';
            }

            // Show the current question
            questions[index].style.display = 'block';
            questions[index].scrollIntoView();
            updateStatus(index);
        }

        function updateStatus(index) {
            const statusSpan = statusGrid.children[index];
            if (answers[index] !== undefined) {
                statusSpan.className = 'status completed';
            } else {
                statusSpan.className = 'status not-answered';
            }
        }

        function saveAnswer(questionID, answer) {
            answers[questionID] = answer; // Store the answer in the answers object
            updateStatus(questionID); // Update status after saving the answer
        }
    </script>
</body>
</html>
