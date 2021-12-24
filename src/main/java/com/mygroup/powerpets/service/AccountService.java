package com.mygroup.powerpets.service;

import com.mygroup.powerpets.domain.Cart;
import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.persistence.impl.CartDaoImpl;
import com.mygroup.powerpets.persistence.impl.UserDaoImpl;
import com.mygroup.powerpets.util.ValidationUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.mygroup.powerpets.util.ForwardUtil.MAIN_URL;
import static com.mygroup.powerpets.util.ForwardUtil.REGISTER_URL;

public class AccountService {
    /**
     * @param email    邮箱作为登录的唯一id
     * @param password 密码
     * @param req      http请求对象，用来返回错误信息
     * @param resp     http响应对象，用来发送响应
     * @return 是否登陆成功
     * @author Kwanho
     */
    public static boolean loginVerifying(String email, String password, HttpServletRequest req, HttpServletResponse resp) {
        UserDaoImpl userDaoImpl = new UserDaoImpl();
        User loginUser = userDaoImpl.selectByEmail(email);
        if (loginUser == null) {//不存在该账号
            req.setAttribute("login_error_msg", "不存在该账号");
            return false;
        } else if (loginUser.getPassword().equals(password)) //正确
        {
            //基本信息
            req.getSession().setAttribute("isLogin", "true");
            req.getSession().setAttribute("user", loginUser);
            //清空登录错误信息
            req.setAttribute("login_error_msg", null);
            req.getSession().setAttribute("login_error_msg", null);

            //转发至登陆成功页
            try {
                req.getRequestDispatcher(MAIN_URL).forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }

            return true;
        } else {
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
                req.getRequestDispatcher(REGISTER_URL).forward(req, resp);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
            return;
        }

        //在数据库添加这个用户的信息
        userDaoImpl.insertUser(newUser);

        //为对应用户添加其购物车数据库信息
        CartDaoImpl cartDaoImpl = new CartDaoImpl();
        //System.out.println("In service "+newUser.getUsername());
        User fuckUser = userDaoImpl.selectByEmail(newUser.getEmail());
        int FUCKUSERID = fuckUser.getId();
        Cart cart = new Cart(FUCKUSERID, "", 0);
        cartDaoImpl.insertCart(cart);


        //直接登录
        loginVerifying(newUser.getEmail(), newUser.getPassword(), req, resp);
    }


    /**
     * @param username ajax传来的用户名
     * @return 传入的用户名是否可用
     * @author Kwanho
     */
    public static boolean validateUsername(String username) {
        UserDaoImpl userDaoImpl = new UserDaoImpl();
        return userDaoImpl.selectByName(username).size() == 0;
    }

    /**
     * @param email 验证这个email是否是可用的（是不是已经注册过了）
     * @return 可用 => true
     * @author Kwanho
     */
    public static boolean validateEmail(String email) {
        if (!ValidationUtil.emailValidator(email))
            return false;
        UserDaoImpl userDaoImpl = new UserDaoImpl();
        return userDaoImpl.selectByEmail(email) == null;
    }
}
