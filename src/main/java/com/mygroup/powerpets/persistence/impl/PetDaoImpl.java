package com.mygroup.powerpets.persistence.impl;

import com.mygroup.powerpets.domain.Pet;
import com.mygroup.powerpets.persistence.PetDao;
import com.mygroup.powerpets.util.DBUtils;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Mxs
 */
public class PetDaoImpl implements PetDao {
    public Pet selectById(int id) {
        Connection connection = DBUtils.getConnection();
        String sql = "SELECT * FROM pets WHERE petID = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (!rs.next()) {
                DBUtils.close(connection, pstmt, rs);
                return null;
            }

            String petName = rs.getString("petName");
            int petId = rs.getInt("petID");
            BigDecimal price = rs.getBigDecimal("price");
            int age = rs.getInt("age");
            String sex = rs.getString("sex");
            int status = rs.getInt("status");
            String category = rs.getString("category");
            String product = rs.getString("product");

            DBUtils.close(connection, pstmt, rs);
            return new Pet(petId, petName, price, age, sex, status, category, product);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Pet> selectByName(String name) {
        List<Pet> petList = new ArrayList<>();
        Connection connection = DBUtils.getConnection();
        String sql = "SELECT * FROM pets WHERE petName = ?";

        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, name);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String petName = rs.getString("petName");
                int petId = rs.getInt("petID");
                BigDecimal price = rs.getBigDecimal("price");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                int status = rs.getInt("status");
                String category = rs.getString("category");
                String product = rs.getString("product");

                petList.add(new Pet(petId, petName, price, age, sex, status, category, product));
            }

            DBUtils.close(connection, pstmt, rs);
            return petList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateUser(Pet pet) {
        Connection connection = DBUtils.getConnection();
        String sql = "Update pets SET petName = ?,price = ?,age = ?,sex = ?,status = ?,category = ?,product = ?" +
                "Where petID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, pet.getPetName());
            pstmt.setBigDecimal(2, pet.getPrice());
            pstmt.setInt(3, pet.getAge());
            pstmt.setString(4, pet.getSex());
            pstmt.setInt(5, pet.getStatus());
            pstmt.setString(6, pet.getCategory());
            pstmt.setString(7, pet.getProduct());
            pstmt.setInt(8, pet.getPetID());
            pstmt.executeUpdate();

            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * @param
     * @author mxs
     */
    public void insertPet(Pet pet) {
        Connection connection = DBUtils.getConnection();
        String sql = "Insert into pets (petID,petName,price,age,sex,status,category,product) values (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, pet.getPetID());
            pstmt.setString(2, pet.getPetName());
            pstmt.setBigDecimal(3, pet.getPrice());
            pstmt.setInt(4, pet.getAge());
            pstmt.setString(5, pet.getSex());
            pstmt.setInt(6, pet.getStatus());
            pstmt.setString(7, pet.getCategory());
            pstmt.setString(8, pet.getProduct());

            pstmt.executeUpdate();
            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deletePet(Pet pet) {
        Connection connection = DBUtils.getConnection();
        String sql = "DELETE FROM pets WHERE petID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, pet.getPetID());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
