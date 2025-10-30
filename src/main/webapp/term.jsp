<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Terms & Conditions | Employee Management System</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary: #1E2A78;
            --accent: #00B8A9;
            --background: linear-gradient(135deg, #1E2A78, #0F1736);
            --text-light: #f8f9fa;
            --text-muted: #b8bbc3;
        }

        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background: var(--background);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: var(--text-light);
            padding: 20px;
        }

        .terms-container {
            background: rgba(255, 255, 255, 0.08);
            padding: 40px 45px;
            border-radius: 16px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
            max-width: 800px;
            width: 100%;
            animation: fadeIn 1s ease;
        }

        .terms-container h2 {
            color: #fff;
            text-align: center;
            font-weight: 600;
            margin-bottom: 25px;
        }

        h4 {
            color: var(--accent);
            margin-top: 25px;
            font-weight: 500;
        }

        p, li {
            color: var(--text-light);
            font-size: 0.95rem;
            line-height: 1.6;
        }

        ul {
            margin-top: 10px;
            padding-left: 20px;
        }

        a {
            color: var(--accent);
            text-decoration: none;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        .btn-back {
            background: var(--accent);
            color: #fff;
            border: none;
            padding: 10px 25px;
            border-radius: 25px;
            margin-top: 25px;
            display: inline-block;
            transition: all 0.3s ease;
        }

        .btn-back:hover {
            background: transparent;
            border: 2px solid var(--accent);
            color: var(--accent);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <div class="terms-container">
        <h2>Terms & Conditions</h2>
        <p>Welcome to the <strong>Employee Management System (EMS)</strong>. By accessing or using this system, you agree to comply with the following terms and conditions.</p>

        <h4>1. Acceptance of Terms</h4>
        <p>By using this system, you acknowledge that you have read and accepted all terms. If you do not agree, you are not permitted to use the EMS platform.</p>

        <h4>2. Authorized Use</h4>
        <ul>
            <li>Only authorized users with valid credentials can access the EMS.</li>
            <li>Users must use the system solely for managing employee data and HR operations.</li>
            <li>Any unauthorized access or misuse will result in disciplinary or legal action.</li>
        </ul>

        <h4>3. Data Privacy</h4>
        <p>All employee data is confidential. The EMS ensures data protection; however, users are responsible for maintaining the confidentiality of their login credentials.</p>

        <h4>4. System Responsibilities</h4>
        <ul>
            <li>Administrators are responsible for keeping records accurate and up-to-date.</li>
            <li>Employees must ensure their personal information is correct and current.</li>
        </ul>

        <h4>5. Modification of Terms</h4>
        <p>The EMS team reserves the right to modify these terms without prior notice. Continued use of the system constitutes acceptance of any changes.</p>

        <h4>6. Limitation of Liability</h4>
        <p>The EMS is not responsible for data loss caused by technical issues, unauthorized access, or misuse of the platform.</p>

        <p class="mt-4"><strong>By continuing to use the Employee Management System, you agree to these Terms and Conditions.</strong></p>

        <div class="text-center">
            <a href="login.jsp" class="btn-back">← Back to Login</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
