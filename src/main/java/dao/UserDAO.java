package dao;

import db.DBConnection;
import model.User;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserDAO {

    public boolean registerUser(User user) {

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO users(full_name,email,password,phone,city,role) VALUES(?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getPhone());
            ps.setString(5, user.getCity());
            ps.setString(6, user.getRole());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {

            System.out.println("SQL Error Code : " + e.getErrorCode());
            System.out.println("SQL State      : " + e.getSQLState());
            System.out.println("Message        : " + e.getMessage());

            return false;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
        
    }
    public User loginUser(String email, String password) {

        User user = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setId(rs.getInt("id"));
                user.setFullName(rs.getString("full_name"));
                user.setEmail(rs.getString("email"));
                user.setPhone(rs.getString("phone"));
                user.setCity(rs.getString("city"));
                user.setRole(rs.getString("role"));

            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
  
    public String getUserNameById(int id) {

        String fullName = "";

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT full_name FROM users WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                fullName = rs.getString("full_name");

            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return fullName;

    }
}