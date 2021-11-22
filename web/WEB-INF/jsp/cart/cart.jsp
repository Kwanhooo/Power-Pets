<%--
  Author: Kwanho
  Date: 2021/11/1
  Time: 21:34
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
                <div class="col-md-12 column">
                    <div class="page-header">
                        <h1 class="text-primary">
                            购物车
                            <small>&nbsp;&nbsp;-&nbsp;在此下订吧！<strong><i>${sessionScope.user.username}</i></strong></small>
                        </h1>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <c:if test="${sessionScope.cartList.size() != 0 && sessionScope.cartList != null}">
                    <table class="table table-bordered">
                        <thead>
                        <tr style="font-size:35px">
                            <th>
                                您的选购
                            </th>
                            <th>
                                类别
                            </th>
                            <th>
                                售价
                            </th>
                            <th>
                                操作
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="petToBuy" items="${sessionScope.cartList}">
                            <tr class="info" style="font-size:30px">
                                <td>
                                        ${petToBuy.petName}
                                </td>
                                <td>
                                        ${petToBuy.product}
                                </td>
                                <td>
                                        ${petToBuy.price}
                                </td>
                                <td>
                                    <a href="order?action=checkout&orderPetID=${petToBuy.petID}&userID=${sessionScope.user.id}">
                                        <button type="button" class="btn btn-warning btn-lg btn-block">下单</button>
                                    </a>
                                    <a href="cart?petID=${petToBuy.petID}&userID=${sessionScope.user.id}&action=delete-from-cart">
                                        <button type="button" class="btn btn-danger btn-lg btn-block">删除</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </c:if>

                        <c:if test="${sessionScope.cartList.size() == 0 || sessionScope.cartList == null}">
                            <br><br>
                            <center><h3 class="text-danger">您的购物车空空如也，快去选购吧</h3></center>
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
