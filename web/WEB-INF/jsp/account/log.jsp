<%--
  Created by IntelliJ IDEA.
  User: 11957
  Date: 2021/11/7
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="../common/IncludeTop.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
</head>
<body>
<div class="mainContent">
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-header">
                    <h1 class="text-primary">
                        日志 <small>&nbsp;&nbsp;-&nbsp;你的历史！<strong><i>${sessionScope.user.username}</i></strong></small>
                    </h1>
                </div>
            </div>
        </div>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <table class="table table-bordered">
                    <thead>
                    <tr style="font-size:35px">
                        <th>
                            日期
                        </th>
                        <th>
                            活动
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="log" items="${sessionScope.logList}">

                        <tr class="info" style="font-size:30px">
                            <td>
                                    ${log.split("@")[0]}
                            </td>
                            <td>
                                    ${log.split("@")[1]}
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</body>
</html>
