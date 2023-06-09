<%@ page import="com.example.User.User" %>
<%@ page import="com.example.Page.Page" %>
<%@ page import="com.example.Comment.Comment" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
<%--    <link rel="stylesheet" type="text/css" href="./detail.css"/>--%>
    <style>
        * {
            padding: 0;
            margin: 0;

        }

        /* 导航栏 */
        #navigation{display: flex;flex-direction: row;justify-content: space-between;align-items: center;background-color: #df414c;color: #e2706a;padding: 10px 50px;}

        #appLOGO{display: flex;flex-direction: row;align-items: center;}
        #appPic{border-radius: 50%;width: 5vw;object-fit: fill;margin-right: 10px;}

    </style>
</head>
<body>
<div id="profileInfo" >
    <%
        String username = ((Page)request.getAttribute("page")).getUsername();
    %>
    <img src="../ImagePageServlet?username=<%= username %>"  style="position: absolute;top: 13.5vh;left: 22vw;width: 20vw;width: 5vw;height: 5vw;object-fit: cover;border-radius: 50%">
    <span style="position: absolute;top: 17vh;left: 28vw;font-size: 2vw;"><%= username %></span>
</div>

<div id="content" style="position: absolute;top: 25vh;left: 20vw;width: 60vw;">
    <img src="../img/详情.png" style="position: absolute;top: 0vh;left: 0vw;width: 60vw;z-index: -10;">
    <div id="title" style="font-size: 2.8vw;margin-left: 3vw;margin-top: 3.5vh;"><%= ((Page)request.getAttribute("page")).getHeadtitle() %></div>
    <div style="font-size: 1.5vw;font-family: STSong;width: 50vw;margin-left: 5vw;margin-top: 5vh;line-height: 6vh;"><%= ((Page)request.getAttribute("page")).getContent() %></div>
</div>
<%--<div class="likes">--%>
<%--    <span class="count">点赞：<%= ((Page)request.getAttribute("page")).getLikes() %></span>--%>
<%--    <button onclick="likeArticle()">点赞</button>--%>
<%--</div>--%>
<%--<div class="comments">--%>
<%--    <h3>评论区</h3>--%>
<%--    <textarea id="commentTextarea" placeholder="在此处输入评论"></textarea>--%>
<%--    <button onclick="submitComment()">提交评论</button>--%>
<%--</div>--%>
<%--<img src="../img/点赞.png" style="width: 3vw;position: absolute;bottom: 4vh;right: 16vw;">--%>



<!-- 导航栏 -->
<div id="navigation" style="height: 10vh; border-top-left-radius: 60px;border-top-right-radius: 60px;position: fixed;top: 0;width: 97vw;">
    <div id="appLOGO">
        <img id="appPic" src="../img/首页图标2/LOGOPic.png" style="margin-left: -1vw;">
        <img src="../img/首页图标2/logo.png" style="height: 4vw;">
        <!-- <text id="appName" style="font-size: 1.6vw;margin-left: 0.5vw;" >Raspberry</text> -->
    </div>
    <div id="profile">
        <img src="../img/首页图标2/搜索栏.png" style="height: 3.5vw;margin-right: 0.8vw;">
<%--        <img src="../img/首页图标2/加号图标.png"  style="width: 3.5vw;margin-right: 1.5vw;">--%>
<%--        <img src="../img/首页图标2/用户图标.png"  style="width: 3.5vw;margin-right: 1.5vw;cursor: pointer;" id="toProfile">--%>
        <!-- <img id="searchIcon" src="../img/search.png" > -->
        <!-- <button id="login" type="button" style="padding: 1vw 2vh;border-radius: 50%;font-size: 1vw;background-color:#e2706a ;color: white;border: 5px dotted  white;">登录</button> -->
    </div>
</div>

<div id="interactiveArea" style="position: relative;top: 87vh;left: 20vw;width: 60vw;display: flex;flex-direction: column;align-items: end;">
    <button id="likeButton" onclick="likeArticle()" style="width: 10vw;height: 5vh;background-color: #df414c;color: white;border-radius: 3vw;margin-right: 0vw;padding-left-left: 3vw;">Like</button>
    <div style="display: flex;flex-direction: row;align-items: center">
        <textarea id="commentTextarea" placeholder="Write a comment..." style="width: 45vw;height: 5vh;border-radius: 40px;margin-right: 2VW"></textarea>
        <button id="submitCommentButton" onclick="submitComment()" style="width: 10vw;height: 5vh;background-color: #df414c;color: white;border-radius: 3vw;">Submit</button>
    </div>

</div>

<div id="commentsArea" style="position: relative;left: 23vw;top: 90vh;width: 45vw; ">
    <% List<Comment> comments = (List<Comment>)request.getAttribute("comments"); %>
    <% if (comments != null) { %>
    <% for (Comment currentComment : comments) { %>
    <div class="comment" style="border: 1px solid #cccccc; padding: 10px; margin-bottom: 10px;border-radius: 30px">
        <p><%= currentComment.getUsername() %> says:</p>
        <p><%= currentComment.getContent() %></p>
        <p style="font-size: 0.8em; color: #666666;">Commented on <%= currentComment.getCommentTime() %></p>
    </div>
    <% } %>
    <% } %>
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
