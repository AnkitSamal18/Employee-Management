<%@ page import="java.util.*,dao.EmployeeDao,dao.AttendanceDao,model.Employee,model.Attendance" %>
<%@ include file="includes/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendance | Employee Management System</title>

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

/* General Page Styling */
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

.form-container {
    max-width: 850px;
    margin: 80px auto 40px auto;
}
.table-container {
    max-width: 1100px;
    margin: 40px auto 80px auto;
}

/* Headings */
h2 {
    text-align: center;
    color: var(--accent);
    font-weight: 700;
    margin-bottom: 25px;
    letter-spacing: 0.5px;
}

/* Form Labels and Inputs */
label {
    font-weight: 500;
    color: #d0d4f0;
}

input, select {
    background: rgba(255,255,255,0.15);
    color: var(--text-light);
    border: 1px solid rgba(255,255,255,0.2);
    border-radius: 10px;
    padding: 10px;
    width: 100%;
    transition: all 0.3s ease;
}

/* Fix for dropdown visibility */
select {
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    position: relative;
    background-color: rgba(255,255,255,0.15);
    color: #fff;
    border: 1px solid rgba(255,255,255,0.2);
    border-radius: 10px;
    padding: 10px 35px 10px 10px;
    width: 100%;
    cursor: pointer;
}

/* Dropdown options (visible and clear) */
select option {
    background-color: #fff;
    color: #000;
}

/* On focus styles */
input:focus, select:focus {
    background: rgba(255,255,255,0.25);
    border-color: var(--accent);
    outline: none;
    box-shadow: 0 0 8px var(--accent);
}

/* Disabled Input Style */
input:disabled {
    background: rgba(255,255,255,0.05);
    color: #aaa;
    cursor: not-allowed;
}

/* Button Styles */
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
th, td {
    text-align: center;
    vertical-align: middle;
}
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

/* Animations */
@keyframes fadeIn {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>
</head>
<body>

<div class="form-container">
    <h2>Mark Attendance</h2>
    <form action="AttendanceServlet" method="post">
        <div class="row g-3">
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

            <div class="col-md-6">
                <label>Status</label>
                <select name="status" id="statusSelect" required>
                    <option value="Present">Present</option>
                    <option value="Absent">Absent</option>
                    <option value="Leave">Leave</option>
                </select>
            </div>

            <div class="col-md-6">
                <label>Date</label>
                <input type="date" name="date" required>
            </div>

            <div class="col-md-6">
                <label>Check In</label>
                <input type="time" name="checkIn" id="checkInInput" required>
            </div>

            <div class="col-md-6">
                <label>Check Out</label>
                <input type="time" name="checkOut" id="checkOutInput" required>
            </div>

            <div class="col-12">
                <button type="submit" class="btn-submit">Save Attendance</button>
            </div>
        </div>
    </form>
</div>

<div class="table-container">
    <h2>Attendance Records</h2>
    <table class="table table-hover text-light">
        <thead>
            <tr>
                <th>Emp ID</th>
                <th>Date</th>
                <th>Status</th>
                <th>Check In</th>
                <th>Check Out</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Attendance> list = AttendanceDao.getAll();
                for (Attendance a : list) {
            %>
            <tr>
                <td><%=a.getEmpId()%></td>
                <td><%=a.getDate()%></td>
                <td><%=a.getStatus()%></td>
                <td><%=a.getCheckIn()%></td>
                <td><%=a.getCheckOut()%></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%@ include file="includes/footer.jsp" %>

<!-- ✅ JavaScript: Disable Check-In/Out if Absent or Leave -->
<script>
document.addEventListener("DOMContentLoaded", function() {
    const statusSelect = document.getElementById("statusSelect");
    const checkInInput = document.getElementById("checkInInput");
    const checkOutInput = document.getElementById("checkOutInput");

    function toggleTimeFields() {
        const status = statusSelect.value;
        if (status === "Absent" || status === "Leave") {
            checkInInput.disabled = true;
            checkOutInput.disabled = true;
            checkInInput.value = "";
            checkOutInput.value = "";
        } else {
            checkInInput.disabled = false;
            checkOutInput.disabled = false;
        }
    }

    // Run once on load (for default selection)
    toggleTimeFields();

    // Listen for changes
    statusSelect.addEventListener("change", toggleTimeFields);
});
</script>

</body>
</html>
