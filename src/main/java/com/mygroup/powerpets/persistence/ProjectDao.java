package com.mygroup.powerpets.persistence;

import com.mygroup.powerpets.domain.Project;

import java.util.List;

public interface ProjectDao {
     void insertProject(Project project);
     void deleteProject(Project project);
     void updateProject(Project project);
     List<Project> selectByCategory(String category);
     Project selectByProject(String project);
}
