package dao;

import java.sql.*;
import java.util.*;
import model.Attendance;

public class AttendanceDao {


    public static void markAttendance(int empId, String status, String checkIn, String checkOut, java.util.Date date) {
        String query = "INSERT INTO attendance (emp_id, date, status, check_in, check_out) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, empId);
            ps.setDate(2, new java.sql.Date(date.getTime()));
            ps.setString(3, status);
            ps.setString(4, checkIn);
            ps.setString(5, checkOut);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static List<Attendance> getAll() {
        List<Attendance> list = new ArrayList<>();
        String query = "SELECT * FROM attendance ORDER BY date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Attendance a = new Attendance();
                a.setId(rs.getInt("id"));
                a.setEmpId(rs.getInt("emp_id"));
                a.setDate(rs.getDate("date"));
                a.setStatus(rs.getString("status"));
                a.setCheckIn(rs.getString("check_in"));
                a.setCheckOut(rs.getString("check_out"));
                list.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
