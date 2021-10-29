package com.mygroup.powerpets.persistence.impl;


import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.persistence.UserDao;
import com.mygroup.powerpets.util.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserDaoImpl implements UserDao {
    /**
     * @param id 用户id
     * @return User引用
     * @author Kwanho
     */
    @Override
    public User selectById(int id) {
        Connection connection = DBUtils.getConnection();
        String sql = "SELECT * FROM user WHERE id = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            String username = rs.getString("username");
            String password = rs.getString("password");
            String email = rs.getString("email");
            String sex = rs.getString("sex");
            byte age = (byte) rs.getInt("age");

            DBUtils.close(connection, pstmt, rs);
            return new User(id, username, password, email, sex, age);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * @param username 用户名
     * @return List引用
     * @author Kwanho
     */
    @Override
    public List<User> selectByName(String username) {
        List<User> userList = new ArrayList<>();
        Connection connection = DBUtils.getConnection();
        String sql = "SELECT * FROM user WHERE username = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String password = rs.getString("password");
                String email = rs.getString("email");
                String sex = rs.getString("sex");
                byte age = (byte) rs.getInt("age");
                userList.add(new User(id, username, password, email, sex, age));
            }
            DBUtils.close(connection, pstmt, rs);
            return userList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * @param email 电子邮箱作为唯一凭据
     * @return User 用户
     * @author Kwanho
     */
    @Override
    public User selectByEmail(String email) {
        Connection connection = DBUtils.getConnection();
        String sql = "SELECT * FROM user WHERE email = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (!rs.next()) {
                DBUtils.close(connection, pstmt, rs);
                return null;
            }

            int id = rs.getInt("id");
            String username = rs.getString("username");
            String password = rs.getString("password");
            String sex = rs.getString("sex");
            byte age = (byte) rs.getInt("age");

            DBUtils.close(connection, pstmt, rs);
            return new User(id, username, password, email, sex, age);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * @param user 用户
     * @author Kwanho
     */
    @Override
    public void UpdateUser(User user) {
        Connection connection = DBUtils.getConnection();
        String sql = "UPDATE user " +
                "SET username = ?, password = ?, email = ?, sex = ?, age = ?" +
                "WHERE id = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getSex());
            pstmt.setInt(5, user.getAge());
            pstmt.setInt(6, user.getId());
            pstmt.executeUpdate();

            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * @param user 用户
     * @author Kwanho
     */
    @Override
    public void DeleteUser(User user) {
        Connection connection = DBUtils.getConnection();
        String sql = "DELETE FROM user WHERE id = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * @param user 用户
     * @author Kwanho
     */
    @Override
    public void insertUser(User user) {
        Connection connection = DBUtils.getConnection();
        String sql = "INSERT INTO user (username, password, email, sex, age) VALUES (?,?,?,?,?)";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getSex());
            pstmt.setInt(5, user.getAge());

            pstmt.executeUpdate();
            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
