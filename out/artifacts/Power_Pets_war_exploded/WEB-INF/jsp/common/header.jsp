<%--
  Created by IntelliJ IDEA.
  User: Kwanho
  Date: 2021/11/19
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>


    <!-- CSS引入 -->
    <link rel="stylesheet" href="static/css/powerpets.css"/>

    <%-- Javascript引入 --%>
    <%-- jqurey --%>
    <script type="text/javascript" src="static/js/jquery.min.js"></script>

    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>电力宠物 - PowerPets</title>
</head>
<body>
<div class="wrapper">
    <div class="topBar">
        <div class="topBar-left">
            <div class="Logo">
                <a href="main" style="margin-top:42px;"><img width="70px" height="70px" align="middle"
                                                             src="static/images/PageLogo.png"
                                                             alt="logo"/></a>
            </div>

            <div class="Title">
                <h1 id="title-text" style="font-size:32px;font-weight:bold;margin-top:27px;">Power-Pets</h1>
            </div>

            <div class="Search">
                <form action="main" method="post">
                    <label>
                        <input type="text" name="keywords" class="keywords" placeholder="在此处搜索您想要的宠物……">
                        <input type="submit" value="🔍" id="searchBtn">
                    </label>
                </form>
            </div>
        </div>
        <div class="topBar-right">
            <div class="MenuContent">
                <a href="cart?action=view&userID=${sessionScope.user.id}">
                    <text style="font-family: var(--font-family-sans-serif);">🛒</text>
                </a>
                <img align="middle" src="static/images/separator.gif"/>
                <c:if test="${sessionScope.user == null}">
                    <a href="login">登录</a>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <c:if test="${sessionScope.isLogin.equals(\"false\")||sessionScope.isLogin == null}">
                        <a href="login">登录</a>
                    </c:if>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <c:if test="${sessionScope.isLogin.equals(\"true\")}">
                        <a href="account?action=sign-out">
                            <text style="color:var(--danger);">注销</text>
                        </a>
                        <img align="middle" src="static/images/separator.gif"/>
                        <a href="account?action=view">${sessionScope.user.username}</a>
                    </c:if>
                </c:if> <img align="middle" src="static/images/separator.gif"/>
                <a href="help.html">?</a>
            </div>
        </div>
    </div>