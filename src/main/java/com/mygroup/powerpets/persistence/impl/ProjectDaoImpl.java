package com.mygroup.powerpets.persistence.impl;

import com.mygroup.powerpets.domain.Project;
import com.mygroup.powerpets.persistence.ProjectDao;
import com.mygroup.powerpets.util.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProjectDaoImpl implements ProjectDao {
    @Override
    public void insertProject(Project project) {
        Connection connection = DBUtils.getConnection();
        String sql = "Insert into project (projectName,categoryName,projectDescription) values(?,?,?)";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, project.getProjectName());
            pstmt.setString(2, project.getCategoryName());
            pstmt.setString(3,project.getProjectDescription());

            pstmt.executeUpdate();
            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteProject(Project project) {
        Connection connection = DBUtils.getConnection();
        String sql = "Delete FROM project WHERE projectName = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, project.getProjectName());
            pstmt.executeUpdate();

            DBUtils.close(connection, pstmt, null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateProject(Project project) {
        //这个好像不需要用到改的方法
    }

    @Override
    public List<Project> selectByCategory(String category) {
        List<Project> list = new ArrayList<>();
        Connection connection = DBUtils.getConnection();
        String sql = "Select * FROM project WHERE categoryName = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1,category);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String projectName = rs.getString("projectName");
                String categoryName = rs.getString("categoryName");
                String projectDescription = rs.getString("projectDescription");
                list.add(new Project(projectName,categoryName,projectDescription));
            }

            DBUtils.close(connection, pstmt, rs);
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Project selectByProject(String project) {
        Connection connection = DBUtils.getConnection();
        String sql = "Select * FROM project WHERE projectName = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setString(1, project);
            ResultSet rs = pstmt.executeQuery();

            if (!rs.next()) {
                DBUtils.close(connection, pstmt, rs);
                return null;
            }

            String projectName = rs.getString("projectName");
            String categoryName = rs.getString("categoryName");
            String projectDescription = rs.getString("projectDescription");
            DBUtils.close(connection, pstmt, rs);
            return new Project(projectName, categoryName,projectDescription);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
