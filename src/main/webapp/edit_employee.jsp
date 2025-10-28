<%@ page import="dao.EmployeeDao,model.Employee" %>
<%@ include file="includes/header.jsp" %>

<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: url('https://images.unsplash.com/photo-1581091215360-9f9a22b1d5a0?auto=format&fit=crop&w=1950&q=80') no-repeat center center fixed;
        background-size: cover;
        color: #fff;
    }

    .overlay {
        position: absolute;
        top: 0; left: 0;
        width: 100%; height: 100%;
        background: rgba(30, 42, 120, 0.75);
        z-index: 0;
    }

    .form-container {
        position: relative;
        z-index: 1;
        max-width: 600px;
        margin: 120px auto;
        background: rgba(255,255,255,0.1);
        backdrop-filter: blur(15px);
        padding: 40px 50px;
        border-radius: 20px;
        box-shadow: 0 10px 35px rgba(0,0,0,0.4);
        animation: fadeIn 1s ease;
    }

    h3 {
        text-align: center;
        color: #00B8A9;
        margin-bottom: 30px;
        font-weight: 700;
        font-size: 2rem;
    }

    form input[type="text"],
    form input[type="email"],
    form input[type="number"] {
        width: 100%;
        padding: 12px 15px;
        margin-bottom: 20px;
        border: none;
        border-radius: 10px;
        background: rgba(255,255,255,0.2);
        color: #fff;
        font-size: 1rem;
        transition: all 0.3s ease;
    }

    form input[type="text"]:focus,
    form input[type="email"]:focus,
    form input[type="number"]:focus {
        outline: none;
        background: rgba(255,255,255,0.3);
        box-shadow: 0 0 8px rgba(0,184,169,0.7);
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        border-radius: 25px;
        border: 2px solid #00B8A9;
        background: #00B8A9;
        color: #fff;
        font-size: 1.1rem;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    input[type="submit"]:hover {
        background: transparent;
        color: #00B8A9;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }

</style>

<div class="overlay"></div>

<div class="form-container">
    <h3>Edit Employee</h3>
    <%
      int id = Integer.parseInt(request.getParameter("id"));
      Employee e = EmployeeDao.getEmployeeById(id);
    %>
    <form action="editEmployee" method="post">
        <input type="hidden" name="id" value="<%=e.getId()%>">
        <input type="text" name="name" value="<%=e.getName()%>" placeholder="Name" required>
        <input type="email" name="email" value="<%=e.getEmail()%>" placeholder="Email" required>
        <input type="text" name="department" value="<%=e.getDepartment()%>" placeholder="Department" required>
        <input type="number" name="salary" value="<%=e.getSalary()%>" placeholder="Salary" step="0.01" required>
        <input type="submit" value="Update Employee">
    </form>
</div>

<%@ include file="includes/footer.jsp" %>
