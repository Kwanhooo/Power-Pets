package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.domain.Pet;
import com.mygroup.powerpets.persistence.impl.PetDaoImpl;
import com.mygroup.powerpets.util.ForwardUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

public class CartServlet extends HttpServlet {
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

        //请求的操作是加入购物车
        if (action.equals("add-to-cart")) {
            String petID = req.getParameter("petID");
            PetDaoImpl petDaoImpl = new PetDaoImpl();
            Pet petToAdd = petDaoImpl.selectById(Integer.parseInt(petID));
            //如果还没有购物车列表，立即建立一个
            if (req.getSession().getAttribute("cartList") == null) {
                List<Pet> cartList = new ArrayList();
                cartList.add(petToAdd);
                req.getSession().setAttribute("cartList", cartList);
            } else {//有购物车列表了，把这个新的加上
                List<Pet> cartList = (List<Pet>) req.getSession().getAttribute("cartList");
                cartList.add(petToAdd);
                req.getSession().setAttribute("cartList", cartList);
            }
            resp.sendRedirect("project?projectName=" + URLEncoder.encode(req.getParameter("projectName"), "UTF-8"));
            return;
        }

        //请求展示购物车内容
        if (action.equals("view")) {
            req.getRequestDispatcher(ForwardUtil.CART_URL).forward(req, resp);
        }
    }
}
