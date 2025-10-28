package ctrls;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.EmployeeDao;
import model.Employee;
import javax.servlet.annotation.WebServlet;

@WebServlet("/editEmployee")
public class EditEmployeeServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dept = request.getParameter("department");
        double salary = Double.parseDouble(request.getParameter("salary"));

        Employee e = new Employee(id, name, email, dept, salary);
        EmployeeDao.updateEmployee(e);

        response.sendRedirect("view_employees.jsp");
    }
}