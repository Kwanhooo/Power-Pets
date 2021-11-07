<%@ page import="java.util.List" %>
<%@ page import="com.mygroup.powerpets.domain.Pet" %><%--
  Created by IntelliJ IDEA.
  User: 11957
  Date: 2021/11/1
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/IncludeTop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
</head>
<body>
<div class="mainContent">
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
</body>
</html>
