package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.service.AccountService;
import com.mygroup.powerpets.util.ForwardUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MainPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if(req.getParameter("action") == null)
        {
            req.getRequestDispatcher(ForwardUtil.MAIN_URL).forward(req, resp);
            return;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getParameter("keywords");
        //搜索函数
        //带上结果List转发到搜索结果页
    }
}
