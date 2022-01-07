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
                <table class="table table-bordered table-hover">
                    <tr>
                        <th>Pet ID</th>
                        <th>Name</th>
                        <th>age</th>
                        <th>sex</th>
                        <th>price</th>
                        <th>add to Cart</th>
                    </tr>
                    <c:forEach var="pet" items="${sessionScope.petList}">
                        <c:if test="${pet.status == \"1\"}">
                            <tr>
                                <td>${pet.petID}</td>
                                <td>${pet.petName}</td>
                                <td>${pet.age}</td>
                                <td>${pet.sex}</td>
                                <td>${pet.price}</td>
                                <td>
                                    <a href="cart?action=add-to-cart&petID=${pet.petID}&projectName=${pet.product}&userID=${sessionScope.user.id}">
                                        <button type="button" class="btn btn-primary btn-lg btn-block">加入购物车</button>
                                    </a>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </table>
            </c:if>
            <c:if test="${sessionScope.isEmpty == \"true\"}">
                <center><h3>这些都被抢光啦，晚点再来吧！！!</h3></center>
            </c:if>
        </div>
    </div>
</div>
<%@ include file="../common/bottom.jsp" %>
