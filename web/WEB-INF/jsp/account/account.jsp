<%@ page import="com.mygroup.powerpets.domain.User" %><%--
  Created by IntelliJ IDEA.
  Author: Kwanho
  Date: 2021/11/2
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/address-book.css" rel="stylesheet">

    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="static/js/address-book-account.js"></script>
</head>
<body>
<div class="mask hide">
    <div class="prompt_box">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="tabbable" id="address-book-tabs">
                        <ul class="nav nav-tabs">
                            <div style="float: right;margin-right:455px;">
                                <button class="btn btn-danger btn-OK" style="font-size:25px;height: 50px;width: 50px;">
                                    ×
                                </button>
                            </div>
                        </ul>
                        <div class="tab-content">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="mask-save hide">
    <div class="prompt_box-save">
        <div class="prompt_cont">
            <p class="prompt_text" style="font-size: 24px;margin-left: 70px;margin-top: 60px;">已经修改成功啦！</p>
            <button class="hint-btn-OK btn btn-primary" style="margin-left: 340px;margin-top: 40px;">好</button>
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
        <div class="accountContent">
            <div class="container">
                <form id="account-form">
                    <div class="row clearfix">
                        <div class="col-md-8 column">
                            <h3 style="font-family: var(--font-family-sans-serif);">
                                ⚙ 账号设定
                            </h3>
                            <br>
                            <p>
                                <strong>用户名 😊&nbsp;</strong>
                                <label>
                                    <input id="username-account" type="text" name="username"
                                           value="${sessionScope.user.username}">
                                </label>
                            </p>
                            <p>
                                <strong>密码 🔑&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
                                <label>
                                    <input id="password-account" type="text" name="password"
                                           value="${sessionScope.user.password}">
                                </label>
                            </p>
                            <p>
                                <strong>性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
                                <%
                                    User user = (User) session.getAttribute("user");
                                    if (user.getSex().equals("male")) {
                                        out.println("<input id=\"male-account\" type=\"radio\" name=\"sex\" value=\"male\" checked=\"checked\">\uD83D\uDC68男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
                                        out.println("<input id=\"female-account\"  type=\"radio\" name=\"sex\" value=\"female\">\uD83D\uDC67女");
                                    } else {
                                        out.println("<input id=\"male-account\" type=\"radio\" name=\"sex\" value=\"male\">\uD83D\uDC68男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
                                        out.println("<input id=\"female-account\" type=\"radio\" name=\"sex\" value=\"female\" checked=\"checked\">\uD83D\uDC67女");
                                    }
                                %>
                            </p>
                        </div>
                        <div class="col-md-4 column">
                            <div class="row clearfix">
                                <div class="col-md-12 column">
                                    <br>
                                    <h3 style="font-family: var(--font-family-sans-serif);">
                                        <a href="account?action=view-order" class="">我的订单</a>
                                    </h3>
                                </div>
                            </div>
                            <hr style="width: 160px;margin-left: 0">
                            <div class="row clearfix">
                                <div class="col-md-12 column">
                                    <h3 style="font-family: var(--font-family-sans-serif);">
                                        <a href="account?action=log">我的历史</a>
                                    </h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr style="width: 1000px;margin-left: 0">
                    <div class="row clearfix">
                        <div class="col-md-8 column">
                            <h3 style="font-family: var(--font-family-sans-serif);">
                                📫 默认收货地址
                            </h3>
                            <br>
                            <%
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
                                out.print("<input type=\"text\" name=\"consignee\" value=\"");
                                out.print(consignee);
                                out.print("\"><br><br>");
                                out.print("<strong>省市地址 &nbsp;&nbsp;&nbsp;&nbsp;</strong>");
                                out.print("<input type=\"text\" name=\"city\" value=\"");
                                out.print(city);
                                out.print("\"><br><br>");
                                out.print("<strong>详细地址 &nbsp;&nbsp;&nbsp;&nbsp;</strong>");
                                out.print("<input type=\"text\" name=\"address\" value=\"");
                                out.print(address);
                                out.print("\"><br><br>");
                                out.print("<strong>联系电话 &nbsp;&nbsp;&nbsp;&nbsp;</strong>");
                                out.print("<input type=\"text\" name=\"contact\" value=\"");
                                out.print(contact);
                                out.print("\"><br><br>");
                            %>
                        </div>
                        <div class="col-md-4 column">
                            <h3 style="font-family: var(--font-family-sans-serif);">
                                📱 账户绑定
                            </h3>
                            <br>
                            <%
                                out.println("<p>\n" +
                                        "                        <strong>手机&nbsp;&nbsp;&nbsp;&nbsp;</strong> <input id=\"phone-account\" type=\"text\" name=\"phone\" value=\"" + contact + "\">\n" +
                                        "                    </p>");
                            %>

                            <p>
                                <strong>邮箱&nbsp;&nbsp;&nbsp;&nbsp;</strong>&nbsp;<input id="email-account" type="text"
                                                                                        name="email"
                                                                                        value="${sessionScope.user.email}">
                            </p>
                            <hr style="width:300px;">

                            <h3 style="font-family: var(--font-family-sans-serif);">
                                🔖 地址簿
                            </h3>
                            <br>
                            <button type="button" class="btn btn-lg btn-primary" id="address-book-btn">查阅或修改</button>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-md-12 column">
                            <button id="save-account-info" type="button" class="btn btn-lg btn-danger btn-block"
                                    style="max-width: 90%;margin-top: 10px;">
                                确认修改账户信息
                            </button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
</body>
</html>

<%@ include file="../common/bottom.jsp" %>