<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Redirect user to login if not logged in
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    model.User user = (model.User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard | Employee Management System</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary: #1E2A78;
            --accent: #00B8A9;
            --background: #0F1736;
            --text-light: #f8f9fa;
            --muted: #adb5bd;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, var(--primary), var(--background));
            color: var(--text-light);
            min-height: 100vh;
        }

        /* Navbar */
        .navbar {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .navbar-brand {
            color: var(--accent) !important;
            font-weight: 600;
            font-size: 1.3rem;
        }

        .nav-link {
            color: var(--text-light) !important;
            margin-left: 10px;
            font-weight: 500;
        }

        .nav-link:hover {
            color: var(--accent) !important;
        }

        /* Welcome Section */
        .welcome-section {
            text-align: center;
            margin-top: 100px;
            animation: fadeIn 1.2s ease;
        }

        .welcome-section img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }

        .welcome-section h2 {
            font-weight: 600;
            font-size: 2rem;
        }

        .welcome-section p {
            color: var(--muted);
            margin-bottom: 50px;
        }

        /* Cards */
        .card-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 25px;
            margin-bottom: 80px;
        }

        .feature-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            width: 270px;
            padding: 30px 25px;
            text-align: center;
            transition: all 0.3s ease;
            color: var(--text-light);
        }

        .feature-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
            border-color: var(--accent);
        }

        .feature-card img {
            width: 80px;
            height: 80px;
            margin-bottom: 15px;
            border-radius: 50%;
            background: rgba(255,255,255,0.15);
            padding: 10px;
        }

        .feature-card h5 {
            margin-top: 10px;
            font-weight: 600;
            font-size: 1.1rem;
        }

        .feature-card p {
            font-size: 0.95rem;
            color: var(--muted);
        }

        .feature-card a {
            display: inline-block;
            margin-top: 12px;
            color: var(--accent);
            text-decoration: none;
            font-weight: 500;
        }

        .feature-card a:hover {
            text-decoration: underline;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 20px;
            background: rgba(255, 255, 255, 0.08);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.9rem;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">Employee Dashboard</a>
            <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a href="dashboard.jsp" class="nav-link active">Home</a></li>
                    <li class="nav-item"><a href="view_employees.jsp" class="nav-link">Employees</a></li>
                    <li class="nav-item"><a href="add_employee.jsp" class="nav-link">Add Employee</a></li>
                    <li class="nav-item"><a href="LogoutServlet" class="nav-link text-danger">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Welcome Section -->
    <div class="container welcome-section">
        <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="User Avatar">
        <h2>Welcome, <%= user.getName() %> 👋</h2>
        <p>Manage your workforce, track performance, and streamline employee operations.</p>
    </div>

    <!-- Feature Cards -->
    <div class="container card-container">

        <div class="feature-card">
            <img src="https://cdn-icons-png.flaticon.com/512/3570/3570333.png" alt="View Employees">
            <h5>View Employees</h5>
            <p>See all registered employees with details and status.</p>
            <a href="view_employees.jsp">Go to List →</a>
        </div>

        <div class="feature-card">
            <img src="https://cdn-icons-png.flaticon.com/512/1828/1828817.png" alt="Add Employee">
            <h5>Add Employee</h5>
            <p>Register a new employee to the organization’s database.</p>
            <a href="add_employee.jsp">Add Now →</a>
        </div>

        <div class="feature-card">
            <img src="https://cdn-icons-png.flaticon.com/512/1828/1828490.png" alt="Logout">
            <h5>Logout</h5>
            <p>Securely log out of your session.</p>
            <a href="LogoutServlet">Logout →</a>
        </div>

    </div>

    <!-- Footer -->
    <footer>
        &copy; 2025 Employee Management System | Designed by <strong>Ankit Samal</strong>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
