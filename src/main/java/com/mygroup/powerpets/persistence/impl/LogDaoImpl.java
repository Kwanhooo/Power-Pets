package com.mygroup.powerpets.persistence.impl;

import com.mygroup.powerpets.domain.Log;
import com.mygroup.powerpets.persistence.LogDao;
import com.mygroup.powerpets.util.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LogDaoImpl implements LogDao {
    @Override
    public Log selectByUserId(int userID) {
        Connection connection = DBUtils.getConnection();
        String sql = "SELECT * FROM log WHERE userID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, userID);
            ResultSet rs = pstmt.executeQuery();

            if (!rs.next()) {
                DBUtils.close(connection, pstmt, rs);
                return null;
            }


            String browsedPetID = rs.getString("browsedPetID");
            String cartAction = rs.getString("cartAction");
            String orderGenerated = rs.getString("orderGenerated");

            DBUtils.close(connection, pstmt, rs);
            return new Log(userID, browsedPetID, cartAction, orderGenerated);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void insertLog(Log log) {
        Connection connection = DBUtils.getConnection();
        String sql = "Insert into log (userID,browsedPetID,cartAction,orderGenerated) values (?,?,?,?)";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, log.getUserID());
            pstmt.setString(2, log.getBrowsedPetID());
            pstmt.setString(3, log.getCartAction());
            pstmt.setString(4, log.getOrderGenerated());
            pstmt.executeUpdate();

            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deletePet(Log log) {
        Connection connection = DBUtils.getConnection();
        String sql = "Delete FROM log WHERE userID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, log.getUserID());
            pstmt.executeUpdate();

            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateLog(Log log) {
        Connection connection = DBUtils.getConnection();
        String sql = "Update log SET browsedPetID = ?,cartAction = ?,orderGenerated = ? Where userID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, log.getBrowsedPetID());
            pstmt.setString(2, log.getCartAction());
            pstmt.setString(3, log.getOrderGenerated());
            pstmt.setInt(4, log.getUserID());
            pstmt.executeUpdate();

            DBUtils.close(connection, pstmt, null);
        } catch (Exception e) {
            try {
                PreparedStatement pstmt = connection.prepareStatement(sql);
                pstmt.setString(1, "");
                pstmt.setString(2, "");
                pstmt.setString(3, "");
                pstmt.setInt(4, log.getUserID());
                pstmt.executeUpdate();
                DBUtils.close(connection, pstmt, null);
            } catch (Exception exception) {
                exception.printStackTrace();
            }
        }
    }
}
