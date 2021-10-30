package com.mygroup.powerpets.service;

import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.persistence.impl.UserDaoImpl;
import com.mygroup.powerpets.util.CookiesUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AccountService {
    /*
    JSP链接
 */
    public static final String INDEX_URL = "login.jsp";
    public static final String LOGIN_SUCCESS_URL = "login_success.jsp";
    public static final String REGISTER_URL = "register.jsp";

    /**
     * @author Kwanho
     * @param email 邮箱作为登录的唯一id
     * @param password 密码
     * @param req http请求对象，用来返回错误信息
     * @param resp http响应对象，用来发送响应
     * @return 是否登陆成功
     */
    public static boolean loginVerifying(String email, String password, HttpServletRequest req, HttpServletResponse resp) {
        UserDaoImpl userDaoImpl = new UserDaoImpl();
        User loginUser = userDaoImpl.selectByEmail(email);
        if (loginUser == null) {//不存在该账号
            req.setAttribute("login_error_msg", "不存在该账号");
            return false;
        }
        else if (loginUser.getPassword().equals(password)) //正确
        {
            //基本信息
            req.getSession().setAttribute("username", loginUser.getUsername());
            req.getSession().setAttribute("age", loginUser.getAge());
            req.getSession().setAttribute("sex", loginUser.getSex());
            req.getSession().setAttribute("email", loginUser.getEmail());
            req.getSession().setAttribute("id", loginUser.getId());
            req.getSession().setAttribute("balance", loginUser.getBalance());
            req.getSession().setAttribute("isLogin", "1");

            //清空登录错误信息
            req.setAttribute("login_error_msg", null);
            req.getSession().setAttribute("login_error_msg", null);

            //重定向至登陆成功页
            try {
                resp.sendRedirect(AccountService.LOGIN_SUCCESS_URL);
            } catch (IOException e) {
                e.printStackTrace();
            }

            return true;
        }
        else {
            req.setAttribute("login_error_msg", "账号或密码不正确!");
            return false;
        }
    }

    /**
     * @param newUser 用户对象，包含了注册所需要的信息
     * @param req     传入HTTP请求对象，以返回对应的信息
     * @param resp    传入HTTP响应对象，用来发送响应
     * @author Kwanho
     */
    public static void registerUser(User newUser, HttpServletRequest req, HttpServletResponse resp) {
        //清空注册中的错误信息
        req.setAttribute("register_error_msg", null);

        //与数据库交互
        UserDaoImpl userDaoImpl = new UserDaoImpl();
        User userWithThatEmail = userDaoImpl.selectByEmail(newUser.getEmail());
        if (userWithThatEmail != null) {
            req.setAttribute("register_error_msg", "该邮箱已经注册过！请检查后重试");
            try {
                req.getRequestDispatcher(AccountService.REGISTER_URL).forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
            return;
        }

        //在数据库添加这个用户的信息
        userDaoImpl.insertUser(newUser);

        //直接登录
        loginVerifying(newUser.getEmail(), newUser.getPassword(), req, resp);
    }
}
