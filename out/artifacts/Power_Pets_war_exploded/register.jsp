<%--
  User: Kwanho
  Date: 2021/10/29
  Time: 15:09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="Zh-CN">
<head>
    <meta charset="utf-8">
    <title>登录 - 电力宠物</title>
    <!-- Link CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/prismjs@1.21.0/prism.min.js"></script>
    <link rel="stylesheet" href="static/css/loginStyle.css">
</head>
<body>
<div class="wrapper">
    <form class="form-signIn" action="login" method="post">
        <h2 class="form-signIn-heading text-center">电力宠物</h2>
        <input type="text" class="form-control" name="email" placeholder="Email Address">
        <input type="password" class="form-control" name="password" placeholder="Password" required="">
        <label class="checkbox">
            <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe">&nbsp;记住我吧
        </label>
        <button class="btn btn-lg btn-primary btn-block">登录</button>
        <center>
            <%
                if (request.getAttribute("login_error_msg") != null) {
                    out.println("<br><font color=\"red\">" + request.getAttribute("login_error_msg") + "</font>");
                }
                if (session.getAttribute("login_error_msg") != null) {
                    out.println("<br><font color=\"red\">" + session.getAttribute("login_error_msg") + "</font>");
                }
            %>
            <br><a href="register.jsp">没有账号？注册一个</a>
        </center>

    </form>

</div>

<%--<script src="https://cdn.jsdelivr.net/npm/prismjs@1.21.0/prism.min.js"></script>--%>
<script src="static/js/vsclick.min.js"></script>
<script>
    let drop2 = new VsClick({
        dom: 'drop2',
        timer: 3000,
        emoji: ['🍋', '🍌', '🍉', '🍎', '🍒', '🍓', '🌽'],
        spring: true
    })
</script>
</body>
</html>