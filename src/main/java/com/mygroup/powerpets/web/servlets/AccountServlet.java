package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.util.ForwardUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AccountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("action").equals("sign-out")) {
            req.getSession().setAttribute("user", null);
            req.getSession().setAttribute("isLogin", "false");
            req.getRequestDispatcher(ForwardUtil.MAIN_URL).forward(req, resp);
            return;
        }
    }
}
