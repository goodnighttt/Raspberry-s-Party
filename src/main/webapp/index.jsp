<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!-- 设置 JSP 页面的编码格式和语言 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <!-- 设置页面标题和字符集 -->
    <style>
        body {
            background-color: black;
            color: white;
            font-family: Arial, sans-serif;
            /* 设置页面背景色、字体颜色和字体 */
        }

        #login-form {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            padding: 20px;
            max-width: 400px;
            margin: auto;
            /* 设置登录表单的样式 */
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            background-color: #f8f8f8;
            color: black;
            /* 设置文本输入框的样式 */
        }

        input[type=submit] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            /* 设置提交按钮的样式 */
        }

        input[type=submit]:hover {
            background-color: #45a049;
            /* 设置提交按钮在鼠标悬停时的样式 */
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            /* 设置标题的样式 */
        }

        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
            /* 设置错误消息的样式 */
        }

        .success-message {
            color: green;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
            /* 设置成功消息的样式 */
        }
    </style>
</head>
<body>
<div id="login-form">
    <h1>User Login</h1>
    <!-- 显示标题 -->
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
    <p class="error-message"><%= errorMessage %></p>
    <!-- 显示错误消息 -->
    <%
        }
        String successMessage = (String) request.getAttribute("successMessage");
        if (successMessage != null) {
    %>
    <p class="success-message"><%= successMessage %></p>
    <!-- 显示成功消息 -->
    <%
        }
    %>
    <form method="post" action="login">
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username" required><br>
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Login">
        <!-- 显示登录表单 -->
    </form>
</div>
</body>
</html>
