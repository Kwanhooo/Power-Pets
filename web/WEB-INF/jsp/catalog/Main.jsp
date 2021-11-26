<%@ page import="com.mygroup.powerpets.domain.User" %><%--
  Author: Kwanho
  Date: 2021/11/20
  Time: 10:13
--%>
<%@ include file="../common/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="content">
    <div class="navigator">
        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-home" onclick="window.location.href ='main'">
                <img src="static/images/home.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>

        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-home" onclick="window.location.href ='account?action=view'">
                <img src="static/images/me.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>

        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-home" onclick="window.location.href ='cart?action=view&userID=${sessionScope.user.id}'">
                <img src="static/images/cart.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>
        <hr style="width:40px;margin-top: 20px;">
        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-dog"
                    onclick="window.location.href ='category?categoryName=DOGS'">
                <img src="static/images/dog.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>
        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-cat"
                    onclick="window.location.href ='category?categoryName=CATS'">
                <img src="static/images/cat.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>
        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-bird"
                    onclick="window.location.href ='category?categoryName=BIRDS'">
                <img src="static/images/bird.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>
        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-pig" onclick="window.location.href ='category?categoryName=PIG'">
                <img src="static/images/pig.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>
        <div class="navigator-item">
            <button class="navigator-btn navigator-btn-others"
                    onclick="window.location.href ='category?categoryName=OTHERS'">
                <img src="static/images/others.png" width="40px" height="40px" style="border-radius: 25px">
            </button>
        </div>
    </div>
    <div class="category">
        <div class="dog">
            <div class="categoryCount">
                ${sessionScope.dogsAmount}
            </div>
            <div class="categoryTitle">Dogs</div>
            <div class="categoryDescription">可爱的小狗勾</div>
            <hr style="width:480px">
            <a href="category?categoryName=DOGS">
                <button class="categoryButton" id="dogBtn">看看我</button>
            </a>
        </div>
        <div class="cat">
            <div class="categoryCount">
                ${sessionScope.catsAmount}
            </div>
            <div class="categoryTitle">Cats</div>
            <div class="categoryDescription">可爱的小猫咪</div>
            <hr style="width:480px">
            <a href="category?categoryName=CATS">
                <button class="categoryButton" id="catBtn">看看我</button>
            </a>
        </div>
        <div class="bird">
            <div class="categoryCount">
                ${sessionScope.birdsAmount}
            </div>
            <div class="categoryTitle">Birds</div>
            <div class="categoryDescription">可爱的鸟鸟</div>
            <hr style="width:480px">
            <a href="category?categoryName=BIRDS">
                <button class="categoryButton" id="birdBtn">看看我</button>
            </a>
        </div>
        <div class="pig">
            <div class="categoryCount">
                ${sessionScope.pigsAmount}
            </div>
            <div class="categoryTitle">Pigs</div>
            <div class="categoryDescription">可爱的小猪猪</div>
            <hr style="width:480px">
            <a href="category?categoryName=PIG">
                <button class="categoryButton" id="pigBtn">看看我</button>
            </a>
        </div>

        <div class="others">
            <div class="othersTitle">Others</div>
            <div class="othersDescription">
                <text style="font-family: 'Cascadia Code', Courier, mono, serif ;font-size: 20px; font-weight: bold;">
                    ${sessionScope.othersAmount}
                </text>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                奇奇怪怪的宠物&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="category?categoryName=OTHERS">
                    <button class="othersBtn">看看我</button>
                </a>
            </div>
        </div>
    </div>

    <div class="itemDisplay">
        <div class="statistics">
            <div class="statistics-left">
                <p style="font-style: italic;color: grey">
                    我们的会员数
                </p>
                <h1>
                    ${sessionScope.userAmount}
                </h1>
            </div>
            <div class="statistics-right">
                <p style="font-style: italic;color: grey">
                    在售宠物
                </p>
                <h1>${sessionScope.itemsAmount}</h1>
            </div>

        </div>

        <div class="items">
            <hr style="width: 400px">

            <h1 style="margin-left: 30px">热销中</h1>

            <%--从这里开始插入展示宠物--%>
            <div class="item">
                <img src="static/images/hashiqi.png" width="100px" height="100px" style="border-radius: 50px">
                <a href="project?projectName=哈士奇"><p style="font-weight: bold; font-size:23px;color:#007BFF">哈士奇</p></a>
                <p>
                    哈士奇性格多变，有的极端胆小，也有的极端暴力，进入人类社会和家庭的哈士奇，都已经没有了这种极端的性格，比较温顺，是一种流行于全球的宠物犬。
                </p>
            </div>
            <hr style="width: 400px">

            <div class="item">
                <img src="static/images/yingduan.png" width="100px" height="100px" style="border-radius: 50px">
                <a href="project?projectName=英短"><p style="font-weight: bold; font-size:23px;color:#007BFF">英短</p></a>
                <p>
                    体形圆胖，四肢粗短发达，毛短而密，头大脸圆，温柔平静，对人友善，极易饲养。大而圆的眼睛根据被毛不同而呈现各种颜色。
                </p>
            </div>
            <hr style="width: 400px">
        </div>

    </div>
</div>

<%@ include file="../common/bottom.jsp" %>