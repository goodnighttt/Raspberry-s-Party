<%@ page import="com.example.Page.Page" %>
<%@ page import="com.example.User.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang = "en">
<head>
    <meta charset="UTF-8">
    <title>Your Article</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .content {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }

        h1 {
            color: #333;
            margin-bottom: 10px;
        }

        p {
            color: #666;
            line-height: 1.6;
        }

        .info {
            margin-top: 20px;
            font-size: 14px;
            color: #999;
        }

        .likes {
            margin-top: 10px;
            display: flex;
            align-items: center;
        }

        .likes .count {
            margin-right: 10px;
        }

        .comments {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #ccc;
        }

        .comments textarea {
            width: 100%;
            height: 80px;
            resize: none;
            border: 1px solid #ccc;
            padding: 5px;
        }

        .comments button {
            margin-top: 10px;
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="content">
        <h1><%= ((Page)request.getAttribute("page")).getHeadtitle() %></h1>
        <p><%= ((Page)request.getAttribute("page")).getContent() %></p>
        <div class="info">
            <span>Author: <%= ((Page)request.getAttribute("page")).getUsername() %></span>
            <span>Date: <%= ((Page)request.getAttribute("page")).getPublishtime() %></span>
        </div>
        <div class="likes">
            <span class="count">点赞：<%= ((Page)request.getAttribute("page")).getLikes() %></span>
            <button onclick="likeArticle()">点赞</button>
        </div>
        <div class="comments">
            <h3>评论区</h3>
            <textarea id="commentTextarea" placeholder="在此处输入评论"></textarea>
            <button onclick="submitComment()">提交评论</button>
        </div>
    </div>
</div>

<script>
    function likeArticle() {
        var pageId = <%= ((Page)request.getAttribute("page")).getPageId() %>;
        var username = '<%=  ((User)request.getAttribute("user")).getUsername() %>';
        console.log(pageId, username);
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "../LikeCommentServlet", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var countSpan = document.querySelector(".likes .count");
                countSpan.innerText = "点赞：" + xhr.responseText;
            }
        };
        xhr.send("action=like&pageId=" + pageId + "&username=" + username);
    }

    function submitComment() {
        var pageId = <%= ((Page)request.getAttribute("page")).getPageId() %>;
        var username = '<%= ((User)request.getAttribute("user")).getUsername() %>';
        var commentContent = document.getElementById("commentTextarea").value;
        console.log(commentContent);
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "../LikeCommentServlet", true);
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8"); // 设置请求头的编码方式为UTF-8
        // xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // 处理提交评论的响应
            }
        };
        xhr.overrideMimeType("text/html; charset=UTF-8"); // 设置接收响应的编码方式为UTF-8
        xhr.send("action=comment&pageId=" + pageId + "&username=" + username + "&commentContent=" + encodeURIComponent(commentContent)); // 使用encodeURIComponent对评论内容进行编码
        // xhr.send("action=comment&pageId=" + pageId + "&username=" + username + "&commentContent=" + commentContent);
    }
</script>

</body>
</html>

