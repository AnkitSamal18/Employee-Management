<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<style>
    body {
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #0078d7, #00a2ff);
        color: #fff;
    }

    .container {
        width: 100%;
        max-width: 600px;
        background: #ffffff;
        color: #333;
        margin: 60px auto;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);
    }

    h1 {
        text-align: center;
        color: #0078d7;
        margin-bottom: 20px;
    }

    label {
        display: block;
        font-weight: 600;
        margin-top: 15px;
    }

    input[type=text],
    input[type=email],
    textarea {
        width: 100%;
        padding: 10px;
        margin-top: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 15px;
        box-sizing: border-box;
    }

    input[type=text]:focus,
    input[type=email]:focus,
    textarea:focus {
        outline: none;
        border-color: #0078d7;
        box-shadow: 0 0 5px rgba(0, 120, 215, 0.5);
    }

    textarea {
        resize: vertical;
        height: 120px;
    }

    input[type=submit] {
        width: 100%;
        background-color: #0078d7;
        color: white;
        border: none;
        padding: 12px 20px;
        margin-top: 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: background 0.3s ease;
    }

    input[type=submit]:hover {
        background-color: #005fa3;
    }

    .footer {
        text-align: center;
        margin-top: 30px;
        color: #fff;
        font-size: 14px;
    }
</style>
</head>
<body>

    <div class="container">
        <h1>Contact Us</h1>
        <form action="ContactServlet" method="post">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="subject">Subject</label>
            <input type="text" id="subject" name="subject" placeholder="Enter subject" required>

            <label for="message">Message</label>
            <textarea id="message" name="message" placeholder="Write your message..." required></textarea>

            <input type="submit" value="Send Message">
        </form>
    </div>

    <div class="footer">
        &copy; 2025 Employee Management System | All Rights Reserved
    </div>

</body>
</html>
