<%@ page import="java.util.List" %>
<%@ page import="com.mygroup.powerpets.domain.Pet" %><%--
  Created by IntelliJ IDEA.
  User: 11957
  Date: 2021/11/1
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/pet.css" rel="stylesheet">
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
        <div id="petContent">
            <div class="mask hide">

                <div class="prompt_box">
                    <div class="prompt_cont">
                        <p class="prompt_text" style="font-size: 21px;">成功加入购物车啦，再去挑点别的吧！</p>
                        <button class="btn-OK btn btn-primary" style="margin-left: 340px;">好</button>
                    </div>
                </div>
            </div>
            <%
                List<Pet> petList = (List<Pet>) session.getAttribute("petList");
                boolean isEmpty = true;
                if (petList.size() > 0) {
                    for (Pet pet : petList) {
                        if (pet.getStatus() == 1) {
                            isEmpty = false;
                            break;
                        }
                    }
                }
                if (isEmpty)
                    session.setAttribute("isEmpty", "true");
                else
                    session.setAttribute("isEmpty", "false");
            %>
            <c:if test="${sessionScope.isEmpty == \"false\"}">
                <table class="table table-bordered table-hover table-striped"
                       style="margin: 0 auto;max-width:1600px;text-align: center;">

                    <thead>
                    <tr style="font-size:35px;">
                        <th>宠物编号</th>
                        <th>名字</th>
                        <th>年龄</th>
                        <th>性别</th>
                        <th>价格</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <c:forEach var="pet" items="${sessionScope.petList}">
                    <c:if test="${pet.status == \"1\"}">
                    <tbody>
                    <tr>
                        <td class="pet_id" style="padding:30px 0;max-height: 130px;">${pet.petID}</td>
                        <td style="padding:30px 0;max-height: 130px;">${pet.petName}</td>
                        <td style="padding:30px 0;max-height: 130px;">${pet.age}</td>
                        <td style="padding:30px 0;max-height: 130px;">${pet.sex}</td>
                        <td style="padding:30px 0;max-height: 130px;">${pet.price}</td>
                        <td style="padding:30px 0;max-height: 130px;">
                                <%--                            <a href="cart?action=add-to-cart&petID=${pet.petID}&projectName=${pet.product}&userID=${sessionScope.user.id}">--%>
                            <button type="button" class="add-to-cart-btn btn btn-primary btn-lg btn-block">
                                加入购物车
                            </button>
                                <%--                            </a>--%>
                        </td>
                    </tr>
                    </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${sessionScope.isEmpty == \"true\"}">
                <center><h3>这些都被抢光啦，晚点再来吧！！!</h3></center>
            </c:if>
        </div>
    </div>
</div>

<script type="text/javascript" src="static/js/pet.js"></script>

<%@ include file="../common/bottom.jsp" %>
