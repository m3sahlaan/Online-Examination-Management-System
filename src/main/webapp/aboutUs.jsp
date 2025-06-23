<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us - TestPro</title>
  <style>
    /* Reset */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
    }

    body {
      background-color: #f0f0f5;
      color: #333;
    }

    /* Wrapper */
    .about-wrapper {
      max-width: 85%;
      margin: 50px auto;
      padding: 20px;
      text-align: center;
    }

    /* About Us Section */
    .about-us {
      padding: 50px;
      background: linear-gradient(to right, #8a2be2, #6a5acd);
      color: white;
      border-radius: 15px;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
      position: relative;
      overflow: hidden;
    }

    .about-us::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(255, 255, 255, 0.1);
      z-index: 1;
      pointer-events: none;
      transform: skewY(-6deg);
      transform-origin: top left;
    }

    .about-us h1 {
      font-size: 3rem;
      margin-bottom: 30px;
      color: #fff;
      z-index: 2;
      position: relative;
    }

    .about-us p {
      font-size: 1.3rem;
      line-height: 1.8;
      z-index: 2;
      position: relative;
    }

    /* Hover Effect for Learn More Button */
    .learn-more {
      display: inline-block;
      margin-top: 40px;
      padding: 12px 30px;
      background-color: white;
      color: #6a5acd;
      font-size: 1.2rem;
      border-radius: 50px;
      text-decoration: none;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
      transition: all 0.4s ease;
      z-index: 2;
      position: relative;
    }

    .learn-more:hover {
      background-color: #f0f0f5;
      color: #8a2be2;
      transform: translateY(-5px);
    }

    /* Toggle Content */
    .more-info {
      margin-top: 40px;
      display: none;
      color: #333;
      text-align: left;
      background-color: white;
      border-radius: 15px;
      padding: 30px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
      animation: fadeIn 0.5s ease;
    }

    .more-info p {
      font-size: 1.2rem;
      line-height: 1.6;
    }

    .more-info h2 {
      color: #4b0082;
      font-size: 2rem;
      margin-bottom: 15px;
    }

    /* Animations */
    @keyframes fadeIn {
      0% {
        opacity: 0;
        transform: translateY(20px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* Responsive */
    @media (max-width: 768px) {
      .about-us {
        padding: 30px;
      }

      .about-us h1 {
        font-size: 2.5rem;
      }

      .about-us p {
        font-size: 1.1rem;
      }

      .learn-more {
        font-size: 1rem;
        padding: 10px 25px;
      }
    }

  </style>
</head>
<body>

  <div class="about-wrapper">
    <div class="about-us">
      <h1>About TestPro</h1>
      <p>
        TestPro is an advanced online examination management system designed to simplify the examination process for both students and lecturers.
        Our platform allows students to take their exams online, lecturers to effortlessly upload question papers, and admins to efficiently manage exam results.
      </p>

      <p>
        With TestPro, we aim to provide a seamless, secure, and user-friendly interface that ensures smooth exam conduction from start to finish.
        Our goal is to streamline the online exam process and make education more accessible to everyone.
      </p>

      <a href="javascript:void(0)" class="learn-more" onclick="toggleMoreInfo()">Learn More</a>
      
      <div class="more-info">
        <div class="section">
          <h2>Our Mission</h2>
          <p>
            At TestPro, our mission is to empower educational institutions by providing a reliable and efficient online exam management system. We strive to enhance the learning experience by ensuring exams are conducted smoothly, with real-time monitoring and robust result management features.
          </p>
        </div>

        <div class="section">
          <h2>Our Vision</h2>
          <p>
            Our vision is to become the leading online exam management platform, trusted by educational institutions worldwide. We aim to shape the future of education by providing innovative solutions that transform how exams are conducted, making education more inclusive and technology-driven.
          </p>
        </div>

        <div class="section">
          <h2>Why Choose TestPro?</h2>
          <p>
            - **User-Friendly Interface**: <br>Designed for ease of use, TestPro ensures that both students and lecturers can navigate the platform effortlessly.
            <br>
            - **Secure and Reliable**:<br> We prioritize security and integrity, ensuring that exams are conducted in a controlled environment with no compromises.
            <br>
            - **Comprehensive Exam Tools**:<br> Lecturers can create various types of question papers, while students can access exams anytime, anywhere.
            <br>
            - **Efficient Result Management**:<br> Admins can quickly generate and publish results, providing detailed insights and feedback to students.
          </p>
        </div>
      </div>
    </div>
  </div>

  <script>
    // JavaScript to toggle the visibility of additional content
    function toggleMoreInfo() {
      const moreInfo = document.querySelector('.more-info');
      if (moreInfo.style.display === 'block') {
        moreInfo.style.display = 'none';
      } else {
        moreInfo.style.display = 'block';
      }
    }
  </script>

</body>
</html>
