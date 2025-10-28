<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login | Employee Management System</title>

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
        }

        .login-container {
            background: rgba(255, 255, 255, 0.1);
            padding: 40px 45px;
            border-radius: 16px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.35);
            width: 100%;
            max-width: 420px;
            text-align: center;
            animation: fadeIn 1s ease;
        }

        .login-container h2 {
            margin-bottom: 25px;
            font-weight: 600;
            color: #fff;
        }

        .form-control {
            border-radius: 30px;
            padding: 12px 18px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            background: rgba(255, 255, 255, 0.05);
            color: #fff;
        }

        .form-control:focus {
            border-color: var(--accent);
            box-shadow: 0 0 5px var(--accent);
            background: rgba(255, 255, 255, 0.1);
        }

        .btn-login {
            width: 100%;
            background: var(--accent);
            border: none;
            color: #fff;
            padding: 12px 0;
            font-weight: 500;
            border-radius: 30px;
            transition: all 0.3s ease;
            margin-top: 15px;
        }

        .btn-login:hover {
            background: transparent;
            border: 2px solid var(--accent);
            color: var(--accent);
        }

        .register-link {
            margin-top: 20px;
            display: block;
            font-size: 0.9rem;
            color: var(--text-muted);
        }

        .register-link a {
            color: var(--accent);
            text-decoration: none;
            font-weight: 500;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2>Employee Login</h2>
        <form action="LoginServlet" method="post">
            <div class="mb-3">
                <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
            </div>
            <button type="submit" class="btn-login">Login</button>
        </form>
        <div class="register-link">
            New user? <a href="register.jsp">Register here</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
