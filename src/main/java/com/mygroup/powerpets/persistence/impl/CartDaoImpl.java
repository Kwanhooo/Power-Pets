package com.mygroup.powerpets.persistence.impl;

import com.mygroup.powerpets.domain.Cart;
import com.mygroup.powerpets.persistence.CartDao;
import com.mygroup.powerpets.util.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CartDaoImpl implements CartDao {

    @Override
    public void insertCart(Cart cart) {
        Connection connection = DBUtils.getConnection();
        String sql = "Insert into cart (userID,petsID,amount) values (?,?,?)";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, cart.getUserID());
            pstmt.setString(2, cart.getPetsID());
            pstmt.setInt(3, cart.getAmount());
            pstmt.executeUpdate();

            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCart(Cart cart) {
        Connection connection = DBUtils.getConnection();
        String sql = "Delete FROM cart WHERE userID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, cart.getUserID());
            pstmt.executeUpdate();

            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateCart(Cart cart) {
        Connection connection = DBUtils.getConnection();
        String sql = "Update cart SET petsID = ?,amount = ? Where userID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, cart.getPetsID());
            pstmt.setInt(2, cart.getAmount());
            pstmt.setInt(3, cart.getUserID());
            pstmt.executeUpdate();

            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Cart selectByuserID(int id) {
        Connection connection = DBUtils.getConnection();
        String sql = "SELECT * FROM cart WHERE userID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (!rs.next()) {
                DBUtils.close(connection, pstmt, rs);
                return null;
            }


            String petsID = rs.getString("petsID");
            int amount = rs.getInt("amount");

            DBUtils.close(connection, pstmt, rs);
            return new Cart(id, petsID, amount);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
