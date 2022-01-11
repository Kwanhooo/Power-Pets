package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.domain.Cart;
import com.mygroup.powerpets.domain.Pet;
import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.persistence.impl.CartDaoImpl;
import com.mygroup.powerpets.persistence.impl.PetDaoImpl;
import com.mygroup.powerpets.service.LogService;
import com.mygroup.powerpets.util.ForwardUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
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

        //请求操作 加入购物车
        //更新购物车数据库
        if (action.equals("add-to-cart")) {
            if (req.getSession().getAttribute("user") == null) {
                resp.setContentType("text/plain");
                PrintWriter writer = resp.getWriter();
                writer.print("loginCertificateNeeded");
                writer.flush();
                writer.close();
            }

            String userID = String.valueOf(((User) (req.getSession().getAttribute("user"))).getId());

            String petID = req.getParameter("petID");

            //日志
            User user = (User) req.getSession().getAttribute("user");
            if (user != null)
                LogService.addCartAction(user.getId(), "ADD", Integer.parseInt(petID));

            CartDaoImpl cartdaoimpl = new CartDaoImpl();
            Cart nowCart = cartdaoimpl.selectByuserID(Integer.parseInt(userID));
            String petsString = nowCart.getPetsID();
            if (petsString.contains(petID)) {
                String[] petsIdAndAmount = petsString.split("#");
                StringBuilder newPetsString = new StringBuilder();
                for (String petIDAndAmount : petsIdAndAmount) {
                    int old_amount = Integer.parseInt((petIDAndAmount.split("@"))[1]);
                    int old_petID = Integer.parseInt(((petIDAndAmount.split("@"))[0]));
                    if (old_petID == Integer.parseInt(petID))
                        old_amount++;
                    newPetsString.append(old_petID).append("@").append(old_amount).append("#");
                }
                nowCart.setPetsID(String.valueOf(newPetsString));
            } else {
                String newPetsString = petsString + petID + "@1#";
                nowCart.setPetsID(newPetsString);
            }
            nowCart.setAmount(nowCart.getAmount() + 1);
            cartdaoimpl.updateCart(nowCart);

            resp.setContentType("text/plain");
            PrintWriter writer = resp.getWriter();
            writer.print("UPDATE SUCCESS");
            writer.flush();
            writer.close();
        }

        //若用户未登录 先进行登录
        if (req.getSession().getAttribute("user") == null) {
            resp.sendRedirect("login");
            return;
            //req.getRequestDispatcher(ForwardUtil.LOGIN_URL).forward(req, resp);
        }

        String userID = String.valueOf(((User) (req.getSession().getAttribute("user"))).getId());

        //如果是删除操作
        if (action.equals("delete-from-cart")) {
            System.out.println(req.getQueryString());
            //先更改数据库
            List<Pet> cartList = new ArrayList<>();
            String petIDToDelete = req.getParameter("petID");

            //日志
            User user = (User) req.getSession().getAttribute("user");
            if (user != null)
                LogService.addCartAction(user.getId(), "DELETE", Integer.parseInt(petIDToDelete));

            CartDaoImpl cartdaoimpl = new CartDaoImpl();

            Cart oldCart = cartdaoimpl.selectByuserID(Integer.parseInt(userID));
            String oldPetsString = oldCart.getPetsID();

            String[] oldPetsArray = oldPetsString.split("#");
            int deleteAmount = 0;
            StringBuilder newPetsString = new StringBuilder();
            for (String s : oldPetsArray) {
                if ((s.split("@"))[0].equals(petIDToDelete))
                    deleteAmount = Integer.parseInt((s.split("@"))[1]);
                else {
                    newPetsString.append(s).append("#");
                }
            }
            assert user != null;
            cartdaoimpl.updateCart(new Cart(user.getId(), newPetsString.toString(), oldCart.getAmount() - deleteAmount));
            resp.setContentType("text/plain");
            PrintWriter writer = resp.getWriter();
            writer.print("UPDATE SUCCESS");
            writer.flush();
            writer.close();
        }

        //请求操作 浏览购物车
        if (action.equals("view")) {
            PetDaoImpl petdaoimpl = new PetDaoImpl();
            List<Pet> cartList = new ArrayList<>();
            CartDaoImpl cartdaoimpl = new CartDaoImpl();
            Cart nowCart = cartdaoimpl.selectByuserID(Integer.parseInt(userID));
            String petString = nowCart.getPetsID();

            if (!petString.equals("")) {
                String[] petsIdAndAmount = petString.split("#");
                for (String petIDAndAmount : petsIdAndAmount) {
                    int amount = Integer.parseInt((petIDAndAmount.split("@"))[1]);
                    int petID = Integer.parseInt(((petIDAndAmount.split("@"))[0]));
                    Pet newPet = petdaoimpl.selectById(petID);
                    newPet.setAmount(amount);
                    cartList.add(newPet);
                }
            }
            req.getSession().setAttribute("cartList", cartList);
            req.getSession().setAttribute("cartAmount", nowCart.getAmount());
            req.getRequestDispatcher(ForwardUtil.CART_URL).forward(req, resp);
        }

        if (action.equals("update")) {
            String newCartData = req.getParameter("data");
            String[] petsString = newCartData.split("#");
            int count = 0;
            for (String s : petsString) {
                count += Integer.parseInt((s.split("@"))[1]);
            }
            CartDaoImpl cartdaoimpl = new CartDaoImpl();
            cartdaoimpl.updateCart(new Cart(Integer.parseInt(userID), newCartData, count));
            resp.setContentType("text/plain");
            PrintWriter writer = resp.getWriter();
            writer.print("UPDATE SUCCESS");
            writer.flush();
            writer.close();
        }
    }
}
