<%@ page import="com.mygroup.powerpets.domain.User" %><%--
  Created by IntelliJ IDEA.
  User: mxs
  Date: 2021/11/3
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../common/IncludeTop.jsp" %>
<html>
<head>

</head>
<body>
<div class="mainContent">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-8 column">
                <div class="order">
                    <div class="orderPetList" style="font-size:25px">
                        <h1 class="text-info">订单</h1>
                        <p>宠物姓名: <%out.print(request.getSession().getAttribute("orderPetName"));%>
                            ID: <%out.print(request.getSession().getAttribute("orderPetID"));%></p>
                        <p>性别: <%out.print(request.getSession().getAttribute("orderPetSex"));%>
                            年龄: <%out.print(request.getSession().getAttribute("orderPetAge"));%></p>
                        <p>种类: <%out.print(request.getSession().getAttribute("orderPetProduct"));%>
                            价格: <%out.print(request.getSession().getAttribute("orderPetPrice"));%></p>
                        <br>
                    </div>
                    <div class="orderUserList" style="font-size:25px">
                        <%
                            String[] addressStr = ((User) session.getAttribute("user")).getAddress().split("#");

                            String consignee = addressStr[0];
                            System.out.println(consignee);
                            String city = addressStr[1];
                            System.out.println(city);
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
                            out.print("\"><br><br>");
                        %>
                    </div>
                    <br><br>
                    <div class="orderSubButton">
                        <%
                            String str = (String) request.getSession().getAttribute("orderPetName");
                            if (Integer.valueOf(1) == request.getSession().getAttribute("orderCanBuy")) {
//                 String string =(String)request.getSession().getAttribute("orderPetID");
                                out.println("<a href='main?action=newMain&petId=" + request.getSession().getAttribute("orderPetID") + "'><button class=\"btn btn-primary btn-lg btn-block\">把我领回家吧!</button></a>");
                            } else out.println("<button>呜呜余额不够呢</button>");
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
