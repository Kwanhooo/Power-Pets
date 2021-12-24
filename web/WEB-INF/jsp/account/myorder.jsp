<%@ page import="com.mygroup.powerpets.persistence.impl.PetDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: 11957
  Date: 2021/11/7
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
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
                            我的订单
                            <small>&nbsp;&nbsp;-&nbsp;关心你的宠物！<strong><i>${sessionScope.user.username}</i></strong></small>
                        </h1>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <c:if test="${sessionScope.ongoingOrderList.size() != 0 && sessionScope.ongoingOrderList != null}">
                    <table class="table table-bordered">
                        <thead>
                        <tr style="font-size:35px">
                            <th>
                                订单号
                            </th>
                            <th>
                                健康保障号
                            </th>
                            <th>
                                价格
                            </th>
                            <th>
                                快递单号
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${sessionScope.ongoingOrderList}">
                            <tr class="info" style="font-size:30px">
                                <td>
                                        ${order.orderID}
                                </td>
                                <td>
                                        ${order.petID}
                                </td>
                                <td>
                                        ${order.cost}
                                </td>
                                <td>
                                        ${order.deliveryID}
                                </td>
                            </tr>
                        </c:forEach>
                        </c:if>

                        <c:if test="${sessionScope.ongoingOrderList.size() == 0 || sessionScope.ongoingOrderList == null}">
                            <br><br>
                            <center><h3 class="text-danger">您还没有订单呢！</h3></center>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
