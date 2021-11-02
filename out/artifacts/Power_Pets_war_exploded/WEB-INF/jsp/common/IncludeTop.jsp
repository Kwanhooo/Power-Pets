<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <link rel="StyleSheet" href="static/css/head.css" type="text/css" media="screen"/>
    <link href="https://cdn.bootcdn.net/ajax/libs/bootstrap-table/1.18.3/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <meta name="generator" content="HTML Tidy for Linux/x86 (vers 1st November 2002), see www.w3.org"/>
    <title>PowerPets - 电力宠物</title>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
    <meta http-equiv="Cache-Control" content="max-age=0"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT"/>
    <meta http-equiv="Pragma" content="no-cache"/>
</head>

<body>
<div class="wrapper">
    <div class="topBar">
        <div class="Logo">
            <a href="main"><img width="175px" height="175px" align="middle" src="static/images/PageLogo.png"
                                alt="logo"/></a>
        </div>

        <div class="MenuContent">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="cart?action=view">
                🛒
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
                    <a href="login?action=sign-out">注销</a>
                    <img align="middle" src="static/images/separator.gif"/>
                    <a href="account">我的</a>
                </c:if>
            </c:if> <img align="middle" src="static/images/separator.gif"/>
            <a href="help.html">?</a>
        </div>

        <div class="Title">
            <p id="title-text">&nbsp;&nbsp;&nbsp;Power-Pets</p>
        </div>
        <div class="Search">
            <form action="main" method="post">
                <label>
                    <input type="text" name="keywords">
                    <input type="submit" value="🔍">
                </label>
            </form>
        </div>

        <div class="QuickLinks">
            <div id="QuickLinks-text">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="category?categoryName=DOGS">
                    <%--                <img src="static/images/sm_fish.gif"/>--%>
                    看狗狗
                </a>

                <img src="static/images/separator.gif"/>

                <a href="category?categoryName=CATS">
                    <%--                <img src="static/images/sm_dogs.gif"/>--%>
                    看猫猫
                </a>

                <img src="static/images/separator.gif"/>

                <a href="category?categoryName=BIRDS">
                    <%--                <img src="static/images/sm_reptiles.gif"/>--%>
                    看鸟鸟
                </a>

                <img src="static/images/separator.gif"/>

                <a href="category?categoryName=PIG">
                    <%--                <img src="static/images/sm_cats.gif"/>--%>
                    看猪猪
                </a>

                <img src="static/images/separator.gif"/>

                <a href="category?categoryName=OTHERS">
                    <%--                <img src="static/images/sm_birds.gif"/>--%>
                    看点别的
                </a>
            </div>
        </div>
    </div>
</div>

<%--<div id="Content"><stripes:messages/></div>--%>