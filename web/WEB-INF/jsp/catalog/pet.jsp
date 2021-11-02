<%--
  Created by IntelliJ IDEA.
  User: 11957
  Date: 2021/11/1
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/IncludeTop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<div class="mainContent">
    <c:if test="${sessionScope.petList.size() != 0}">
        <table class="table table-striped table-bordered table-hover table-condensed">
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
                        <td><a href="cart?action=add-to-cart&petID=${pet.petID}&projectName=${pet.product}">加入购物车</a>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${sessionScope.petList.size() == 0}">
        <center><h3>没有这种宠物呢！！！好奇怪啊啊啊啊</h3></center>
    </c:if>
</div>
</body>
</html>
