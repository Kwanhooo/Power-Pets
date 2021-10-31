package com.mygroup.powerpets.web.servlets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CategoryServlet extends HttpServlet {

    public static final String PROJECT_URL = "/WEB-INF/jsp/catalog/project.jsp";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String s = req.getParameter("selectedCategory");
        req.getSession().setAttribute("selectedCategory", s);
        req.getRequestDispatcher(PROJECT_URL).forward(req, resp);
    }
}
