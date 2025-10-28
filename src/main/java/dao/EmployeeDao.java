package dao;

import java.sql.*;
import java.util.*;
import model.Employee;

public class EmployeeDao {
    private static final String URL = "jdbc:mysql://localhost:3306/exp";
    private static final String USER = "root";
    private static final String PASS = "ankit";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception e) { e.printStackTrace(); }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }

    public static int addEmployee(Employee e) {
        int status = 0;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("INSERT INTO employee(name,email,department,salary) VALUES(?,?,?,?)")) {
            ps.setString(1, e.getName());
            ps.setString(2, e.getEmail());
            ps.setString(3, e.getDepartment());
            ps.setDouble(4, e.getSalary());
            status = ps.executeUpdate();
        } catch (Exception ex) { ex.printStackTrace(); }
        return status;
    }

    public static List<Employee> getAllEmployees() {
        List<Employee> list = new ArrayList<>();
        try (Connection con = getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM employee")) {
            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("department"),
                    rs.getDouble("salary")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public static Employee getEmployeeById(int id) {
        Employee e = null;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM employee WHERE id=?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e = new Employee(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("department"),
                    rs.getDouble("salary"));
            }
        } catch (Exception ex) { ex.printStackTrace(); }
        return e;
    }

    public static int updateEmployee(Employee e) {
        int status = 0;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "UPDATE employee SET name=?, email=?, department=?, salary=? WHERE id=?")) {
            ps.setString(1, e.getName());
            ps.setString(2, e.getEmail());
            ps.setString(3, e.getDepartment());
            ps.setDouble(4, e.getSalary());
            ps.setInt(5, e.getId());
            status = ps.executeUpdate();
        } catch (Exception ex) { ex.printStackTrace(); }
        return status;
    }

    public static int deleteEmployee(int id) {
        int status = 0;
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM employee WHERE id=?")) {
            ps.setInt(1, id);
            status = ps.executeUpdate();
        } catch (Exception ex) { ex.printStackTrace(); }
        return status;
    }
}
