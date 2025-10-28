<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Management System</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary: #1E2A78;       /* Deep navy */
            --accent: #00B8A9;        /* Teal accent */
            --text-light: #f8f9fa;
            --text-muted: #cfd3dc;
        }

        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            margin: 0;
            background-color: var(--primary);
            color: var(--text-light);
            overflow-x: hidden;
        }

        /* Navbar */
        .navbar {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(15px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .navbar-brand {
            font-weight: 600;
            color: var(--accent) !important;
            letter-spacing: 0.5px;
            font-size: 1.3rem;
        }

        .nav-link {
            color: var(--text-light) !important;
            font-weight: 500;
            margin-left: 10px;
            transition: all 0.3s ease;
        }

        .nav-link:hover, .nav-link.active {
            color: var(--accent) !important;
        }

        /* Hero Section */
        .hero {
            position: relative;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #fff;
            overflow: hidden;
        }

        /* Background image with overlay */
        .hero::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('https://images.unsplash.com/photo-1521737604893-d14cc237f11d?auto=format&fit=crop&w=1600&q=80');
            background-size: cover;
            background-position: center;
            filter: brightness(0.35) blur(0px);
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            background: rgba(255, 255, 255, 0.08);
            padding: 60px 50px;
            border-radius: 20px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.4);
            animation: fadeIn 1.2s ease;
            max-width: 700px;
            width: 90%;
        }

        .hero h1 {
            font-weight: 600;
            margin-bottom: 20px;
            font-size: 2.6rem;
            color: #ffffff;
        }

        .hero p {
            font-size: 1.1rem;
            color: var(--text-muted);
            margin-bottom: 35px;
        }

        /* Optional illustration image inside hero */
        .hero img {
            width: 120px;
            margin-bottom: 20px;
        }

        .btn-custom {
            padding: 12px 35px;
            font-size: 1rem;
            font-weight: 500;
            border-radius: 30px;
            transition: all 0.3s ease;
            margin: 8px;
            text-transform: uppercase;
        }

        .btn-login {
            background: var(--accent);
            color: #fff;
            border: 2px solid var(--accent);
        }

        .btn-login:hover {
            background: transparent;
            color: var(--accent);
            border-color: var(--accent);
        }

        .btn-register {
            background: transparent;
            border: 2px solid #fff;
            color: #fff;
        }

        .btn-register:hover {
            background: #fff;
            color: var(--primary);
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 15px;
            background: rgba(255, 255, 255, 0.08);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.8);
            font-size: 0.9rem;
            letter-spacing: 0.5px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">Employee Management</a>
            <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a href="index.jsp" class="nav-link active">Home</a></li>
                    <li class="nav-item"><a href="login.jsp" class="nav-link">Login</a></li>
                    <li class="nav-item"><a href="register.jsp" class="nav-link">Register</a></li>
                    <li class="nav-item"><a href="about.jsp" class="nav-link">About</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section with image -->
    <section class="hero">
        <div class="hero-content">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Employee Icon">
            <h1>Welcome to the Employee Management System</h1>
            <p>Manage employee data, attendance, and performance effortlessly in one secure, unified platform.</p>

            <div>
                <a href="login.jsp" class="btn btn-custom btn-login">Login</a>
                <a href="register.jsp" class="btn btn-custom btn-register">Register</a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        &copy; 2025 Employee Management System | Designed by <strong>Ankit Samal</strong>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
