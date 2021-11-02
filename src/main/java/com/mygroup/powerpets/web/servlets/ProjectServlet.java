package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.domain.Pet;
import com.mygroup.powerpets.persistence.impl.PetDaoImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static com.mygroup.powerpets.util.ForwardUtil.PET_URL;

public class ProjectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     String projectName = req.getParameter("projectName");
     PetDaoImpl petDaoImpl = new PetDaoImpl();
     List<Pet> petList = petDaoImpl.selectByProjectName(projectName);
     req.getSession().setAttribute("petList",petList);
        req.getRequestDispatcher(PET_URL).forward(req,resp);
    }
}
