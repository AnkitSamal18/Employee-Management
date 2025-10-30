package ctrls;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.SalaryDao;
import model.Salary;

@WebServlet("/SalaryServlet")
public class SalaryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int empId = Integer.parseInt(request.getParameter("employeeId"));
            double basicSalary = Double.parseDouble(request.getParameter("basicSalary"));
            double bonus = Double.parseDouble(request.getParameter("bonus"));
            double deductions = Double.parseDouble(request.getParameter("deductions"));
            String month = request.getParameter("month");

            double netSalary = basicSalary + bonus - deductions;

            Salary s = new Salary();
            s.setEmpId(empId);
            s.setBasicSalary(basicSalary);
            s.setBonus(bonus);
            s.setDeductions(deductions);
            s.setMonth(month);
            s.setNetSalary(netSalary);

            int status = SalaryDao.save(s);
            if (status > 0) {
                response.sendRedirect("salary.jsp?success=1");
            } else {
                response.sendRedirect("salary.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("salary.jsp?error=1");
        }
    }
}
