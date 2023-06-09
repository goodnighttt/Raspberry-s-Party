<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="login.css"/>
</head>
<body>
<div id="">
    <img src="../img/登录/背景.jpg" style="width: 100%;height: 100vh;position: fixed;top: 0;left: 0;">
    <img src="../img/登录/大英文.png" style="position: fixed;left: 0;top: 0;height: 96vh;margin-top: 2vh;" >
    <img id="scroll" src="../img/登录/圆圈英文.png" style="width:33vw ;position: fixed;left: 32.7vw;top: 13vh;">
    <img src="../img/登录/环绕.png" style="width:67vw ;position: fixed;left: 14vw;top: 2vh;">
    <!-- 星星 -->
    <img class="star" src="../img/登录/上边星星.png" style="width: 14vh;position: fixed;left: 35vw;top: 6.2vh;">
    <img class="star" src="../img/登录/左边星星.png" style="width: 10vh;position: fixed;left: 15vw;top: 45vh;">
    <img class="star" src="../img/登录/右边星星.png" style="width: 18vh;position: fixed;right: 21vw;top: 42vh;">
    <!-- 数据 -->
    <img src="../img/登录/头像.png" style="width: 12vh;position: fixed;left: 46.5vw;top: 26vh;">
<%--    <form action="../LoginServlet" method="post">--%>
<%--        <input type="radio" name="action" value="login" checked>Login--%>
<%--        <input type="radio" name="action" value="register">Register--%>
<%--        <br>--%>
<%--        <label for="username">Username:</label>--%>
<%--        <input type="text" name="username" id="username">--%>
<%--        <label for="password">Password:</label>--%>
<%--        <input type="password" name="password" id="password">--%>
<%--        <input type="submit" value="Submit">--%>
<%--    </form>--%>
    <form id="loginForm" method="post">
        <input type="text" name="username" id="username" style="width: 12vh;position: fixed;left: 40.5vw;top: 40vh;background-color: transparent;border: none;width: 19.2vw;font-size: 1.8vw;" placeholder="账号">
        <input type="text" name="password" id="password" style="width: 12vh;position: fixed;left: 40.5vw;top: 49.2vh;background-color: transparent;border: none;width: 19.2vw;font-size: 1.8vw;" placeholder="密码">
    </form>

    <img src="../img/登录/横线.png" style="width: 41vh;position: fixed;left: 40vw;top: 44vh;">
    <img src="../img/登录/横线.png" style="width: 41vh;position: fixed;left: 40vw;top: 53vh;">

    <!-- 按钮 -->
    <img class="button" src="../img/登录/按钮.png" style="width: 15vh;position: fixed;left: 46vw;top: 59vh;cursor: pointer;"  onclick="submitForm('login')">
    <img src="../img/登录/注册.png" style="width: 8vh;position: fixed;left: 47.7vw;top: 68vh;" onclick="submitForm('register')">

    <script>
        function submitForm(action) {
            var form = document.getElementById('loginForm');

            if (action === 'login') {
                form.action = '../LoginServlet?action=login';
            } else if (action === 'register') {
                form.action = '../LoginServlet?action=register';
            }

            form.submit();
        }
    </script>




</div>

<script type="text/javascript">

    function toMine(){
        console.log(1)
        window.location.href = '../mine/mine.html';
    }
</script>
</body>
</html>
