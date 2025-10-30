package ctrls;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.AttendanceDao;

@WebServlet("/AttendanceServlet")
public class AttendanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int empId = Integer.parseInt(request.getParameter("employeeId"));
            String status = request.getParameter("status");
            String checkIn = request.getParameter("checkIn");
            String checkOut = request.getParameter("checkOut");
            String dateStr = request.getParameter("date");

     
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date date = sdf.parse(dateStr);

  
            AttendanceDao.markAttendance(empId, status, checkIn, checkOut, date);

            response.sendRedirect("attendance.jsp?success=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("attendance.jsp?error=true");
        }
    }
}
