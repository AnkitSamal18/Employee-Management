<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,dao.EmployeeDao,dao.SalaryDao,model.Employee,model.Salary" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Salary | Employee Management System</title>

<!-- Bootstrap + Google Font -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
:root {
    --primary: #1E2A78;
    --accent: #00B8A9;
    --background: #0F1736;
    --text-light: #F8F9FA;
    --glass-bg: rgba(255, 255, 255, 0.1);
}

/* Global Styles */
body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, var(--primary), var(--background));
    color: var(--text-light);
    min-height: 100vh;
    margin: 0;
    padding: 0;
    overflow-x: hidden;
}

/* Containers */
.form-container, .table-container {
    background: var(--glass-bg);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(255,255,255,0.15);
    border-radius: 20px;
    padding: 40px;
    box-shadow: 0 10px 40px rgba(0,0,0,0.5);
    animation: fadeIn 0.8s ease-in-out;
}
.form-container { max-width: 850px; margin: 80px auto 40px auto; }
.table-container { max-width: 1100px; margin: 40px auto 80px auto; }

/* Headings */
h2 {
    text-align: center;
    color: var(--accent);
    font-weight: 700;
    margin-bottom: 25px;
    letter-spacing: 0.5px;
}

/* Form Inputs */
label { font-weight: 500; color: #d0d4f0; }
input, select {
    background: rgba(255,255,255,0.15);
    color: var(--text-light);
    border: 1px solid rgba(255,255,255,0.2);
    border-radius: 10px;
    padding: 10px;
    width: 100%;
    transition: all 0.3s ease;
}
select option {
    background-color: #fff;
    color: #000;
}
input:focus, select:focus {
    background: rgba(255,255,255,0.25);
    border-color: var(--accent);
    outline: none;
    box-shadow: 0 0 8px var(--accent);
}

/* Buttons */
.btn-submit {
    background: var(--accent);
    color: #fff;
    border: none;
    padding: 12px;
    border-radius: 30px;
    width: 100%;
    margin-top: 20px;
    font-weight: 600;
    letter-spacing: 0.5px;
    transition: all 0.3s ease;
}
.btn-submit:hover {
    background: transparent;
    border: 2px solid var(--accent);
    color: var(--accent);
    transform: translateY(-2px);
}

/* Table Styling */
.table {
    margin-top: 15px;
    border-collapse: separate;
    border-spacing: 0 8px;
}
th, td { text-align: center; vertical-align: middle; }
th {
    background: var(--accent);
    color: #fff;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
}
tbody tr {
    background: rgba(255,255,255,0.08);
    transition: all 0.3s ease;
}
tbody tr:hover {
    background: rgba(255,255,255,0.2);
    transform: scale(1.01);
}

/* Animation */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>
</head>

<body>

    <%@ include file="includes/header.jsp" %>

    <div class="form-container">
        <h2>Manage Salary</h2>
        <form action="SalaryServlet" method="post">
            <div class="row g-3">

                <!-- Employee Dropdown -->
                <div class="col-md-6">
                    <label>Employee</label>
                    <select name="employeeId" required>
                        <option value="">Select Employee</option>
                        <%
                            List<Employee> employees = EmployeeDao.getAllEmployees();
                            for (Employee emp : employees) {
                        %>
                            <option value="<%=emp.getId()%>"><%=emp.getName()%></option>
                        <% } %>
                    </select>
                </div>

                <!-- Month -->
                <div class="col-md-6">
                    <label>Month</label>
                    <select name="month" required>
                        <option value="">Select Month</option>
                        <option>January</option>
                        <option>February</option>
                        <option>March</option>
                        <option>April</option>
                        <option>May</option>
                        <option>June</option>
                        <option>July</option>
                        <option>August</option>
                        <option>September</option>
                        <option>October</option>
                        <option>November</option>
                        <option>December</option>
                    </select>
                </div>

                <!-- Basic Salary -->
                <div class="col-md-6">
                    <label>Basic Salary (₹)</label>
                    <input type="number" name="basicSalary" min="0" step="0.01" required>
                </div>

                <!-- Bonus -->
                <div class="col-md-6">
                    <label>Bonus (₹)</label>
                    <input type="number" name="bonus" min="0" step="0.01">
                </div>

                <!-- Deductions -->
                <div class="col-md-6">
                    <label>Deductions (₹)</label>
                    <input type="number" name="deductions" min="0" step="0.01">
                </div>

                <!-- Net Salary -->
                <div class="col-md-6">
                    <label>Net Salary (₹)</label>
                    <input type="number" name="netSalary" id="netSalary" readonly>
                </div>

                <div class="col-12">
                    <button type="submit" class="btn-submit">Save Salary</button>
                </div>
            </div>
        </form>
    </div>

    <div class="table-container">
        <h2>Salary Records</h2>
        <table class="table table-hover text-light">
            <thead>
                <tr>
                    <th>Emp ID</th>
                    <th>Month</th>
                    <th>Basic Salary</th>
                    <th>Bonus</th>
                    <th>Deductions</th>
                    <th>Net Salary</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Salary> list = SalaryDao.getAll();
                    for (Salary s : list) {
                %>
                <tr>
                    <td><%=s.getEmpId()%></td>
                    <td><%=s.getMonth()%></td>
                    <td>₹<%=s.getBasicSalary()%></td>
                    <td>₹<%=s.getBonus()%></td>
                    <td>₹<%=s.getDeductions()%></td>
                    <td>₹<%=s.getNetSalary()%></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <%@ include file="includes/footer.jsp" %>

    <!-- Auto Calculate Net Salary -->
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const basic = document.querySelector('[name="basicSalary"]');
        const bonus = document.querySelector('[name="bonus"]');
        const deduct = document.querySelector('[name="deductions"]');
        const total = document.getElementById("netSalary");

        function calculateTotal() {
            const b = parseFloat(basic.value) || 0;
            const a = parseFloat(bonus.value) || 0;
            const d = parseFloat(deduct.value) || 0;
            total.value = (b + a - d).toFixed(2);
        }

        [basic, bonus, deduct].forEach(input => input.addEventListener("input", calculateTotal));
    });
    </script>

</body>
</html>
