<%@ include file="../common/IncludeTop.jsp" %>

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
</body>
</html>
