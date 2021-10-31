<%--
  Author: Kwanho
  Date: 2021/10/29
  Time: 8:17
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>欢迎 - 电力宠物</title>
    <!-- Link CSS and JS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/loginStyle.css">
</head>
<body>
<div class="wrapper">
    <div class="form-signIn">
        <h1 class="form-signIn-heading text-center">电力宠物</h1>
        <button class="btn btn-lg btn-primary btn-block" onClick="window.location.href='main'">进入商店</button>
        <br><br>
        <center>@Power-Pets 2021</center>
    </div>
</div>

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
