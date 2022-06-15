<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的资料</title>
    <meta charset="UTF-8" />
    <style>
        #frameA {

            visibility: hidden;
            width: 400px;
            height: 220px;
            padding: 13px;/*内边距*/
            /* background-attachment: fixed;*/
            position: fixed;/*绝对定位*/
            padding-top: 50px;
            left: 50%;
            top: 30%;
            margin-left: -200px;
            margin-top: -200px;/* 上边距*/
            border-bottom: 0px;
            margin-bottom: 0px;
            background-color:rgba(0, 0, 0, 0.7);
            padding-bottom: 0px;
            border-radius: 10px;/*圆角 px  %  */
            text-align: center;

        }
        body{
            background-image: url(../img/qiao.jpg);
            background-size:100% ;
            width: 100%;
            height: 100%;
            margin-top: 50px;
        }
        table,
        tr,
        td,
        caption {
            border: 1px solid silver;
            text-align: center;
            margin: auto; /*实现绝对定位元素的水平垂直居中*/
            border-collapse: collapse; /*边框合并*/
            background-color: rgba(154, 139, 139, 0.6);
        }

        caption {

            font-size: 50px;
            letter-spacing: 30px; /*字母间距*/
            line-height: 100px;
            height: 100px;
        }
        caption,th{
            background-color: rgba(93, 169, 231,0.7);
        }

        .yi {
            height: 50px;
        }
        .er {
            height: 60px;
            /*background-color: rgb(93, 169, 231);*/
            font-size: 40px;
        }
        .san {
            height: 120px;
        }
        #touxiang{
            width: 100px;
            height: 140px;
        }
    </style>
</head>
<body>
<table style="width: 1200px;height: 100%;font-weight: bolder">
    <div>
        <a href="/pages/main.jsp"><img style="width: 50px;height: 30px;margin: 10px;size: 100px" src="../img/return.png" title="返回主页"></a>
    </div>
    <caption>
        个人信息
    </caption>

    <tr class="yi">
        <td>昵称</td>
        <td>${sessionScope.user.username}</td>
        <td>性别：</td>
        <td>·····</td>
        <td width="100" rowspan="4"> <img id="touxiang" src="../img/老头.jpg"/> </td>
    </tr>
    <tr class="yi">
        <td>QQ</td>
        <td>·····</td>
        <td>微信</td>
        <td>·····</td>
    </tr>
    <tr class="yi">
        <td>民族</td>
        <td>·····</td>
        <td>出生年月</td>
        <td>·····</td>
    </tr>
    <tr class="yi">
        <td>空间大小</td>
        <td colspan="4">100MB/1G</td>
    </tr>
    <tr class="er">
        <th colspan="5">联系方式</th>
    </tr>
    <tr class="yi">
        <td>联系电话</td>
        <td colspan="4">${sessionScope.user.phoneNum}</td>
    </tr>
    <tr class="yi">
        <td>电子邮箱</td>
        <td colspan="4">${sessionScope.user.email}</td>
    </tr>
    <tr class="yi">
        <td>修改密码</td>
        <td colspan="4"><button onclick="buttonFrame(false)">修改密码</button><br></td>
    </tr>
</table>
<div id="frameA">
   <button  onclick="buttonFrame(true)"><h1 style="float: right;color: #7abdce ">X</h1></button>
    <iframe style="height:180px" src="../change.jsp">

    </iframe>
</div>
</body>
<script>
    function buttonFrame(a){
        if(a==true)
        {
            document.getElementById("frameA").style.visibility="hidden";//隐藏




        }
        else {
            document.getElementById("frameA").style.visibility="visible";//显示
        }

    }

</script>
</html>