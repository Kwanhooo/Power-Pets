<%--
  Author: Kwanho
  Date: 2021/10/29
  Time: 15:09
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>注册 - 电力宠物</title>
    <!-- Link CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/registerStyle.css">

    <script type="text/javascript" src="static/js/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script src="static/js/register.js"></script>

</head>
<body>
<div class="wrapper">
    <form class="form-signIn" action="register" method="post">
        <h2 class="form-signIn-heading text-center">电力宠物</h2><br>

        <label class="hint-label">用户名&nbsp;&nbsp;
            <input name="username" required="required" id ="input_username" placeholder="😘"></label><br><br>


        <label class="hint-label">密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="password" required="required" id ="input_password" name="password" placeholder="🔑"></label><br>

        <label class="hint-label">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="password" required="required" id ="input_doubleCheckPassword" name="doubleCheckPassword" placeholder="请再次输入密码"></label><br><br>


        <label class="hint-label">邮箱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="email" required="required" id="input_email" placeholder="📮"></label><br><br>

        <label class="hint-label">地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="address" required="required" id="input_address" placeholder="🏠"></label><br><br>

        <label class="hint-label">性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="sex" value="male">👨Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="radio" name="sex" value="female">👧Female</label><br>

        <label class="hint-label">年龄&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="age" required="required" id="input_age" placeholder="👦->👴"></label>

        <br>

        <center>
            <%
                if (request.getAttribute("register_error_msg") != null) {
                    out.println("<br><font color=\"red\">" + request.getAttribute("register_error_msg") + "</font>");
                }
                if (session.getAttribute("register_error_msg") != null) {
                    out.println("<br><font color=\"red\">" + session.getAttribute("register_error_msg") + "</font>");
                }
            %>
        </center>

        <br>
        <button class="btn btn-lg btn-primary btn-block">注册</button>


    </form>
</div>

<script src="../../../static/js/vsclick.min.js"></script>
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