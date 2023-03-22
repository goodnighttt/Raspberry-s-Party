<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <style>
        body {
            background-color: black;
            color: white;
            font-family: Arial, sans-serif;
        }

        #login-form {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            padding: 20px;
            max-width: 400px;
            margin: auto;
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
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
        }

        .success-message {
            color: green;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<div id="login-form">
    <h1>User Login</h1>
    <%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null) {
    %>
    <p class="error-message"><%= errorMessage %></p>
    <%
        }
        String successMessage = (String) request.getAttribute("successMessage");
        if (successMessage != null) {
    %>
    <p class="success-message"><%= successMessage %></p>
    <%
        }
    %>
    <form method="post" action="login">
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username" required><br>
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>
</div>
</body>
</html>
