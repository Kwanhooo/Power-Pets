package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.domain.Cart;
import com.mygroup.powerpets.domain.Pet;
import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.persistence.impl.CartDaoImpl;
import com.mygroup.powerpets.persistence.impl.PetDaoImpl;
import com.mygroup.powerpets.service.LogService;
import com.mygroup.powerpets.util.ForwardUtil;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
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

        //若用户未登录 先进行登录
        if (req.getSession().getAttribute("user") == null) {
            resp.sendRedirect("login");
            return;
            //req.getRequestDispatcher(ForwardUtil.LOGIN_URL).forward(req, resp);
        }

        String userID = String.valueOf(((User) (req.getSession().getAttribute("user"))).getId());

        //请求操作 加入购物车
        //更新购物车数据库
        if (action.equals("add-to-cart")) {
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
                nowCart.setAmount(nowCart.getAmount() + 1);
                cartdaoimpl.updateCart(nowCart);
            } else {
                String newPetsString = petsString + petID + "@1#";
                nowCart.setPetsID(newPetsString);
                nowCart.setAmount(nowCart.getAmount() + 1);
                cartdaoimpl.updateCart(nowCart);
            }

            resp.sendRedirect("project?projectName=" + URLEncoder.encode(req.getParameter("projectName"), "UTF-8"));
            return;
        }

        //如果是删除操作
        if (action.equals("delete-from-cart")) {
            //先更改数据库
            List<Pet> cartList = new ArrayList<>();
            String petID = req.getParameter("petID");

            //日志
            User user = (User) req.getSession().getAttribute("user");
            if (user != null)
                LogService.addCartAction(user.getId(), "DELETE", Integer.parseInt(petID));

            CartDaoImpl cartdaoimpl = new CartDaoImpl();
            PetDaoImpl petdaoimpl = new PetDaoImpl();
            Cart nowCart = cartdaoimpl.selectByuserID(Integer.parseInt(userID));
            String petString = nowCart.getPetsID();
            String[] getPetsID = petString.split("#");
            StringBuilder nowPetsID = new StringBuilder();
            for (String getPetID : getPetsID) {
                if (!getPetID.equals(petID)) {
                    nowPetsID.append(getPetID).append("#");
                    Pet pet = petdaoimpl.selectById(Integer.parseInt(petID));
                    cartList.add(pet);
                }
            }

            Cart newCart = new Cart(Integer.parseInt(userID), nowPetsID.toString(), nowCart.getAmount() - 1);
            cartdaoimpl.updateCart(newCart);
            //再更改显示界面
            req.getSession().setAttribute("cartList", cartList);
            req.getRequestDispatcher(ForwardUtil.CART_URL).forward(req, resp);
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
            req.getRequestDispatcher(ForwardUtil.CART_URL).forward(req, resp);
        }

        if (action.equals("update")) {
            String JSON_str = req.getParameter("data");
            final BASE64Encoder encoder = new BASE64Encoder();
            final BASE64Decoder decoder = new BASE64Decoder();

//            final byte[] textByte = JSON_str.getBytes(StandardCharsets.UTF_8);//编码

            System.out.println(new String(decoder.decodeBuffer(JSON_str), StandardCharsets.UTF_8));


//            URLEncoder.encode(JSON_str, "UTF-8");
//            System.out.println("JSON:::::::::::::::" + URLEncoder.encode(JSON_str, "UTF-8"));
        }
    }

}
