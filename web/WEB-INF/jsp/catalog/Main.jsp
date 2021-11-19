<%--
  Created by IntelliJ IDEA.
  User: mxs
  Date: 2021/10/31
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="content">
    <div class="navigator"></div>
    <div class="category">
        <div class="dog">
            <div class="categoryCount">
                13
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
                13
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
                13
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
                13
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
<%--            <div id="othersCount">--%>
<%--                13--%>
<%--            </div>--%>
            <div class="othersDescription">
                奇奇怪怪的宠物&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="category?categoryName=OTHERS">
                    <button class="othersBtn">看看我</button>
                </a>
            </div>
        </div>
    </div>
    <div class="itemDisplay"></div>
</div>

<%@ include file="../common/bottom.jsp" %>