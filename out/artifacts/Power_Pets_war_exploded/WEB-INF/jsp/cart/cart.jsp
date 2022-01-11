<%@ page import="com.mygroup.powerpets.domain.User" %><%--
  Author: Kwanho
  Date: 2021/11/1
  Time: 21:34
--%>
<%@ include file="../common/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <%--    <script type="text/javascript" src="static/js/jquery.min.js"></script>--%>
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
        <div class="cartContent">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="page-header">
                        <h1 class="text-primary" style="max-width: 600px;">
                            购物车
                            <small>&nbsp;&nbsp;-&nbsp;在此下订吧！<strong><i>${sessionScope.user.username}</i></strong></small>
                        </h1>
                        <span style="right: 50px;"><i>共 <strong>${sessionScope.cartAmount}</strong> 件</i></span>
                    </div>
                </div>
            </div>
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <c:if test="${sessionScope.cartList.size() != 0 && sessionScope.cartList != null}">
                    <table class="table table-bordered table-hover table-striped" id="cart-table"
                           style="margin: 0 auto;max-width:1600px;text-align: center;">
                        <thead>
                        <tr style="font-size:35px;">
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
                                数量
                            </th>
                            <th>
                                总价
                            </th>
                            <th>
                                操作
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="petToBuy" items="${sessionScope.cartList}">
                            <tr style="font-size:30px;padding:70px 0;" id="${petToBuy.petID}">
                                <td style="padding:30px 0;max-height: 130px;">
                                        ${petToBuy.petName}
                                </td>
                                <td style="padding:30px 0;max-height: 130px;">
                                        ${petToBuy.product}
                                </td>
                                <td style="padding:30px 0;max-height: 130px;">
                                        ${petToBuy.price}
                                </td>
                                <td style="padding:25px 0;max-height: 130px;">
                                    <div class="container input-counter" style="width: 200px;">
                                        <div class="row clearfix">
                                            <div class="col-md-3 column div-add">
                                                <button type="button" class="btn-add btn btn-primary"
                                                        style="margin-top: 10px;">
                                                    <text class="fa fa-plus">+</text>
                                                </button>
                                            </div>
                                            <div class="col-md-6 column">
                                                <label>
                                                    <input style="width:80px;margin-top: 11px;"
                                                           value="${petToBuy.amount}" type="text"
                                                           class="form-control counter"
                                                           data-min="0" data-max="100" data-default="1"
                                                           style="margin-top: 30px;">
                                                </label>
                                            </div>
                                            <div class="col-md-3 column div-minus">
                                                <button type="button" class="btn-subtract btn btn-primary"
                                                        style="margin-top: 10px;">
                                                    <text class="fa fa-minus">-</text>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td style="padding:30px 0;max-height: 130px;">
                                </td>
                                <td style="max-height: 130px;">
                                    <a href="order?action=checkout&orderPetID=${petToBuy.petID}&userID=${sessionScope.user.id}">
                                        <button type="button" class="btn btn-warning btn-lg btn-block">下单</button>
                                    </a>
                                    <button type="button" class="btn btn-danger btn-lg btn-block">删除</button>
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

<script type="text/javascript" src="static/js/cart.js"></script>

<%@ include file="../common/bottom.jsp" %>