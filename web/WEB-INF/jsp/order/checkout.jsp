<%@ page import="com.mygroup.powerpets.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: Kwanho
  Date: 2021/11/7
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/address-book.css" rel="stylesheet">

    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="static/js/address-book-checkout.js"></script>
</head>
<body>
<div class="mask hide">
    <div class="prompt_box">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="tabbable" id="address-book-tabs">
                        <ul class="nav nav-tabs">
                        </ul>
                        <div class="tab-content">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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
        <div class="checkoutContent" style="">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h1 class="text-primary">
                        带走爱宠
                        <small>&nbsp;&nbsp;-&nbsp;把你最爱的电力宠物带回家！<strong><i>${sessionScope.user.username}</i></strong></small>
                    </h1>
                    <i style="font-size:18px;color: grey;">&nbsp;当前 <strong><span id="category-span"
                                                                                  style="right: 50px;font-size:20px;color: grey;">您正在创建订单</span></strong></i>
                </div>
            </div>

            <form action="order" method="post">
                <div class="row clearfix">
                    <div class="col-md-8 column" style="margin-left: 300px;">
                        <h3 style="font-family: var(--font-family-sans-serif);font-size:35px;">
                            📫 收货地址
                        </h3>
                        <br>
                        <%
                            User user = (User) session.getAttribute("user");
                            String consignee = user.getUsername();
                            String city = "您还没有补全信息呢";
                            String address = user.getAddress();
                            String contact = "您还没有补全信息呢";
                            String[] addressStr = ((User) session.getAttribute("user")).getAddress().split("@")[0].split("#");
                            if (addressStr.length == 4) {
                                consignee = addressStr[0];
                                city = addressStr[1];
                                address = addressStr[2];
                                contact = addressStr[3];
                            }
                            out.print("<strong>收货人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>");
                            out.print("<input id=\"consignee-checkout\" type=\"text\" name=\"consignee\" value=\"");
                            out.print(consignee);
                            out.print("\"><br><br>");
                            out.print("<strong>省市地址 &nbsp;&nbsp;&nbsp;&nbsp;</strong>");
                            out.print("<input id=\"city-checkout\" type=\"text\" name=\"city\" value=\"");
                            out.print(city);
                            out.print("\"><br><br>");
                            out.print("<strong>详细地址 &nbsp;&nbsp;&nbsp;&nbsp;</strong>");
                            out.print("<input id=\"address-checkout\" type=\"text\" name=\"address\" value=\"");
                            out.print(address);
                            out.print("\"><br><br>");
                            out.print("<strong>联系电话 &nbsp;&nbsp;&nbsp;&nbsp;</strong>");
                            out.print("<input id=\"contact-checkout\" type=\"text\" name=\"contact\" value=\"");
                            out.print(contact);
                            out.print("\"><br><br>");
                        %>
                    </div>
                    <div class="row clearfix">
                        <div class="col-md-8 column">
                            <button type="submit" class="btn btn-lg btn-danger "
                                    style="width:400px;margin-top: 10px;margin-left:300px;">
                                确认下单
                            </button>
                        </div>
                    </div>

                    <div style="position:fixed;top:400px;right: 400px;background-color:#eeeeee;border-radius:30px;width: 470px;height:250px;">
                        <h3 class="text-warning" style="font-size:30px;margin-left: 10px;">不是寄送到这里？在这里切换！</h3>
                        <h3 style="font-family: var(--font-family-sans-serif);margin-left: 20px;font-size:30px;">
                            🔖 地址簿
                        </h3>
                        <br>
                        <button type="button" class="btn btn-lg btn-primary" id="address-book-checkout-btn"
                                style="margin-left: 20px;width:200px;">选取你的地址
                        </button>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
