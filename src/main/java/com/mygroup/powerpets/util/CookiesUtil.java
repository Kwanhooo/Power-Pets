package com.mygroup.powerpets.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class CookiesUtil {
    public static void remember(HttpServletRequest request, HttpServletResponse response) {
        String email = request.getParameter("email");                    //获取用户名
        String password = request.getParameter("password");        //获取密码
        String rememberMe = request.getParameter("rememberMe");     //获取是否打钩
        System.out.println("rememberMe::");
        System.out.println("password = " + password);
        System.out.println("email = " + email);
        String codeName = "";
        try {
            codeName = URLEncoder.encode(email, "UTF-8");      //对输入的中文进行编码，防止乱码出现
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        Cookie nameCookie = new Cookie("email", codeName);
        Cookie passwordCookie = new Cookie("password", password);

        nameCookie.setPath(request.getContextPath() + "/");//设置Cookie的有效路径
        passwordCookie.setPath(request.getContextPath() + "/");//设置Cookie的有效路径

        if (rememberMe != null && "rememberMe".equals(rememberMe)) {//有记住我，就设置cookie的保存时间
            nameCookie.setMaxAge(7 * 24 * 60 * 60);
            passwordCookie.setMaxAge(7 * 24 * 60 * 60);
        } else {//没有记住我，设置cookie的时间为0
            nameCookie.setMaxAge(0);
            passwordCookie.setMaxAge(0);
        }
        response.addCookie(nameCookie);
        response.addCookie(passwordCookie);
    }
}
