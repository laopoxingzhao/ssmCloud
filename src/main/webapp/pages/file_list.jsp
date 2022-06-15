<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>文件列表</title>
    <link rel="stylesheet" href="../css/file.css">
<%--    <style>--%>
<%--        body {--%>
<%--            background-image: url("../img/login.jpg");--%>
<%--            background-size: 100%;--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--        }--%>

<%--        .main {--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--        }--%>

<%--        #left {--%>
<%--            background-color: #9cD8FF;--%>
<%--            display: inline-block;--%>
<%--            height: 100%;--%>
<%--            width: 13%;--%>
<%--            float: left;--%>
<%--            margin: 10px 20px;--%>
<%--            opacity: 80%;--%>

<%--        }--%>

<%--        #right {--%>
<%--            background-color: #9CD8FF;--%>
<%--            display: inline-block;--%>
<%--            height: 100%;--%>
<%--            width: 80%;--%>
<%--            opacity: 80%;--%>

<%--            margin: 10px 20px;--%>
<%--        }--%>

<%--        tr {--%>
<%--            border: 2px solid #111--%>
<%--        }--%>
<%--    </style>--%>
<%--<style>--%>
<%--    a{--%>
<%--        text-decoration: none;--%>
<%--    }--%>
<%--</style>--%>
</head>
<body>
<div class="main">
    <span id="left" style="border-radius: 10px;padding: 10px;border-left: solid 20px darkslateblue;margin-left: 5px;height:90%;line-height: 50px;font-weight: bolder;font-size: x-large"">
        <c:if test="${sessionScope.user != null}">
            欢迎<span style="color: #b465da">${sessionScope.user.username}</span>登录<br><br>
            <a href="${pageContext.request.contextPath}/exits">安全退出</a><br><br>
            <a href="${pageContext.request.contextPath}/personal">个人空间</a><br><br>
        </c:if>
        <a href="${pageContext.request.contextPath}/fileList?id=0&index=0" style="color: purple">我的文件</a><br><br>
        <a href="${pageContext.request.contextPath}/fileList?id=0&index=1">共享文件</a><br>
    </span>

    <span id="right" style="border-radius: 10px;margin-left: 10px;height: 90%;border-bottom: solid 20px darkslateblue">
        <div style="border-bottom: 1px solid darkslateblue ;border-top: 5px solid darkslateblue ;border-right:10px solid darkblue;margin-left: -10px;border-top-left-radius: 10px;border-top-right-radius: 10px;padding-left: 10px;padding-top: 10px;margin-right: -10px;border-left: solid 10px darkslateblue;">
            <form action="${pageContext.request.contextPath}/loadFile?index=0" method="post" enctype="multipart/form-data">
                <span style="font-size: larger">文件上传</span>
                <input type="file" name="file_name">
                <input class="two" type="submit" value="上传" style="background-color: darkslateblue;border-radius: 10px">
            </form>
            <form action="${pageContext.request.contextPath}/folder?index=0" method="post">
                <span style="font-size: larger">新建文件夹</span>
                <input type="text" name="folder">
                <input class="two" type="submit" value="新建" style="background-color: darkslateblue;border-radius: 10px">
            </form>
            <c:if test="${sessionScope.parent != null}">
                <tr><a href="fileList?id=${sessionScope.parent}&index=0"><img class="return" src="../img/return.png" title="返回"></a></tr>
            </c:if>
        </div>
<table style="margin-top: 10px;">
    <tr>
        <th>文件名</th>
        <th>类型</th>
        <th>大小</th>
        <th>权限</th>
        <th>下载</th>
        <th>删除</th>
    </tr>
    <c:forEach items="${fileList}" var="file">

        <c:if test="${file.file_user.username == sessionScope.user.username}">
            <tr>
                <td><a href="fileList?id=${file.file_id}&index=0">${file.file_name}</a>
                </td>
                <td>${file.file_type}</td>
                <td>${file.file_size}</td>
                <td>
                     <button onclick="shared('${file.file_id}','${file.shared}')">
                         <c:if test="${file.shared==0}">
                             <img class="lock" src="../img/private1.png">
                         </c:if>
                         <c:if test="${file.shared==1}">
                             <img class="lock" src="../img/public.png">
                         </c:if>
                     </button>
                </td>
                <td>
                    <c:if test='${file.file_type !="文件夹"}'>
                        <a href="downLoadFile/${file.file_user.username}/${file.file_name}">
                            <img src="../img/download.png" title="下载">
                        </a>
                    </c:if>
                </td>
                <td><a href="#" onclick="delFile('${file.file_id}')">
                        <img src="../img/delete.png" title="删除">
                    </a>
                </td>
            </tr>
        </c:if>
    </c:forEach>
</table>
    </span>
</div>
</body>
<script>
    function delFile(file_id) {
        if (confirm("您确定要删除吗")) {
            location.href = "deleteFile/" + file_id + "/0";
        }
    }

    function shared(file_id, status) {
        if (status == 0) {
            if (confirm("您确定要分享吗")) {
                location.href = "shared/" + file_id + "/1";
            }
        } else if (confirm("您要取消分享吗")) {
            location.href = "shared/" + file_id + "/0";
        }
    }
</script>

</html>
