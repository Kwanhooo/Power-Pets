<%--
  Created by IntelliJ IDEA.
  User: mxs
  Date: 2021/10/31
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/IncludeTop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
</head>
<body>
<div class="mainContent">
    <c:forEach var="project" items="${sessionScope.projectList}">
        <h3>
            <a href="project?projectName=${project.projectName}"><c:out value="${project.projectName}"></c:out></a>
        </h3>
        <p class="projectDescription"><c:out value="${project.projectDescription}"></c:out></p>
        <hr>
    </c:forEach>
</div>
</body>
</html>