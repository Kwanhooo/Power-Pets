<%--
  Created by IntelliJ IDEA.
  User: mxs
  Date: 2021/10/31
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    out.println(session.getAttribute("selectedCategory"));
%>
</body>
</html>