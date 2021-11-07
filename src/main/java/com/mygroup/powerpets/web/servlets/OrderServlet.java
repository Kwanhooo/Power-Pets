package com.mygroup.powerpets.web.servlets;

import com.mygroup.powerpets.domain.Pet;
import com.mygroup.powerpets.domain.User;
import com.mygroup.powerpets.persistence.impl.PetDaoImpl;
import com.mygroup.powerpets.persistence.impl.UserDaoImpl;
import com.mygroup.powerpets.util.ForwardUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;

public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String petID1 = req.getParameter("orderPetID");
        System.out.println(petID1 + "66666");
        // String userID1 = req.getParameter("userID");
        if (petID1 != null)
            req.getSession().setAttribute("petToBuyInOrder", petID1);

        if (req.getParameter("action") != null) {
            if (req.getParameter("action").equals("checkout")) {
                req.getRequestDispatcher(ForwardUtil.CHECKOUT_URL).forward(req, resp);
                return;
            }
        }

        String petID = (String) req.getSession().getAttribute("petToBuyInOrder");
        String userID = String.valueOf(((User) (req.getSession().getAttribute("user"))).getId());
        System.out.println(petID);
        System.out.println(userID);


        UserDaoImpl userDaoImpl = new UserDaoImpl();
        User user = userDaoImpl.selectById(Integer.parseInt(userID));
        PetDaoImpl petdaoImpl = new PetDaoImpl();
        Pet pet = petdaoImpl.selectById(Integer.parseInt(petID));
        int i = (user.getBalance().subtract(pet.getPrice())).compareTo(BigDecimal.ZERO);
        if (i == -1)
            req.getSession().setAttribute("orderCanBuy", 0);
        else {
            req.getSession().setAttribute("orderCanBuy", 1);
        }

        System.out.println(i);

        req.getSession().setAttribute("orderUserName", user.getUsername());
        req.getSession().setAttribute("orderUserAddress", user.getAddress());
        req.getSession().setAttribute("orderUserBalance", user.getBalance());
        req.getSession().setAttribute("orderPetName", pet.getPetName());
        req.getSession().setAttribute("orderPetID", pet.getPetID());
        req.getSession().setAttribute("orderPetSex", pet.getSex());
        req.getSession().setAttribute("orderPetAge", pet.getAge());
        req.getSession().setAttribute("orderPetPrice", pet.getPrice());
        req.getSession().setAttribute("orderPetCategory", pet.getCategory());
        req.getSession().setAttribute("orderPetStatus", pet.getStatus());
        req.getSession().setAttribute("orderPetProduct", pet.getProduct());

        req.getRequestDispatcher(ForwardUtil.ORDER_URL).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        User oldUser = (User) req.getSession().getAttribute("user");

        String email = req.getParameter("email");
        String consignee = new String(req.getParameter("consignee").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        String city = new String(req.getParameter("city").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        String address = new String(req.getParameter("address").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        String contact = req.getParameter("contact");

        oldUser.setEmail(email);
        oldUser.setAddress(consignee + "#" + city + "#" + address + "#" + contact);

        UserDaoImpl userDaoImpl = new UserDaoImpl();
        userDaoImpl.updateUser(oldUser);

        //我从这里开始复制的
        resp.sendRedirect("order");
    }
}
