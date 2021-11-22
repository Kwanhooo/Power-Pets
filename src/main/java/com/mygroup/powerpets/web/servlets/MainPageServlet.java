package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.domain.Cart;
import com.mygroup.powerpets.domain.OngoingOrder;
import com.mygroup.powerpets.domain.Pet;
import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.persistence.impl.CartDaoImpl;
import com.mygroup.powerpets.persistence.impl.OngoingOrderDaoImpl;
import com.mygroup.powerpets.persistence.impl.PetDaoImpl;
import com.mygroup.powerpets.persistence.impl.UserDaoImpl;
import com.mygroup.powerpets.service.LogService;
import com.mygroup.powerpets.service.MyStatisticsService;
import com.mygroup.powerpets.util.ForwardUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class MainPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("action") == null) {

            //返回各种统计信息
            req.getSession().setAttribute("userAmount", String.valueOf(MyStatisticsService.getUserAmount()));
            req.getSession().setAttribute("itemsAmount", String.valueOf(MyStatisticsService.getItemsAmount()));
            req.getSession().setAttribute("dogsAmount", String.valueOf(MyStatisticsService.getDogsAmount()));
            req.getSession().setAttribute("catsAmount", String.valueOf(MyStatisticsService.getCatsAmount()));
            req.getSession().setAttribute("birdsAmount", String.valueOf(MyStatisticsService.getBirdsAmount()));
            req.getSession().setAttribute("pigsAmount", String.valueOf(MyStatisticsService.getPigsAmount()));
            req.getSession().setAttribute("othersAmount", String.valueOf(MyStatisticsService.getOthersAmount()));

            req.getRequestDispatcher(ForwardUtil.MAIN_URL).forward(req, resp);
            return;
        }
        if (req.getParameter("action").equals("newMain")) {
            int petId = Integer.parseInt(req.getParameter("petId"));
            // System.out.println(petId+"woshi");
            PetDaoImpl petDaoImpl = new PetDaoImpl();
            Pet pet = petDaoImpl.selectById(petId);
            if (pet != null) {
                //  System.out.println("nijaoya5555");
                pet.setStatus(0);
                petDaoImpl.updateUser(pet);
            }
            User user = (User) req.getSession().getAttribute("user");
            user.setBalance(user.getBalance().subtract(pet.getPrice()));
            UserDaoImpl userDaoImpl = new UserDaoImpl();
            userDaoImpl.updateUser(user);
            CartDaoImpl cartDaoImpl = new CartDaoImpl();
            Cart cart = cartDaoImpl.selectByuserID(user.getId());
            String petId1 = cart.getPetsID();
            String[] petIdList = petId1.split("#");
            StringBuffer stringBuffer = new StringBuffer();
            for (String s : petIdList) {
                if (!String.valueOf(petId).equals(s)) {
                    stringBuffer.append(s + "#");
                }
            }
            cart.setPetsID(stringBuffer.toString());
            cartDaoImpl.updateCart(cart);

            OngoingOrderDaoImpl od = new OngoingOrderDaoImpl();
            OngoingOrder on = new OngoingOrder(user.getId(), petId, pet.getPrice());
            od.insertOngoingOrder(on);

            List<OngoingOrder> listON = od.selectByuserID(user.getId());
            System.out.println(listON.toString());
            LogService.addOrderGenerated(user.getId(), listON.get(listON.size() - 2).getOrderID());


            req.getRequestDispatcher(ForwardUtil.MAIN_URL).forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //搜索函数
        //带上结果List转发到搜索结果页

        /*
         * @change 改动keywords
         * @author Kwanho
         * @reason 解决乱码
         */
        String keywords = new String(req.getParameter("keywords").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);

        PetDaoImpl petDaoImpl = new PetDaoImpl();
        List<Pet> petList = new ArrayList<>();//将要返回的结果

        List<Pet> petListSelectByProjectName = petDaoImpl.vagueSelectByProjectName(keywords);
        List<Pet> petListSelectByName = petDaoImpl.vagueSelectByName(keywords);

        boolean notHaveLetter = true;
        //先判断是否为纯数字序列
        for (int i = 0; i < keywords.length(); i++) {
            if (keywords.charAt(i) > '9' || keywords.charAt(i) < '0') {
                notHaveLetter = false;
                break;
            }
        }

        //如果是id
        if (notHaveLetter) {
            if (petDaoImpl.selectById(Integer.parseInt(keywords)) != null) {
                petList.add(petDaoImpl.selectById(Integer.parseInt(keywords)));
            }
        }
        //如果是名字
        if (petListSelectByName.size() > 0) {
            for (int i = 0; i <= petListSelectByName.size() - 1; i++) {
                petList.add(petListSelectByName.get(i));
            }
        }
        //如果是品种
        if (petListSelectByProjectName.size() > 0)
            for (int i = 0; i <= petListSelectByProjectName.size() - 1; i++) {
                petList.add(petListSelectByProjectName.get(i));
            }
        req.getSession().setAttribute("resultList", petList);
        req.getRequestDispatcher(ForwardUtil.SEARCH_URL).forward(req, resp);
    }
}
