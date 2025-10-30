package dao;

import java.sql.*;
import java.util.*;
import model.Salary;


public class SalaryDao {

    // Insert salary record
    public static int save(Salary s) {
        int status = 0;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                "INSERT INTO salary(emp_id, basic_salary, bonus, deductions, month, net_salary) VALUES(?,?,?,?,?,?)")) {
            
            ps.setInt(1, s.getEmpId());
            ps.setDouble(2, s.getBasicSalary());
            ps.setDouble(3, s.getBonus());
            ps.setDouble(4, s.getDeductions());
            ps.setString(5, s.getMonth());
            ps.setDouble(6, s.getNetSalary());

            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Get all salaries
    public static List<Salary> getAll() {
        List<Salary> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM salary ORDER BY month DESC");
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Salary s = new Salary();
                s.setId(rs.getInt("id"));
                s.setEmpId(rs.getInt("emp_id"));
                s.setBasicSalary(rs.getDouble("basic_salary"));
                s.setBonus(rs.getDouble("bonus"));
                s.setDeductions(rs.getDouble("deductions"));
                s.setMonth(rs.getString("month"));
                s.setNetSalary(rs.getDouble("net_salary"));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Delete salary by ID
    public static int delete(int id) {
        int status = 0;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM salary WHERE id=?")) {
            ps.setInt(1, id);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
