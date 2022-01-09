package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.service.AccountService;
import com.mygroup.powerpets.util.CookiesUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.mygroup.powerpets.util.ForwardUtil.LOGIN_URL;


public class UserLoginServlet extends HttpServlet {
    /**
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     * @author Kwanho
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(LOGIN_URL).forward(req, resp);
    }

    /**
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     * @author Kwanho
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String realVerifyCode = (String) req.getSession().getAttribute("verifyCode");
        if (!req.getParameter("verifyCode").equalsIgnoreCase(realVerifyCode)) {
            req.setAttribute("login_error_msg", "验证码输入错误");
            req.getRequestDispatcher(LOGIN_URL).forward(req, resp);
            return;
        }

        boolean isLoginSuccess = AccountService.loginVerifying(req.getParameter("email"), req.getParameter("password"), req, resp);
        if (!isLoginSuccess)//登录失败
        {
            req.getRequestDispatcher(LOGIN_URL).forward(req, resp);
            return;
        }
        CookiesUtil.remember(req, resp);
    }
}
