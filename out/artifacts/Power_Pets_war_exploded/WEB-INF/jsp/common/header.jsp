<%--
  Created by IntelliJ IDEA.
  User: Kwanho
  Date: 2021/11/19
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="Bookmark" type="image/png" href="static/images/PageLogo.png"/>
    <link rel="icon" type="image/png" href="static/images/PageLogo.png"/>
    <link rel="shortcut icon" type="image/png" href="static/images/PageLogo.png"/>

    <!-- CSS引入 -->
    <link rel="stylesheet" href="static/css/powerpets.css"/>

    <%-- Javascript引入 --%>
    <%-- jqurey --%>
    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script>
        var xhr;

        function search(word) {
            // console.log(word);
            var searchText = word;
            xhr = new XMLHttpRequest();
            xhr.onreadystatechange = process;
            xhr.open("GET", "main?action=searchAction&searchText=" + searchText, true);
            xhr.send(null);
        }

        function process() {
            // console.log("113");
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    // console.log("114");

                    var $deleteli = $('li');
                    $deleteli.remove();

                    var msg = xhr.responseText;
                    // console.log("msg" + msg);
                    // console.log(msg.length);
                    if (msg.length < 1) {
                        // console.log("xiaoyu1")
                        var $newul = $('<li>没有这样的宠物呢</li>');
                        $('ul').append($newul);
                    } else {
                        // console.log("dayuyi")
                        var pro = "";
                        for (i = 0; i <= msg.length - 1; i++) {
                            if (msg.charAt(i) == '*') {
                                var $newul = $('<li>' + pro + '</li>');
                                $('ul').append($newul);
                                pro = "";
                            } else {
                                pro = pro + msg.charAt(i);
                            }
                        }

                        $("#Search-Automatic-Completion").show();

                        $(function () {
                            var $listItems = $('li');
                            var $ulItem = $('ul');
                            $listItems.on('click', function () {
                                // console.log("haha");
                                document.getElementById("search-keywords").value = this.innerHTML;
                                // $ulItem.hidden;
                                $("#Search-Automatic-Completion").hide();
                            });
                        });
                    }
                }
            }
        }

        $(function () {
            var $listItems = $('li');
            $listItems.on('click', function () {
                // console.log("haha");
                document.getElementById("search-keywords").value = this.innerHTML;
            });
        });
    </script>

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
                        <input type="text" name="keywords" id="search-keywords" value="" class="keywords"
                               placeholder="在此处搜索您想要的宠物……" onkeyup="search(this.value);">
                        <input type="submit" value="🔍" id="searchBtn">
                    </label>
                </form>
            </div>
            <div class="Search-Automatic-Completion" id="Search-Automatic-Completion">
                <ul class="ul" id="ul">
                </ul>
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
                <a href="https://github.com/Kwanhooo/Power-Pets">?</a>
            </div>
        </div>
    </div>