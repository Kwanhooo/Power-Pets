package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserLoginServlet extends HttpServlet {
    /*
        JSP链接
     */
    public static final String INDEX_URL = "login.jsp";
    public static final String LOGIN_SUCCESS_URL = "login_success.jsp";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("error_msg","请从登录页面登录");
        req.getRequestDispatcher(INDEX_URL).forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User loginUser = AccountService.loginVerifying(req.getParameter("email"), req.getParameter("password"),req);
        if(loginUser == null)//登录失败
        {
            req.getRequestDispatcher(INDEX_URL).forward(req,resp);
        }
        else//登录成功
        {
            req.getSession().setAttribute("username",loginUser.getUsername());
            req.getSession().setAttribute("age",loginUser.getAge());
            req.getSession().setAttribute("sex",loginUser.getSex());
            req.getSession().setAttribute("email",loginUser.getEmail());
            req.getSession().setAttribute("id",loginUser.getId());
            req.getSession().setAttribute("isLogin","1");
            req.setAttribute("login_error_msg",null);
            req.getSession().setAttribute("login_error_msg",null);
            resp.sendRedirect(LOGIN_SUCCESS_URL);
        }
    }
}
