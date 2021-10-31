package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.service.AccountService;
import com.mygroup.powerpets.util.CookiesUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class UserLoginServlet extends HttpServlet {
    /**
     * @author Kwanho
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(AccountService.LOGIN_URL).forward(req,resp);
    }

    /**
     * @author Kwanho
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean isLoginSuccess = AccountService.loginVerifying(req.getParameter("email"), req.getParameter("password"),req,resp);
        if(!isLoginSuccess)//登录失败
        {
            req.getRequestDispatcher(AccountService.LOGIN_URL).forward(req,resp);
            return;
        }
        CookiesUtil.remember(req,resp);
    }
}
