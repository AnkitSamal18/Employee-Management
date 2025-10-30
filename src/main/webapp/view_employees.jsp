<%@ page import="java.util.*,dao.EmployeeDao,model.Employee"%>
<%@ include file="includes/header.jsp"%>

<style>
body {
	font-family: 'Poppins', sans-serif;
	background:
		url('https://images.unsplash.com/photo-1581091215360-9f9a22b1d5a0?auto=format&fit=crop&w=1950&q=80')
		no-repeat center center fixed;
	background-size: cover;
	color: #fff;
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
	background: rgba(30, 42, 120, 0.75);
	z-index: 0;
}

.table-container {
	position: relative;
	z-index: 1;
	max-width: 1000px;
	margin: 120px auto 50px auto;
	background: rgba(255, 255, 255, 0.1);
	backdrop-filter: blur(15px);
	padding: 30px;
	border-radius: 20px;
	box-shadow: 0 10px 35px rgba(0, 0, 0, 0.4);
	animation: fadeIn 1s ease;
}

h3 {
	text-align: center;
	color: #00B8A9;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 2rem;
}

table {
	width: 100%;
	border-collapse: collapse;
	color: #fff;
}

th, td {
	padding: 12px 15px;
	text-align: center;
	border-bottom: 1px solid rgba(255, 255, 255, 0.2);
}

th {
	background: rgba(0, 184, 169, 0.8);
	font-weight: 600;
	border-radius: 10px 10px 0 0;
}

tr:hover {
	background: rgba(255, 255, 255, 0.1);
	transition: all 0.3s ease;
}

a.action-btn {
	padding: 6px 12px;
	border-radius: 6px;
	text-decoration: none;
	margin: 0 4px;
	font-weight: 500;
	font-size: 0.9rem;
	transition: all 0.3s ease;
}

a.edit {
	background: #00B8A9;
	color: #fff;
}

a.edit:hover {
	background: transparent;
	border: 1px solid #00B8A9;
	color: #00B8A9;
}

a.delete {
	background: #FF6B6B;
	color: #fff;
}

a.delete:hover {
	background: transparent;
	border: 1px solid #FF6B6B;
	color: #FF6B6B;
}

.btn_addEmp{
	border: 1px solid white;
	padding: 2px 18px;
	width: 150px;
	border-radius: 20px;
	margin: auto 800px;
}

@
keyframes fadeIn {from { opacity:0;
	transform: translateY(30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

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

<div class="table-container">
	<div class="btn_addEmp">
		<a href="add_employee.jsp" class="nav-link">Add Employee</a>
	</div>

	<h3>All Employees</h3>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Department</th>
				<th>Salary</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<Employee> list = EmployeeDao.getAllEmployees();
			for (Employee e : list) {
			%>
			<tr>
				<td><%=e.getId()%></td>
				<td><%=e.getName()%></td>
				<td><%=e.getEmail()%></td>
				<td><%=e.getDepartment()%></td>
				<td><%=e.getSalary()%></td>
				<td><a href="edit_employee.jsp?id=<%=e.getId()%>"
					class="action-btn edit">Edit</a> <a
					href="deleteEmployee?id=<%=e.getId()%>" class="action-btn delete">Delete</a>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</div>

<%@ include file="includes/footer.jsp"%>
