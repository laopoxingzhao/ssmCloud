
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
<link rel="stylesheet" href="css/reg.css">
</head>
<body>
<div class="rg_layout">
    <div class="rg_left">
        <p>新用户注册</p>
        <p>USER REGISTER</p>
    </div>
    <div class="rg_center">
        <div class="rg_form">
            <form action="${pageContext.request.contextPath}/register" method="post">
                <table>
                    <tr>
                        <td class="td_left"><label for="username">用户名</label></td>
                        <td class="td_right"><input type="text" name="username" id="username" placeholder="请输入用户名"></td>
                        <p style="color: #e40b0e;font-size: small">${name_error}</p>
                    </tr>
                    <tr>
                        <td class="td_left"><label for="password">密码</label></td>
                        <td class="td_right"><input type="password" name="password" id="password" placeholder="请输入密码"></td>
                    </tr>
                    <tr>
                        <td class="td_left"><label for="email">Email</label></td>
                        <td class="td_right"><input type="email" name="email" id="email" placeholder="请输入邮箱"></td>
                    </tr>
                    <!-- <tr>
                        <td class="td_left"><label for="name">姓名</label></td>
                        <td class="td_right"><input type="text" name="name" id="name" placeholder="请输入姓名"></td>
                    </tr> -->
                    <tr>
                        <td class="td_left"><label for="phoneNum">手机号</label></td>
                        <td class="td_right"><input type="text" name="phoneNum" id="phoneNum" placeholder="请输入手机号"></td>
                    </tr>
                    <!-- <tr>
                        <td class="td_left"><label>性别</label></td>
                        <td class="td_right"><input type="radio" name="gender" value="male">男
                            <input type="radio" name="gender" value="female">女</td>
                    </tr> -->
                    <!-- <tr>
                        <td class="td_left"><label for="birthday">出生日期</label></td>
                        <td class="td_right"><input type="date" name="birthday" id="birthday"></td>
                    </tr> -->
                    <tr>
                        <td class="td_left"><label for="checkcode">验证码</label></td>
                        <td class="td_right"><input type="text" name="checkcode" id="checkcode" placeholder="请输入验证码">
                            <img id="checkCodeImg img_check"  src="${pageContext.request.contextPath}/checkCode" >
                            <button type="button" onclick="a()">换一个</button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" id="btn_sub" value="注册"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <div class="rg_right">
        <p>已有账号?<a href="./login.jsp">立即登录</a></p>
    </div>
</div>
</body>

<script>
    function a () {
        var m = new Date().getMilliseconds();//获取当前毫秒值（0~999）
        document.getElementById("checkCodeImg img_check").src = "${pageContext.request.contextPath}/checkCode?" + m;
    }
</script>
</html>
