<%--
  Author: Kwanho
  Date: 2021/10/30
  Time: 14:04
--%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.mygroup.powerpets.util.VerifyCodeUtil" %>
<%@ page import="java.awt.*" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="javax.xml.bind.DatatypeConverter" %>
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
        <input type="text" class="form-control" name="email" id="email" placeholder="邮箱📮" required="required">
        <input type="password" class="form-control" name="password" id="password" placeholder="密码🔑" required="required">
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-8 column">
                    <input type="text" class="form-control" name="verifyCode" id="verifyCode" placeholder="验证码❓" required="required">
                </div>
                    <%
            VerifyCodeUtil.Builder builder = new VerifyCodeUtil.Builder();
            VerifyCodeUtil verifyUtil = builder.build();
            Object[] o = verifyUtil.createImage();
            String verifyCode = (String) o[0];
            BufferedImage verifyCodeImage = (BufferedImage) o[1];

            System.out.println(verifyCode);
            session.setAttribute("verifyCode",verifyCode);

            int size = 200;

            Graphics2D g = verifyCodeImage.createGraphics();
            g.setRenderingHint(
                    RenderingHints.KEY_ANTIALIASING,
                    RenderingHints.VALUE_ANTIALIAS_ON);
            g.setColor(Color.BLUE);
            for (int i = 0; i < size; i += 5) {
                g.drawOval(i, i, size - i, size - i);
            }
            g.dispose();

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(verifyCodeImage, "png", baos);

            String data = DatatypeConverter.printBase64Binary(baos.toByteArray());
            String imageString = "data:image/png;base64," + data;
            String html = "<div class=\"col-md-4 column\"><img src='" + imageString + "'></div></div></div>";
            out.println(html);
        %>
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
        const Days = 30; //此 cookie 将被保存 30 天
        const exp = new Date();
        exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
        document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
    }

    /**
     * 删除cookie
     * @param name
     */
    function delCookie(name) {
        const exp = new Date();
        exp.setTime(exp.getTime() - 1);
        const cval = getCookie(name);
        if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
    }

    /**
     * 读取cookie
     * @param name
     * @returns
     */
    function getCookie(name) {
        const arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
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