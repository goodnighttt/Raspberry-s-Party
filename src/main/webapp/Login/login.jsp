<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Login Page</title>
    <style>
        /* 定义全局背景 */
        body {
            background-color: #000000;
            font-family: Arial, sans-serif;
        }
        .bottom-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url("../img/背景图.png");
            background-size: cover;
            background-repeat: no-repeat;
            z-index: -2;
        }
        .bg-image {
            position: fixed;
            top: 40%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 80%;
            height: 80%;
            background-image: url("../img/底图.png");
            background-size: cover;
            background-repeat: no-repeat;
            filter: opacity(0.7);
            z-index: -1;
        }

        /* 定义登录表单容器 */
        .login-container {
            position: absolute;
            top: 50%;
            left: 70%;
            transform: translate(-50%, -50%);
            background-color: rgba(255, 255, 255, 0.8);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
            z-index: 0;
        }
        .login-container h1 {
            text-align: center;
            font-weight: bold;
            margin-bottom: 40px;
            color: #FF6B6B;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.6);
        }
        /* 定义输入框样式 */
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
            color: #333;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            margin-bottom: 20px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="submit"] {
            display: block;
            width: 100%;
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        /* 定义头像容器 */
        .avatar-container {
            position: absolute;
            top: 25%;
            left: 70%;
            transform: translate(-50%, -50%);
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 50%;
            width: 100px;
            height: 100px;
            z-index: 1;
        }
        .avatar-container img {
            width: 100%;
            height: auto;
            border-radius: 50%;
        }


    </style>
</head>
<body>
<div class="bg-image"></div>
<div class="bottom-bg"></div>
<div class="login-container">
    <h1 class="red-title">JOIN THE CLUB</h1>
        <form action="../LoginServlet" method="post">
        <input type="radio" name="action" value="login" checked>Login
        <input type="radio" name="action" value="register">Register
        <br>
        <label for="username">Username:</label>
        <input type="text" name="username" id="username">
        <label for="password">Password:</label>
        <input type="password" name="password" id="password">
        <input type="submit" value="Submit">
    </form>


</div>
<div class="avatar-container">
    <img src="../img/Raspberry.png" alt="Avatar">
</div>
</body>
</html>
