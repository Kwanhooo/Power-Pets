package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.domain.Project;
import com.mygroup.powerpets.persistence.impl.ProjectDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static com.mygroup.powerpets.util.ForwardUtil.PROJECT_URL;

public class CategoryServlet extends HttpServlet {
    /**
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     * @author Kwanho
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryName = req.getParameter("categoryName");
        ProjectDaoImpl projectDaoImpl = new ProjectDaoImpl();
        List<Project> projectList = projectDaoImpl.selectByCategory(categoryName);
        req.getSession().setAttribute("projectList", projectList);
        req.getRequestDispatcher(PROJECT_URL).forward(req, resp);
    }
}
