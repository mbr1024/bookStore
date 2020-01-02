<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>bookStore注册页面</title>
    <%--导入css和js --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/client/css/main.css" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/client/js/form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/client/js/jquery-1.8.3.js"></script>

    <script type="text/javascript">
        function changeImage() {
            // 改变验证码图片中的文字
            document.getElementById("img").src = "${pageContext.request.contextPath}/imageCode?time="
                + new Date().getTime();
        }

        function findMail() {
            //alert($("#email").val());
            $.post("${pageContext.request.contextPath}/user/findMail.do?email=" + $("#email").val(),
                function (data) {
                    if (data == "EXIST") {
                        alert("该邮箱已注册,请更换一个!");
                        $("input[name='email']").val("").focus();
                    }
                });
        }

        function findUsername() {
            //alert($("#username").val());
            $.post("${pageContext.request.contextPath}/user/findUsername.do?username=" + $("#username").val(),
                function (data) {
                    if (data == "EXIST") {
                        alert("该用户名已存在,请更换一个!");
                        $("input[name='username']").val("").focus();
                    }
                });
        }
    </script>
</head>

<body class="main">
<!-- 1.网上书城顶部 start -->
<%@include file="head.jsp" %>
<!-- 网上书城顶部  end -->
<!--2. 网上书城菜单列表  start -->
<%@include file="menu_search.jsp" %>
<!-- 网上书城菜单列表  end -->
<!-- 3.网上书城用户注册  start -->
<div id="divcontent">
    <form action="${pageContext.request.contextPath}/user/register.do" method="post" onsubmit="return checkForm();">
        <table width="850px" border="0" cellspacing="0">
            <tr>
                <td style="padding: 30px"><h1>新会员注册</h1>
                    <h5>${msg}</h5>
<%--                    <h3><c:if test="${user!=null}">验证码输入错误,请重试!</c:if></h3>--%>
                    <table width="70%" border="0" cellspacing="2" class="upline">
                        <tr>
                            <td style="text-align: right; width: 20%">会员邮箱：</td>
                            <td style="width: 40%">
                                <input type="text" class="textinput" id="email" value="${user.email}" name="email"
                                       onkeyup="checkEmail();"
                                       onblur="findMail();"/>
                            </td>
                            <td colspan="2"><span id="emailMsg"></span><font color="#999999">请输入有效的邮箱地址</font></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">会员名：</td>
                            <td><input type="text" class="textinput" id="username" value="${user.username}"
                                       name="username"
                                       onkeyup="checkUsername();" onblur="findUsername();"/>
                            </td>
                            <td colspan="2"><span id="usernameMsg"></span><font color="#999999">字母数字下划线1到10位,
                                不能是数字开头</font></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">密码：</td>
                            <td><input type="password" class="textinput" id="password" value="${user.password}"
                                       name="password"
                                       onkeyup="checkPassword();"/></td>
                            <td><span id="passwordMsg"></span><font color="#999999">密码请设置6-16位字符</font></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">重复密码：</td>
                            <td>
                                <input type="password" class="textinput" id="repassword" value="${user.password}"
                                       name="repassword"
                                       onkeyup="checkConfirm();"/>
                            </td>
                            <td><span id="confirmMsg"></span>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right">性别：</td>
                            <td colspan="2">&nbsp;&nbsp;
                                <input type="radio" name="gender" value="男" <c:if test="${user.gender=='男'}">checked="checked"</c:if>/> 男
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="gender" value="女" <c:if test="${user.gender=='女'}">checked="checked"</c:if>/> 女
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right">联系电话：</td>
                            <td colspan="2">
                                <input type="text" class="textinput"
                                       style="width: 350px" value="${user.telephone}" name="telephone"/>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right">个人介绍：</td>
                            <td colspan="2">
                                <textarea class="textarea" name="introduce">${user.introduce}</textarea>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>


                    <h1>注册校验</h1>
                    <table width="80%" border="0" cellspacing="2" class="upline">
                        <tr>
                            <td style="text-align: right; width: 20%">输入校验码：</td>
                            <td style="width: 50%">
                                <input type="text" class="textinput" name="textinput"/>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right; width: 20%;">&nbsp;</td>
                            <td rowspan="2" style="width: 50%">
                                <img src="${pageContext.request.contextPath}/imageCode" width="180"
                                     height="30" class="textinput" style="height: 30px;" id="img"/>&nbsp;&nbsp;
                                <a href="javascript:void(0);" onclick="changeImage()">看不清换一张</a>
                            </td>
                        </tr>
                    </table>

                    <table width="70%" border="0" cellspacing="0">
                        <tr>
                            <td style="padding-top: 20px; text-align: center">
                                <input type="image" src="${pageContext.request.contextPath}/client/images/signup.gif"
                                       name="submit" border="0"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</div>

<!-- 网上书城用户注册  end -->
<!--4. 网上书城下方显示 start -->
<%@ include file="foot.jsp" %>
<!-- 网上书城下方显示 start -->
</body>
</html>
