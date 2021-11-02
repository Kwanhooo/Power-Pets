<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="wrapper">
    <div class="mainContent">

        <div id="PoweredBy">&nbsp<a href="www.mybatis.org">www.mybatis.org</a>
        </div>

        <div id="Banner"><c:if test="${sessionScope.user != null }">
            <c:if test="${sessionScope.isLogin.equals(\"true\")}">
                <c:if test="${sessionScope.user}">
                    ${sessionScope.accountBean.account.bannerName}
                </c:if>
            </c:if>
        </c:if></div>
    </div>
</div>
</body>
</html>