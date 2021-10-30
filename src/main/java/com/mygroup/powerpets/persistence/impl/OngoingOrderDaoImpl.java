package com.mygroup.powerpets.persistence.impl;

import com.mygroup.powerpets.domain.OngoingOrder;
import com.mygroup.powerpets.persistence.OngoingOrderDao;
import com.mygroup.powerpets.util.DBUtils;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OngoingOrderDaoImpl implements OngoingOrderDao {
    public void insertOngoingOrder(OngoingOrder order)
    {
        Connection connection = DBUtils.getConnection();
        String sql = "INSERT INTO ongoingorder (orderID,userID,petID,deliveryID,status,cost) values (?,?,?,?,?,?)";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,order.getOrderID());
            pstmt.setInt(2,order.getUserID());
            pstmt.setInt(3,order.getPetID());
            pstmt.setInt(4,order.getDeliveryID());
            pstmt.setInt(5,order.getStatus());
            pstmt.setBigDecimal(6,order.getCost());

            DBUtils.close(connection, pstmt,null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteOngoingOrder(OngoingOrder order)
    {
        Connection connection = DBUtils.getConnection();
        String sql = "DELETE FROM ongoingorder WHERE orderID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,order.getOrderID());
            pstmt.executeUpdate();

            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void updateOngoingOrder(OngoingOrder order)
    {
        Connection connection = DBUtils.getConnection();
        String sql = "Update ongoingorder SET userID = ?,petID = ?,deliveryID = ?,status = ?,cost =?"+
                     "Where orderID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(6,order.getOrderID());
            pstmt.setInt(1,order.getUserID());
            pstmt.setInt(2,order.getPetID());
            pstmt.setInt(3,order.getDeliveryID());
            pstmt.setInt(4,order.getStatus());
            pstmt.setBigDecimal(5,order.getCost());

            DBUtils.close(connection, pstmt,null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OngoingOrder> selectByuserID(int id) {
        List<OngoingOrder> list = new ArrayList<>();
        Connection connection = DBUtils.getConnection();
        String sql = "SELECT * FROM ongoingorder WHERE userID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,id);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int orderID = rs.getInt("orderID");
                int petID = rs.getInt("petID");
                int deliveryID = rs.getInt("deliveryID");
                int status = rs.getInt("status");
                BigDecimal cost = rs.getBigDecimal("cost");

                list.add(new OngoingOrder(orderID, id,petID, deliveryID,status,cost));
            }
            DBUtils.close(connection, pstmt,rs);
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;

    }

    @Override
    public OngoingOrder selectByorderID(int id) {
        Connection connection = DBUtils.getConnection();
        String sql = "SELECT * FROM ongoingorder WHERE orderID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,id);
            ResultSet rs = pstmt.executeQuery();

            int orderID = rs.getInt("orderID");
            int userID = rs.getInt("userID");
            int petID = rs.getInt("petID");
            int deliveryID = rs.getInt("deliveryID");
            int status = rs.getInt("status");
            BigDecimal cost = rs.getBigDecimal("cost");

            return new OngoingOrder(orderID, userID,petID, deliveryID,status,cost);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
