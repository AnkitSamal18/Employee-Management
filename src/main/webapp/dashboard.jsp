<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap"
	rel="stylesheet">

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
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
}

.welcome-section h2 {
	font-weight: 600;
	font-size: 2rem;
}

.welcome-section p {
	color: var(--muted);
	margin-bottom: 50px;
}

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
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
	border-color: var(--accent);
}

.feature-card img {
	width: 80px;
	height: 80px;
	margin-bottom: 15px;
	border-radius: 50%;
	background: rgba(255, 255, 255, 0.15);
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

footer {
	text-align: center;
	padding: 20px;
	background: rgba(255, 255, 255, 0.08);
	border-top: 1px solid rgba(255, 255, 255, 0.1);
	color: rgba(255, 255, 255, 0.7);
	font-size: 0.9rem;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}
}
</style>
</head>

<body>
	<nav class="navbar navbar-expand-lg fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#">Employee Dashboard</a>
			<button class="navbar-toggler bg-light" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a href="dashboard.jsp"
						class="nav-link active">Home</a></li>
					<li class="nav-item"><a href="view_employees.jsp"
						class="nav-link">Employees</a></li>
					<li class="nav-item"><a href="add_employee.jsp"
						class="nav-link">Add Employee</a></li>
					<li class="nav-item"><a href="attendance.jsp" class="nav-link">Attendance</a></li>
					<li class="nav-item"><a href="salary.jsp" class="nav-link">Salary</a></li>
					<li class="nav-item"><a href="LogoutServlet"
						class="nav-link text-danger">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container welcome-section">
		<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
			alt="User Avatar">
		<h2>
			Welcome,
			<%= user.getName() %>
			👋
		</h2>
		<p>Manage your workforce, attendance, and payroll efficiently.</p>
	</div>

	<div class="container card-container">

		<div class="feature-card">
			<img src="https://img.freepik.com/premium-vector/employee-work-working-icon-blue-color-design_996135-39153.jpg"
				alt="View Employees">
			<h5>View Employees</h5>
			<p>See all registered employees with details and status.</p>
			<a href="view_employees.jsp">Go to List →</a>
		</div>

		<div class="feature-card">
			<img src="https://cdn-icons-png.flaticon.com/512/1828/1828817.png"
				alt="Add Employee">
			<h5>Add Employee</h5>
			<p>Register a new employee in the system.</p>
			<a href="add_employee.jsp">Add Now →</a>
		</div>

		<div class="feature-card">
			<img
				src="data:image/png;base64,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"
				alt="Attendance">
			<h5>Attendance & Time Tracking</h5>
			<p>Record and monitor employee attendance and working hours.</p>
			<a href="attendance.jsp">Track Now →</a>
		</div>

		<div class="feature-card">
			<img src="data:image/png;base64,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"
				alt="Salary">
			<h5>Salary Management</h5>
			<p>View, update, and calculate monthly payroll efficiently.</p>
			<a href="salary.jsp">Manage Salaries →</a>
		</div>
	</div>

	<footer>
		&copy; 2025 Employee Management System | Designed by <strong>Ankit
			Samal</strong>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
