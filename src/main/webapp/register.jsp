<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register | Employee Management System</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary: #1E2A78;
            --accent: #00B8A9;
            --text-light: #f8f9fa;
            --muted: #adb5bd;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, var(--primary), #0F1736);
            color: var(--text-light);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .register-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.4);
            padding: 40px 50px;
            max-width: 420px;
            width: 100%;
            animation: fadeIn 1s ease;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #fff;
            font-weight: 600;
        }

        .form-control {
            background: rgba(255, 255, 255, 0.15);
            border: none;
            color: #fff;
            border-radius: 10px;
            padding: 12px;
        }

        .form-control:focus {
            box-shadow: 0 0 0 2px var(--accent);
            background: rgba(255, 255, 255, 0.2);
        }

        .btn-primary {
            background-color: var(--accent);
            border: none;
            border-radius: 10px;
            padding: 12px;
            width: 100%;
            font-weight: 500;
            text-transform: uppercase;
        }

        .btn-primary:hover {
            background: transparent;
            color: var(--accent);
            border: 2px solid var(--accent);
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
        }

        .login-link a {
            color: var(--accent);
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <div class="register-container">
        <h2>User Registration</h2>
        <form action="RegisterServlet" method="post">
            <div class="mb-3">
                <label>Name</label>
                <input type="text" name="name" class="form-control" placeholder="Enter full name" required>
            </div>

            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
            </div>

            <div class="mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter password" required>
            </div>

            <button type="submit" class="btn btn-primary">Register</button>

            <div class="login-link">
                <p>Already have an account? <a href="login.jsp">Login here</a></p>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
