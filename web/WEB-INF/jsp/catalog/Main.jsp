<%--
  Created by IntelliJ IDEA.
  User: mxs
  Date: 2021/10/31
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/IncludeTop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="StyleSheet" href="static/css/Main.css" type="text/css" media="screen"/>
</head>
<body>
<div class="wrapper">
    <div class="mainContent">

        <div class="wordContent">

            <a href="category?categoryName=DOGS"><h3>Dog</h3></a>

            <h6>这里有可爱的小狗勾</h6>
            <br>
            <a href="category?categoryName=CATS"><h3>Cat</h3></a>

            <h6>这里有可爱的小猫猫</h6>
            <br>
            <a href="category?categoryName=BIRDS"><h3>Bird</h3></a>

            <h6>这里有可爱的小鸟鸟</h6>
            <br>
            <a href="category?categoryName=PIG"><h3>Pig</h3></a>

            <h6>这里有可爱的小猪猪</h6>
            <br>
            <a href="category?categoryName=OTHERS"><h3>Others</h3></a>

            <h6>我也不知道这里有什么</h6>
            <br>
        </div>

        <div class="pictureContentDog">
            <a href="category?categoryName=DOGS"><img src="static/images/dogLogo.png" height="350px" width="350px"></a>
        </div>

        <div class="pictureContentCat">
            <a href="category?categoryName=CATS"><img src="static/images/catLogo.png" height="80px" width="80px"></a>
        </div>

        <div class="pictureContentBird">
            <a href="category?categoryName=BIRDS"><img src="static/images/birdLogo.png" height="200px"
                                                       width="200px"></a>
        </div>

        <div class="pictureContentPig">
            <a href="category?categoryName=PIG"><img src="static/images/pigLogo.png" height="80px" width="80px"></a>
        </div>

        <div class="pictureContentOthers">
            <a href="category?categoryName=OTHERS"><img src="static/images/othersLogo.png" height="80px"
                                                        width="80px"></a>
        </div>
    </div>
</div>


</body>
</html>