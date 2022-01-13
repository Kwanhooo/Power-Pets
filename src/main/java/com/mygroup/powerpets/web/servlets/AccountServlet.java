package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.domain.OngoingOrder;
import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.persistence.impl.OngoingOrderDaoImpl;
import com.mygroup.powerpets.persistence.impl.UserDaoImpl;
import com.mygroup.powerpets.service.AccountService;
import com.mygroup.powerpets.service.LogService;
import com.mygroup.powerpets.util.ForwardUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
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
        if (req.getParameter("action").equals("validate")) {
            //account?action=validate&type=验证的类型&value=验证的内容
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
            return;
        }

        //若用户未登录 先进行登录
        if (req.getSession().getAttribute("user") == null) {
            resp.sendRedirect("login");
            return;
            //req.getRequestDispatcher(ForwardUtil.LOGIN_URL).forward(req, resp);
        }

        User user = (User) req.getSession().getAttribute("user");

        if (req.getParameter("action").equals("sign-out")) {
            req.getSession().removeAttribute("user");
            req.getSession().setAttribute("isLogin", "false");
//            req.getRequestDispatcher(ForwardUtil.MAIN_URL).forward(req, resp);
            resp.sendRedirect("login");
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
        if (req.getParameter("action").equals("get-address-book")) {
            UserDaoImpl userDaoImpl = new UserDaoImpl();
            String addressBookStr = userDaoImpl.selectById(user.getId()).getAddress();
            addressBookStr = java.net.URLEncoder.encode(addressBookStr, "UTF-8");
            resp.setContentType("text/plain");
            PrintWriter writer = resp.getWriter();
            writer.print(addressBookStr);
        }
        if (req.getParameter("action").equals("update-address-book")) {
            String requestStr = req.getParameter("data");
            int addressIndex = Integer.parseInt(requestStr.split("@")[0]);
            String addressToUpdate = requestStr.split("@")[1];

            UserDaoImpl userDaoImpl = new UserDaoImpl();
            User userToUpdate = userDaoImpl.selectById(user.getId());
            String[] addressArray = userToUpdate.getAddress().split("@");
            String newAddressStr = "";
            boolean isNew = true;
            for (int i = 0; i < addressArray.length; i++) {
                if (i != addressIndex) {
                    newAddressStr += addressArray[i] + "@";
                } else {
                    newAddressStr += addressToUpdate + "@";
                    isNew = false;
                }
            }
            if (isNew)
                newAddressStr += addressToUpdate + "@";
            userToUpdate.setAddress(newAddressStr);
            userDaoImpl.updateUser(userToUpdate);
            req.getSession().setAttribute("user", userToUpdate);
        }
        if (req.getParameter("action").equals("update-user-info")) {
            {
                User oldUser;
                UserDaoImpl userDaoImpl = new UserDaoImpl();
                oldUser = userDaoImpl.selectById(user.getId());

                String username = new String(req.getParameter("username").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
                String password = req.getParameter("password");
                String sex = req.getParameter("sex");
                String email = req.getParameter("email");

                oldUser.setUsername(username);
                oldUser.setPassword(password);
                oldUser.setSex(sex);
                oldUser.setEmail(email);
                //*****不从这里修改收货地址信息
                //oldUser.setAddress(consignee + "#" + city + "#" + address + "#" + contact);

                userDaoImpl.updateUser(oldUser);
                req.getSession().setAttribute("user", oldUser);
            }
        }
    }
}
