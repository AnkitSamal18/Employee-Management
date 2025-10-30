<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>

<style>
    body {
        background: url('https://images.unsplash.com/photo-1581091215360-9f9a22b1d5a0?auto=format&fit=crop&w=1950&q=80') no-repeat center center fixed;
        background-size: cover;
        min-height: 100vh;
        font-family: 'Poppins', sans-serif;
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
    

    .overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(30, 42, 120, 0.75); /* semi-transparent overlay */
        z-index: 0;
    }

    .form-container {
        position: relative;
        z-index: 1;
        max-width: 600px;
        margin: 100px auto;
        background: rgba(255,255,255,0.1);
        backdrop-filter: blur(15px);
        padding: 40px 35px;
        border-radius: 20px;
        box-shadow: 0 10px 35px rgba(0,0,0,0.4);
        color: #fff;
        animation: fadeIn 1s ease;
    }

    .form-container h2 {
        text-align: center;
        margin-bottom: 30px;
        font-weight: 700;
        font-size: 2rem;
        color: #00B8A9;
    }

    .form-group {
        margin-bottom: 20px;
    }

    .form-group label {
        display: block;
        margin-bottom: 6px;
        font-weight: 500;
    }

    .form-group input {
        width: 100%;
        padding: 14px 15px;
        border-radius: 12px;
        border: none;
        outline: none;
        font-size: 1rem;
        background: rgba(255,255,255,0.15);
        color: #fff;
        transition: all 0.3s ease;
    }

    .form-group input:focus {
        background: rgba(255,255,255,0.25);
    }

    .btn-submit {
        display: block;
        width: 100%;
        padding: 14px 0;
        border-radius: 30px;
        border: none;
        background: #00B8A9;
        color: #fff;
        font-size: 1.1rem;
        font-weight: 600;
        transition: all 0.3s ease;
        cursor: pointer;
    }

    .btn-submit:hover {
        background: transparent;
        border: 2px solid #00B8A9;
        color: #00B8A9;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(40px); }
        to { opacity: 1; transform: translateY(0); }
    }

</style>
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
<div class="overlay"></div>

<div class="form-container">
    <h2>Add New Employee</h2>
    <form action="AddEmployeeServlet" method="post">
        <div class="form-group">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" placeholder="Enter employee full name" required>
        </div>
        <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="Enter employee email" required>
        </div>
        <div class="form-group">
            <label for="department">Department</label>
            <input type="text" id="department" name="department" placeholder="Enter department" required>
        </div>
        <div class="form-group">
            <label for="designation">Designation</label>
            <input type="text" id="designation" name="designation" placeholder="Enter designation" required>
        </div>
        <div class="form-group">
            <label for="salary">Salary</label>
            <input type="number" step="0.01" id="salary" name="salary" placeholder="Enter salary" required>
        </div>
        <button type="submit" class="btn-submit">Add Employee</button>
    </form>
</div>

<%@ include file="includes/footer.jsp" %>
