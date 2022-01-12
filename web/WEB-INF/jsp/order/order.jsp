<%@ page import="com.mygroup.powerpets.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: mxs
  Date: 2021/11/3
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/header.jsp" %>
<html>
<head>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="content" style="margin-top:50px;">
    <div class="navigator">
        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-home" onclick="window.location.href ='main'">
                <img src="static/images/home.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>

        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-home" onclick="window.location.href ='account?action=view'">
                <img src="static/images/me.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>

        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-home"
                    onclick="window.location.href ='cart?action=view&userID=${sessionScope.user.id}'">
                <img src="static/images/cart.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>
        <hr style="width:40px;margin-top: 20px;">
        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-dog"
                    onclick="window.location.href ='category?categoryName=DOGS'">
                <img src="static/images/dog.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>
        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-cat"
                    onclick="window.location.href ='category?categoryName=CATS'">
                <img src="static/images/cat.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>
        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-bird"
                    onclick="window.location.href ='category?categoryName=BIRDS'">
                <img src="static/images/bird.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>
        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-pig" onclick="window.location.href ='category?categoryName=PIG'">
                <img src="static/images/pig.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>
        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-others"
                    onclick="window.location.href ='category?categoryName=OTHERS'">
                <img src="static/images/others.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>
    </div>
    <div class="mainContent">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="page-header">
                        <h1 class="text-primary">
                            带走爱宠
                            <small>&nbsp;&nbsp;-&nbsp;把你最爱的电力宠物带回家！<strong><i>${sessionScope.user.username}</i></strong></small>
                        </h1>
                        <i style="font-size:18px;color: grey;">您正在创建订单&nbsp;<strong><span id="category-span"
                                                                                          style="right: 50px;font-size:20px;color: grey;"></span></strong></i>
                    </div>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-md-8 column">
                    <div class="order">
                        <div class="orderPetList" style="font-size:25px">
                            <h1 class="text-info">您的订单</h1><br>
                            <div style="margin-left: 50px;">
                                <p>宠物名字: <%out.print(request.getSession().getAttribute("orderPetName"));%>&nbsp;&nbsp;&nbsp;
                                    ID: <%out.print(request.getSession().getAttribute("orderPetID"));%></p>
                                <p>性别: <%out.print(request.getSession().getAttribute("orderPetSex"));%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    年龄: <%out.print(request.getSession().getAttribute("orderPetAge"));%></p>
                                <p>种类: <%out.print(request.getSession().getAttribute("orderPetProduct"));%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    价格: <%out.print(request.getSession().getAttribute("orderPetPrice"));%></p>
                                <br>
                            </div>
                        </div>
                        <div class="orderUserList" style="font-size:25px;margin-left: 50px;">
                            <%
                                String[] addressStr = ((User) session.getAttribute("user")).getAddress().split("#");

                                String consignee = addressStr[0];

                                String city = addressStr[1];

                                String address = addressStr[2];
                                String contact = addressStr[3];
                                out.print("收货人&nbsp;&nbsp;&nbsp;&nbsp;");
                                out.print("<input type=\"text\" name=\"consignee\" value=\"");
                                out.print(consignee);
                                out.print("\"><br><br>");
                                out.print("省市地址 ");
                                out.print("<input type=\"text\" name=\"city\" value=\"");
                                out.print(city);
                                out.print("\"><br><br>");
                                out.print("详细地址 ");
                                out.print("<input type=\"text\" name=\"address\" value=\"");
                                out.print(address);
                                out.print("\"><br><br>");
                                out.print("联系方式 ");
                                out.print("<input type=\"text\" name=\"contact\" value=\"");
                                out.print(contact);
                                out.print("\"><br>");
                            %>
                        </div>
                        <br><br>
                        <div class="orderSubButton">
                            <%
                                String str = (String) request.getSession().getAttribute("orderPetName");
                                if (Integer.valueOf(1) == request.getSession().getAttribute("orderCanBuy")) {
                                    out.println("<a href='main?action=newMain&petId=" + request.getSession().getAttribute("orderPetID") + "'><button class=\"btn btn-primary btn-lg\" style=\"margin-left: 50px;width:420px;\">把我领回家吧!</button></a>");
                                } else out.println("<button>呜呜余额不够呢</button>");
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
