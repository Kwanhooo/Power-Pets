package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.persistence.impl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.List;
import java.util.ListIterator;

public class UsernameExitServlet extends HttpServlet {
    UserDaoImpl userDaoImpl=new UserDaoImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username=(String)req.getParameter("username");
        List<User> list=userDaoImpl.selectByName(username);
        ListIterator<User>listIterator=list.listIterator();
        resp.setContentType("text/plain");
        PrintWriter writer=resp.getWriter();
        if(listIterator.hasNext())
        {
            writer.print("Exit");
        }
        else
        {
            writer.print("No Exit");
        }
        writer.flush();
        writer.close();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
