package ctrls;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDao dao = new UserDao();
        User user = dao.login(email, password);

        if (user != null) {
            // Successful login
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect("dashboard.jsp");
        } else {
            // Failed login, redirect back with message and preserve email
            response.sendRedirect("login.jsp?msg=invalid&email=" + email);
        }
    }
}
