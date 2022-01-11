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
        <div class="checkoutContent">
            <div class="row clearfix">
                <div class="col-md-8 column">
                    <form action="order" method="post">
                        <h3>
                            收货地址📫
                        </h3>
                            <%
                           String[] addressStr = ((User) session.getAttribute("user")).getAddress().split("#");
                            User user = (User) session.getAttribute("user");
                           String consignee = user.getUsername();
                                String city = "您还没有补全信息呢";
                                String address = user.getAddress();
                                String contact = "您还没有补全信息呢";
                            if(addressStr.length == 4) {
                                 consignee = addressStr[0];
                                 city = addressStr[1];
                                 address = addressStr[2];
                                 contact = addressStr[3];
                            }
                            out.print("收货人&nbsp;&nbsp;&nbsp;&nbsp;");out.print("<input type=\"text\" name=\"consignee\" value=\"");out.print(consignee);out.print("\"><br><br>");
                            out.print("省市地址 ");out.print("<input type=\"text\" name=\"city\" value=\"");out.print(city);out.print("\"><br><br>");
                            out.print("详细地址 ");out.print("<input type=\"text\" name=\"address\" value=\"");out.print(address);out.print("\"><br><br>");
                            out.print("联系方式 ");out.print("<input type=\"text\" name=\"contact\" value=\"");out.print(contact);out.print("\"><br><br>");
                        %>
                        <hr>
                        <h3>
                            联系方式📱
                        </h3>
                            <%
                        out.println("<p>\n" +
"                        <strong>手机</strong> <input type=\"text\" name=\"phone\" value=\""+contact+"\">\n" +
"                    </p>");
                    %>

                        <p>
                            <strong>邮箱</strong>&nbsp;<input type="text" name="email" value="${sessionScope.user.email}">
                        </p>
                        <center>
                            <button class="btn btn-lg btn-danger btn-block">确认信息</button>
                        </center>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
