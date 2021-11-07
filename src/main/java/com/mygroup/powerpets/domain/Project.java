package com.mygroup.powerpets.domain;

public class Project {
    private String projectName;
    private String categoryName;
    private String projectDescription;

    public Project(String projectName, String categoryName, String projectDescription) {
        this.projectName = projectName;
        this.categoryName = categoryName;
        this.projectDescription = projectDescription;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectDescription() {
        return projectDescription;
    }

    public void setProjectDescription(String projectDescription) {
        this.projectDescription = projectDescription;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
