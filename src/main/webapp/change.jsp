<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>忘记密码</title>
</head>
<body>
<div >
    <form action="/change">
        <input type="text" name="oldUsername" placeholder="用户名">
        <input type="text" name="oldPassword" placeholder="旧密码">
        <input type="password" name="newPassword" placeholder="新密码">
        <input type="password" name="surePassword" placeholder="确认新密码"><br><br>
        <input type="submit" value="保存">
    </form>
</div>
</body>
<style>

</style>
</html>
