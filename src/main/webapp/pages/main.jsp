<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>首页</title>
    <link rel="stylesheet" href="../css/main.css">

</head>

<body style="padding-top:30px;background: url(../img/qiao.jpg) no-repeat;background-size: 100%;">
<div class="rg_layout" style="border-radius: 20px;border: #485563 solid 5px;margin-top: 70px">
    <div class="rg_left">
        <p style="font-size: 40px;color: darkslateblue">摆渡网盘</p>
        <p>CLOUD</p>
    </div>
    <div class="rg_center" style="border-radius: 20px;margin-top: 115px;width: 500px;border-bottom: solid 20px darkslateblue;border-left:solid 20px darkslateblue">
        <div class="rg_form" style="border: darkcyan 2px solid;border-top-radius: 20px;border-top-right-radius: 20px;line-height: 40px;background-color: #9cD8FF;opacity: 80%;padding:20px;font-size:25px;">
            <c:if test="${sessionScope.user != null}">
                欢迎<span style="color: #b465da">${sessionScope.user.username}</span>登录<br><br>
                <a href="${pageContext.request.contextPath}/exits" style="margin-left: 55px">安全退出</a><br><br>
            </c:if>
            <c:if test="${sessionScope.user == null}">
                <h5 style="font-align:center;margin-left: 30px">未登录账号</h5><br>
            </c:if>

            <a href="${pageContext.request.contextPath}/fileList?id=0&index=0" style="margin-left: 55px">我的文件</a><br>
            <br>
            <a href="${pageContext.request.contextPath}/fileList?id=0&index=1" style="margin-left: 55px">共享文件</a><br>
            <br>
            <a href="${pageContext.request.contextPath}/personal" style="margin-left: 55px">个人空间</a><br>
        </div>
    </div>
    <div class="rg_right">
        <c:if test="${sessionScope.user == null}">
            <p>已有账号?<a href="../login.jsp">立即登录</a></p>
            <p>未注册账号<a href="../register.jsp">立即登录</a></p>
        </c:if>
    </div>
</div>
</body>
</html>
