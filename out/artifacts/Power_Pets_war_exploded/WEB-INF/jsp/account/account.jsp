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
</head>
<body>
<div class="content" style="margin-top:50px;">
<div class="mainContent">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-8 column">
                <form action="account" method="post">
                    <h3 class="text-info">
                        <a href="account?action=view-order">我的订单</a>
                    </h3>
                    <hr>
                    <h3 class="text-info">
                        <a href="account?action=log">我的历史</a>
                    </h3>
                    <hr>
                    <h3 class="text-info">
                        账号设定⚙
                    </h3>
                    <p>
                        <strong>用户名 😊</strong>
                        <label>
                            <input type="text" name="username" value="${sessionScope.user.username}">
                        </label>
                    </p>
                    <p>
                        <strong>密码 🔑&nbsp;&nbsp;&nbsp;&nbsp;</strong>
                        <label>
                            <input type="text" name="password" value="${sessionScope.user.password}">
                        </label>
                    </p>
                    <p>
                        <strong>性别 </strong>
                        <%
                            User user = (User) session.getAttribute("user");
                            if (user.getSex().equals("male")) {
                                System.out.println("sb");
                                out.println("<input type=\"radio\" name=\"sex\" value=\"male\" checked=\"checked\">\uD83D\uDC68Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
                                out.println("<input type=\"radio\" name=\"sex\" value=\"female\">\uD83D\uDC67Female");
                            } else {
                                out.println("<input type=\"radio\" name=\"sex\" value=\"male\">\uD83D\uDC68Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
                                out.println("<input type=\"radio\" name=\"sex\" value=\"female\" checked=\"checked\">\uD83D\uDC67Female");
                            }
                        %>
                    </p>
                    <hr>
                    <h3>
                        收货地址📫
                    </h3>
                        <%
                           String[] addressStr = ((User) session.getAttribute("user")).getAddress().split("#");

                            String consignee = addressStr[0];
                            System.out.println(consignee);
                            String city = addressStr[1];
                            System.out.println(city);
                            String address = addressStr[2];
                            String contact = addressStr[3];
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
                        <button class="btn btn-lg btn-danger btn-block">确认修改</button>
                    </center>
            </div>
            <div class="col-md-4 column">
                <h3>
                    常见问题❓
                </h3><br>
                <h4>
                    帐号与密码
                </h4>
                <ol>
                    <li>
                        为什么要进行二次验证？
                    </li>
                    <li>
                        二次验证的手机/邮箱不可用怎么办？
                    </li>
                    <li>
                        忘记密码怎么办？
                    </li>
                    <li>
                        手机丢失，手机号不可用怎么办？
                    </li>
                    <li>
                        我要绑定的手机号提示我已经注册了，怎么办？
                    </li>
                </ol>
                <h4>
                    其他问题
                </h4>
                <ol>
                    <li>
                        网站出现了问题？问题反馈
                    </li>
                    <li>
                        帐号如何注销？帐号注销
                    </li>
                </ol>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
