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
</head>
<body>
<div class="main" style="margin-top: 15px">
    <span id="left" style="border-radius: 10px;padding: 10px;border-left: solid 20px darkslateblue;margin-left: 5px;height:90%;line-height: 50px;font-weight: bolder;font-size: x-large">

        <c:if test="${sessionScope.user != null}">
            欢迎<span style="color: #b465da">${sessionScope.user.username}</span>登录<br><br>
            <a href="${pageContext.request.contextPath}/exits">安全退出</a><br><br>
            <a href="${pageContext.request.contextPath}/personal">个人空间</a><br><br>
        </c:if>
            <a href="${pageContext.request.contextPath}/fileList?id=0&index=0">我的文件</a><br><br>
            <a href="${pageContext.request.contextPath}/fileList?id=0&index=1" style="color: purple">共享文件</a><br>
    </span>

    <span id="right" style="border-radius: 10px;margin-left: 10px;height: 90%;border-bottom: solid 20px darkslateblue">
 <c:if test="${sessionScope.parent != null}">
     <tr><a href="fileList?id=${sessionScope.parent}&index=0">返回上级</a></tr>
 </c:if>
        <table style="border-radius: 5px;margin: 0px;width: 100%;border-left: solid 10px darkslateblue;border-right: solid 10px darkslateblue;border-top: solid 5px darkslateblue;border-bottom: solid 1px darkslateblue;margin-left: -5px;margin-right: -15px;width: 101%">
            <tr style="background-color: #7abdce;border-radius: 10px;font-size: 25px;border: solid 10px darkslateblue">
                <th>文件名</th>
                <th>类 型</th>
                <th>大 小</th>
                <th>上传人</th>
                <th>下 载</th>
                <th>删 除</th>
            </tr>
            <c:forEach items="${fileList}" var="file">
                <c:if test="${file.shared == 1 }">
                    <tr>
                        <td>
                            <a href="${pageContext.request.contextPath}/fileList?id=${file.file_id}&index=1">${file.file_name}</a>
                        </td>
                        <td>${file.file_type}</td>
                        <td>${file.file_size}</td>
                        <td>${file.file_user.username}</td>
                        <td>
                            <c:if test='${file.file_type !="文件夹"}'>
                                <a href="downLoadFile/${file.file_user.username}/${file.file_name}">
                                    <img src="../img/download.png" title="下载">
                                </a>
                            </c:if>
                        </td>
                        <td>
                            <c:if test='${file.file_user.username==sessionScope.user.username}'>
                                <a href="#" onclick="delFile('${file.file_id}')">
                                    <img src="../img/delete.png" title="删除">
                                </a>
                            </c:if>
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
            location.href = "deleteFile/" + file_id + "/1";
        }
    }
</script>

</html>
