package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.service.AccountService;
import com.mygroup.powerpets.util.ValidationUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import static com.mygroup.powerpets.util.ForwardUtil.REGISTER_URL;

public class UserRegisterServlet extends HttpServlet {
    /**
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     * @author Kwanho
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action.equals("register"))
            req.getRequestDispatcher(REGISTER_URL).forward(req, resp);
        else {//register?action=validate&type=验证的类型&value=验证的内容
            if (action.equals("validate")) {
                String type = req.getParameter("type");
                String value = req.getParameter("value");
                resp.setContentType("text/plainText");
                PrintWriter out = resp.getWriter();
                if (type.equals("username")) {
                    if (AccountService.validateUsername(value)) out.print("available");
                    else out.print("occupied");
                } else if (type.equals("email")) {
                    if (AccountService.validateEmail(value)) out.print("available");
                    else out.print("occupied");
                } else {
                    out.print("error");
                }
                out.flush();
            }
        }
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
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String doubleCheckPassword = req.getParameter("doubleCheckPassword");
        int age;
        try {
            age = Integer.parseInt(req.getParameter("age"));
        } catch (NumberFormatException ex) {
            req.setAttribute("register_error_msg", "您输入的年龄格式有误！");
            req.getRequestDispatcher(REGISTER_URL).forward(req, resp);
            return;
        }

        if (!password.equals(doubleCheckPassword)) {
            req.setAttribute("register_error_msg", "两次输入的密码不一致！请检查重新输入");
            req.getRequestDispatcher(REGISTER_URL).forward(req, resp);
            return;
        }

        String email = req.getParameter("email");
        if (!ValidationUtil.emailValidator(email)) {
            req.setAttribute("register_error_msg", "邮箱格式错误！请检查后重试");
            req.getRequestDispatcher(REGISTER_URL).forward(req, resp);
            return;
        }

        String address = req.getParameter("address");
        BigDecimal balance = new BigDecimal(0);
        String sex = req.getParameter("sex");


        User newUser = new User(username, password, address, balance, sex, age, email);
        AccountService.registerUser(newUser, req, resp);
    }
}
