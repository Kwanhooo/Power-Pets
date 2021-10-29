package com.mygroup.powerpets.service;

import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.persistence.impl.UserDaoImpl;

import javax.servlet.http.HttpServletRequest;

public class AccountService {
    public static User loginVerifying(String email, String password, HttpServletRequest req) {
        UserDaoImpl userDaoImpl = new UserDaoImpl();
        User loginUser = userDaoImpl.selectByEmail(email);
        if (loginUser == null) {//不存在该账号
            req.setAttribute("login_error_msg", "不存在该账号");
            return null;
        } else if (loginUser.getPassword().equals(password))//正确
            return loginUser;
        else {
            req.setAttribute("login_error_msg", "账号或密码不正确!");
            return null;
        }
    }
}
