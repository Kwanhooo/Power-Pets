<%@ page import="com.mygroup.powerpets.domain.User" %>
<%@ include file="../common/header.jsp" %>

<%--
  Created by IntelliJ IDEA.
  User: mxs
  Date: 2021/11/1
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

</head>
<body>
<%
    //out.println(request.getSession().getAttribute("petList"));
%>
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
        <div class="petList">
            <table class="table table-striped table-bordered table-hover table-condensed">
                <tr>
                    <th>ID</th>
                    <th>名字</th>
                    <th>年龄</th>
                    <th>性别</th>
                    <th>种类</th>
                    <th>品种</th>
                    <th>价格</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="pet" items="${sessionScope.resultList}">
                <tr>
                    <td>${pet.petID}</td>
                    <td>${pet.petName}</td>
                    <td>${pet.age}</td>
                    <td>${pet.sex}</td>
                    <td>${pet.category}</td>
                    <td>${pet.product}</td>
                    <td>${pet.price}</td>
                    <td>
                        <a href="cart?action=add-to-cart&petID=${pet.petID}&projectName=${pet.product}&userID=${sessionScope.user.id}">
                            <button type="button" class="btn btn-primary btn-lg btn-block">加入购物车</button>
                        </a>
                    </td>
                </tr>
                </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
