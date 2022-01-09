package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.domain.OngoingOrder;
import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.persistence.impl.OngoingOrderDaoImpl;
import com.mygroup.powerpets.persistence.impl.UserDaoImpl;
import com.mygroup.powerpets.service.LogService;
import com.mygroup.powerpets.util.ForwardUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

public class AccountServlet extends HttpServlet {
    /**
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     * @author Kwanho
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        if (req.getParameter("action").equals("sign-out")) {
            req.getSession().removeAttribute("user");
            req.getSession().setAttribute("isLogin", "false");
            req.getRequestDispatcher(ForwardUtil.MAIN_URL).forward(req, resp);
            return;
        }
        if (req.getParameter("action").equals("view")) {
            if (user == null) {
                resp.sendRedirect("login");
                return;
            }
            req.getRequestDispatcher(ForwardUtil.ACCOUNT_URL).forward(req, resp);
        }
        if (req.getParameter("action").equals("view-order")) {
            OngoingOrderDaoImpl ongoingOrderDaoImpl = new OngoingOrderDaoImpl();
            List<OngoingOrder> ongoingOrderList = ongoingOrderDaoImpl.selectByuserID(user.getId());
            req.getSession().setAttribute("ongoingOrderList", ongoingOrderList);
            req.getRequestDispatcher(ForwardUtil.MY_ORDER_URL).forward(req, resp);
        }
        if (req.getParameter("action").equals("log")) {
            String[] browsedLogList = LogService.buildLogsList(user.getId());
            req.getSession().setAttribute("logList", browsedLogList);
            req.getRequestDispatcher(ForwardUtil.LOG_URL).forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        User oldUser = (User) req.getSession().getAttribute("user");

        String username = new String(req.getParameter("username").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        String password = req.getParameter("password");
        String sex = req.getParameter("sex");
        String email = req.getParameter("email");
        String consignee = new String(req.getParameter("consignee").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        String city = new String(req.getParameter("city").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        String address = new String(req.getParameter("address").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        String contact = req.getParameter("contact");

        oldUser.setUsername(username);
        oldUser.setPassword(password);
        oldUser.setSex(sex);
        oldUser.setEmail(email);
        oldUser.setAddress(consignee + "#" + city + "#" + address + "#" + contact);

        UserDaoImpl userDaoImpl = new UserDaoImpl();
        userDaoImpl.updateUser(oldUser);
        resp.sendRedirect("account?action=view");
    }
}
