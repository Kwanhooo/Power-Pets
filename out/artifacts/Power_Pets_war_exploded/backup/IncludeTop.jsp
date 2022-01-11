<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta name="generator"
          content="HTML Tidy for Linux/x86 (vers 1st November 2002), see www.w3.org"/>
    <title>PowerPets - 电力宠物</title>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
    <meta http-equiv="Cache-Control" content="max-age=0"/>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT"/>
    <meta http-equiv="Pragma" content="no-cache"/>
</head>

<body>
<div id="Header">

    <div id="Logo">
        <div id="LogoContent">
            <a href="main"><img src="static/images/logo-topbar.gif" alt="logo"/></a>
        </div>
    </div>

    <div id="Menu">
        <div id="MenuContent">
            <a href="cart">
                <img align="middle" name="img_cart" src="static/images/cart.gif"/>
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
            <a href="https://github.com/Kwanhooo/Power-Pets">?</a></div>
    </div>

    <div id="Search">
        <div id="SearchContent">
            <form action="main" method="post">
                <label>
                    <input type="text" name="keywords">
                    <input type="submit" value="🔍">
                </label>
            </form>
        </div>
    </div>

    <div id="QuickLinks">
        <a href="category?categoryId=FISH"><img src="static/images/sm_fish.gif"/></a>
        <img src="static/images/separator.gif"/>

        <a href="category?categoryId=FISH"><img src="static/images/sm_dogs.gif"/></a>
        <img src="static/images/separator.gif"/>

        <a href="category?categoryId=REPTILES"><img src="static/images/sm_reptiles.gif"/></a>
        <img src="static/images/separator.gif"/>

        <a href="category?categoryId=CATS"><img src="static/images/sm_cats.gif"/></a>
        <img src="static/images/separator.gif"/>

        <a href="category?categoryId=BIRDS"><img src="static/images/sm_birds.gif"/></a>
    </div>
</div>