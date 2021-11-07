package com.mygroup.powerpets.persistence.impl;

import com.mygroup.powerpets.domain.CompletedOrder;
import com.mygroup.powerpets.persistence.CompletedOrderDao;
import com.mygroup.powerpets.util.DBUtils;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CompletedOrderDaoImpl implements CompletedOrderDao {
    @Override
    public void insertCompletedOrder(CompletedOrder order) {
        Connection connection = DBUtils.getConnection();
        String sql = "Insert Into completedorder (orderID,userID,petID,comments,cost) values(?,?,?,?,?)";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, order.getOrderID());
            pstmt.setInt(2, order.getUserID());
            pstmt.setInt(3, order.getPetID());
            pstmt.setString(4, order.getComments());
            pstmt.setBigDecimal(5, order.getCost());

            pstmt.executeUpdate();
            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCompletedOrder(CompletedOrder order) {
        Connection connection = DBUtils.getConnection();
        String sql = "DELETE FROM completedorder WHERE orderID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, order.getOrderID());
            pstmt.executeUpdate();

            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateOngoingOrder(CompletedOrder order) {
        Connection connection = DBUtils.getConnection();
        String sql = "Update completedorder SET userID = ?,petID = ?,comments = ?,cost =?" +
                "WHERE  orderID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(5, order.getOrderID());
            pstmt.setInt(1, order.getUserID());
            pstmt.setInt(2, order.getPetID());
            pstmt.setString(3, order.getComments());
            pstmt.setBigDecimal(4, order.getCost());
            pstmt.executeUpdate();

            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<CompletedOrder> selectByuserID(int id) {
        List<CompletedOrder> list = new ArrayList<>();
        Connection connection = DBUtils.getConnection();
        String sql = "SELECT * FROM completedorder WHERE orderID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int orderID = rs.getInt("orderID");
                int petID = rs.getInt("petID");
                String comments = rs.getString("comments");
                BigDecimal cost = rs.getBigDecimal("cost");

                list.add(new CompletedOrder(orderID, id, petID, comments, cost));
            }
            DBUtils.close(connection, pstmt, rs);
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public CompletedOrder selectByorderID(int id) {
        Connection connection = DBUtils.getConnection();
        String sql = "SELECT * FROM completedorder WHERE orderID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (!rs.next()) {
                DBUtils.close(connection, pstmt, rs);
                return null;
            }


            int userID = rs.getInt("userID");
            int petID = rs.getInt("petID");
            String comments = rs.getString("comments");
            BigDecimal cost = rs.getBigDecimal("cost");

            DBUtils.close(connection, pstmt, rs);
            return new CompletedOrder(id, userID, petID, comments, cost);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
