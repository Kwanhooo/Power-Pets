<%--
  Author: Kwanho
  Date: 2021/10/8
  Time: 10:33
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>夏季八写 - 登录成功</title>
</head>
<body>
<center>
    <h1>登录成功</h1>
    <%
        if (session.getAttribute("username") != null)
            out.println("<h3>你好呀，" + session.getAttribute("username") + "</h3>");
        else {
            session.setAttribute("login_error_msg", "您尚未登录，请先登录再进行访问！");
            response.sendRedirect("login.jsp");
        }
    %>
</center>
</body>
</html>
