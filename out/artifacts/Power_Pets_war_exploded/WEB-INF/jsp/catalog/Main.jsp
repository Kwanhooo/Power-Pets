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
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="static/css/Main.css">
</head>
<body>
<div class="upContent">
    <a href="category?selectedCategory=Dog">Dog</a>|
    <a href="category?selectedCategory=Cat">Cat</a>|
    <a href="category?selectedCategory=Brid">Brid</a>|
    <a href="category?selectedCategory=Pig">Pig</a>|
    <a href="category?selectedCategory=Others">Others</a>
</div>
<br>
<br>
<br>
<div class="mainContent">

    <div class="wordContent">

        <a href="category?selectedCategory=Dog"><h3>Dog</h3></a>

        <h6>这里有可爱的小狗勾</h6>
        <br>
        <a href="category?selectedCategory=Cat"><h3>Cat</h3></a>

        <h6>这里有可爱的小猫猫</h6>
        <br>
        <a href="category?selectedCategory=Bird"><h3>Bird</h3></a>

        <h6>这里有可爱的小鸟鸟</h6>
        <br>
        <a href="category?selectedCategory=Pig"><h3>Pig</h3></a>

        <h6>这里有可爱的小猪猪</h6>
        <br>
        <a href="category?selectedCategory=Others"><h3>Others</h3></a>

        <h6>我也不知道这里有什么</h6>
        <br>
    </div>

    <div class="pictureContentDog">
        <a href="category?selectedCategory=Dog"><img src="static/images/dogLogo.png" height="300px" width="300px"></a>
    </div>

    <div class="pictureContentCat">
        <a href="category?selectedCategory=Cat"><img src="static/images/catLogo.png" height="120px" width="120px"></a>
    </div>

    <div class="pictureContentBird">
        <a href="category?selectedCategory=Bird"><img src="static/images/birdLogo.png" height="120px" width="120px"></a>
    </div>

    <div class="pictureContentPig">
        <a href="category?selectedCategory=Pig"><img src="static/images/pigLogo.png" height="120px" width="120px"></a>
    </div>

    <div class="pictureContentOthers">
        <a href="category?selectedCategory=Others"><img src="static/images/othersLogo.png" height="120px" width="120px"></a>
    </div>
</div>


</body>
</html>