<%--
  Author: Kwanho
  Date: 2021/10/30
  Time: 14:04
--%>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <title>登录 - 电力宠物</title>
    <!-- Link CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/loginStyle.css">
</head>
<body>
<div class="wrapper">
    <form class="form-signIn" action="login" method="post">
        <h2 class="form-signIn-heading text-center">电力宠物</h2>
        <input type="text" class="form-control" name="email" id="email" placeholder="邮箱📮">
        <input type="password" class="form-control" name="password" id="password" placeholder="密码🔑">
        <label class="checkbox">
            <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe">&nbsp;记住我吧
        </label>
        <button class="btn btn-lg btn-primary btn-block" id="login_btn">登录</button>
        <center>
                <%
                if (request.getAttribute("login_error_msg") != null) {
                    out.println("<br><font color=\"red\">" + request.getAttribute("login_error_msg") + "</font>");
                }
                if (session.getAttribute("login_error_msg") != null) {
                    out.println("<br><font color=\"red\">" + session.getAttribute("login_error_msg") + "</font>");
                }
            %>
            <br><a href="register">没有账号？注册一个</a>
    </form>

</div>

<script>
    $(function () {
        initView();
        $("#login_btn").click(function () {
            if ($("#rememberMe").is(":checked")) {
                setCookie("cookie_account", $("#email").val());
                setCookie("cookie_password", $("#password").val());
                setCookie("rememberMe", true);
            } else {
                delCookie("cookie_account");
                delCookie("cookie_password");
                delCookie("rememberMe");
            }
            window.location.reload()
        });
    });

    function initView() {
        if (getCookie("cookie_account")) {
            $("#email").val(getCookie("cookie_account"));
        }
        if (getCookie("cookie_password")) {
            $("#password").val(getCookie("cookie_password"));
        }
        if (getCookie("rememberMe")) {
            $("#rememberMe").attr("checked", getCookie("rememberMe"));
        }
        $("#email").focus(function () {
            this.select();
        });
        $("#password").focus(function () {
            this.select();
        });
    }

    /**
     * 写入cookie
     * @param name  cookie 名
     * @param value  cookie 值
     */
    function setCookie(name, value) {
        var Days = 30; //此 cookie 将被保存 30 天
        var exp = new Date();
        exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
    }

    /**
     * 删除cookie
     * @param name
     */
    function delCookie(name) {
        var exp = new Date();
        exp.setTime(exp.getTime() - 1);
        var cval = getCookie(name);
        if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
    }

    /**
     * 读取cookie
     * @param name
     * @returns
     */
    function getCookie(name) {
        var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
        if (arr != null)
            return unescape(arr[2]);
        return null;
    }
</script>

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