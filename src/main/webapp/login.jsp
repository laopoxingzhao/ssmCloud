<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登陆页面</title>
    <link  rel="stylesheet" href="./css/login.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <style>

    </style>
</head>
<body style="   background-image: url(./img/login.jpg);">
<div id="bigBox">
    <h1>LOGIN</h1>
    <div class="inputBox">
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="inputText">
                <i class="fa fa-user-circle" style="color: whitesmoke;"></i>
                <input type="text" placeholder="账户" name="username"  value="${cookie.username.value}"/>
            </div>
            <div class="inputText">
                <i class="fa fa-key" style="color: whitesmoke;"></i>
                <input type="password" placeholder="密码" name="password" value="${cookie.password.value}"/>
                <p  style="color: #e40b0e ; font-size: small;">${error}</p>
            </div>
            <div style="height: 40px ;margin: 0" ><input type="checkbox" name="remember" value="1">记住  下次自动登录</div>
            <div>

                <input type="submit" class="inputButton" value="登录"/>
                <a class="register" href="register.jsp">注册</a>
            </div>
        </form>
    </div>

</div>
</body>
</html>
