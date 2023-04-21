<%--
  Created by IntelliJ IDEA.
  User: 23605
  Date: 2023/4/7
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Survey</title>
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
            background-image: url("../img/底图.png");
            background-size: cover;
            background-repeat: no-repeat;
            z-index: -2;
        }
        /*.bg-image {*/
        /*    position: fixed;*/
        /*    top: 40%;*/
        /*    left: 50%;*/
        /*    transform: translate(-50%, -50%);*/
        /*    width: 80%;*/
        /*    height: 80%;*/
        /*    background-image: url("../img/底图.png");*/
        /*    background-size: cover;*/
        /*    background-repeat: no-repeat;*/
        /*    filter: opacity(0.7);*/
        /*    z-index: -1;*/
        /*}*/

        /* 定义调查表单容器 */
        .survey-container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(255, 255, 255, 0.8);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.2);
            z-index: 0;
        }
        .survey-container h1 {
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
    </style>
</head>
<body>
<%--<div class="bg-image"></div>--%>
<div class="bottom-bg"></div>
<div class="survey-container">
    <h1 class="red-title">问卷调查</h1>
    <form action="../SurveyServlet" method="post">
        <label for="movie">你最近看的电影是什么？</label>
        <input type="text" name="movie" id="movie">
        <label for="song">你最近在听什么歌曲？</label>
        <input type="text" name="song" id="song">
        <label for="grade">你目前的年级？</label>
        <select name="grade" id="grade">
            <option value="Grade One">大一</option>
            <option value="Grade Two">大二</option>
            <option value="Grade Three">大三</option>
            <option value="Grade Four">大四</option>
<%--            <option value="研一">研一</option>--%>
<%--            <option value="研二">研二</option>--%>
<%--            <option value="研三">研三</option>--%>
<%--            <option value="博士">博士</option>--%>
        </select>
        <label for="favorite_course">你在大学中最喜欢的一门课是什么？</label>
        <input type="text" name="favorite_course" id="favorite_course">
        <input type="submit" value="提交">
    </form>
</div>
</body>
