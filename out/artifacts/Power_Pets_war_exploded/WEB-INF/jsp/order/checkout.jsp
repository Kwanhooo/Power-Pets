<%@ page import="com.mygroup.powerpets.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: 11957
  Date: 2021/11/7
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/IncludeTop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

</head>
<body>
<div class="mainContent">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-8 column">
                <form action="order" method="post">
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
                        <button class="btn btn-lg btn-danger btn-block">确认信息</button>
                    </center>
            </div>
        </div>
    </div>
</div>
</body>
</html>
