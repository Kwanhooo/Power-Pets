<%--
  Author: Kwanho
  Date: 2021/10/29
  Time: 8:17
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>欢迎 - 电力宠物</title>
    <link rel="Bookmark" type="image/png" href="static/images/PageLogo.png"/>
    <link rel="icon" type="image/png" href="static/images/PageLogo.png"/>
    <link rel="shortcut icon" type="image/png" href="static/images/PageLogo.png"/>

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
        <br>
        <h1 class="form-signIn-heading text-center">电力宠物</h1>
        <br>
        <button class="btn btn-lg btn-primary btn-block" onClick="window.location.href='main'">进入商店</button>
        <br><br>
        <center>
            <text style="font-family: var(--font-family-sans-serif);font-size:15px;font-weight:bold;">Made with ❤ in
                长沙
            </text>
            <br>
            <text style="color: #007BFF;font-style: italic;font-weight: normal;">
                <a style="font-size:5px;margin-left:150px;" target="_blank"
                   href="https://map.baidu.com/search/%E9%95%BF%E6%B2%99%E5%B8%82/@12573169,3258221.75,12z?querytype=s&da_src=shareurl&wd=%E9%95%BF%E6%B2%99&c=187&src=0&pn=0&sug=0&l=12&b=(12562218.84,2528135.51;12685098.84,2587527.51)&from=webmap&biz_forward=%7B%22scaler%22:1,%22styles%22:%22pl%22%7D&device_ratio=1">
                    28 °11′49〃N,112 °58′42〃E
                </a>
            </text>
        </center>
        <br>
        <center>
            <p style="font-family: var(--font-family-sans-serif);font-size:10px;font-style: italic;margin-top: 5px">2022
                &copy; Copyright&nbsp;Power-Pets&nbsp;电力宠物<br>&nbsp;&nbsp;&nbsp;
                <text style="font-family: var(--font-family-sans-serif);color: #007BFF;font-style: italic;font-weight: bold;">
                    <a target="_blank" style="font-size:12px;" href="https://github.com/Himxs">@Himxs</a>&nbsp;&nbsp;&nbsp;
                    <a target="_blank" style="font-size:12px;" href="https://github.com/xaiodao">@xaiodao</a>&nbsp;&nbsp;&nbsp;
                    <a target="_blank" style="font-size:12px;" href="https://github.com/Kwanhooo">@Kwanhooo</a>
                </text>
            </p>
        </center>
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
