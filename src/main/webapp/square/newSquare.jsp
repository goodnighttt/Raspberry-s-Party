<%@ page import="com.example.User.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Raspberry</title>
  <script src="newSquare.js" type="text/javascript" charset="utf-8"></script>
  <link rel="stylesheet" type="text/css" href="newSquare.css"/>
</head>
<body>




<!-- 首图 -->
<div id="first" style="position: relative;height:52vh;padding-top: 10vh;">

  <!-- 泡泡背景图 -->
  <div id="bubbles" style="margin-top: 5vh;position: relative;">
    <img class="bubble" src="../img/首页图标2/紫色泡泡2.png" style="top: 4vh;left: 25vw;height: 30vh;">
    <img class="bubble" src="../img/首页图标2/红色泡泡.png" style="top: 45vh;left: -5vw;height: 30vh;">
    <img class="bubble" src="../img/首页图标2/紫色泡泡.png" style="top: -10vh;right: -8vw;height: 45vh;">
    <img class="bubble" src="../img/首页图标2/蓝色泡泡.png" style="top: 40vh;right: 17vw;height: 45vh;">
    <img class="bubble" src="../img/首页图标2/绿色泡泡.png" style="top: 55vh;right: 0vw;height: 30vh;">
  </div>
  <div id="buttons" style="margin-top: 2.5vh;position: relative;">
    <img class="part" id="music" onmouseover="this.style.cursor='pointer'" src="../img/推荐.png" style="top: 0;left: 3vw;">
    <img class="part" id="sign" onmouseover="this.style.cursor='pointer'" src="../img/树莓.png" style="top:1vh;right: 3vw;width: 20vw;">
    <img class="part" id="study" onmouseover="this.style.cursor='pointer'" src="../img/学习.png" style="left: 40vw;top:5vh;">
    <img class="part" id="release" onmouseover="this.style.cursor='pointer'" src="../img/解压.png" style="top:25vh;left: 20vw;">

    <div id="arrows" style="margin-top: 0vh;position: relative;">
      <img class="arrow" src="../img/首页图标2/箭头1.png" style="top: 60vh;left: 40vw;height: 13vh;">
      <img class="arrow" src="../img/首页图标2/箭头2.png" style="top: 3vh;left: 1vw;height: 10vh;">
      <img class="arrow" src="../img/首页图标2/箭头3.png" style="top: 5vh;left: 58vw;height: 10vh;">
    </div>

  </div>


  <ul class="infomation" >
    <div class="list">登录</div>
    <div class="list">签到</div>
    <div class="list">上传</div>
  </ul>
</div>

<!-- 主要内容 -->
<div id="recommend" style="position: relative;margin-top: 20vh;">
  <img src="../img/2标题.png" style="width: 80vw;object-fit: fill;position: relative;">
  <img src="../img/大树莓.png" style="width: 80%;object-fit: fill;position: absolute;top: 0;left: 10%;margin-top: 310px;z-index: -10;" >
  <div id="content">
    <!-- 左侧1 -->
    <div class="box" style="display: flex;flex-direction: row;padding-left: 1vw;padding-right: 1vw;">
      <div id="leftImg" >
        <img style="height: 80vh;border-radius: 1vw;width: 53vw;" src="../img/6e1390633559f2b7dd493f4a966639e8b34e2e32b2125-gjhY4e_fw1200.jpg" >
      </div>
      <div id="tightMessage">
        <img style="height: 80vh;width: 44.5vw" src="../img/2文字框.png" >
      </div>
    </div>

    <div class="box" style="display: flex;flex-direction: row;padding-left: 1vw;padding-right: 1vw;">
      <div id="tightMessage2">
        <img style="height: 80vh;width: 44.5vw" src="../img/2文字框.png" >
      </div>
      <div id="leftImg2" >
        <img style="height: 80vh;border-radius: 1vw;width: 53vw;" src="../img/6e1390633559f2b7dd493f4a966639e8b34e2e32b2125-gjhY4e_fw1200.jpg" >
      </div>
    </div>

    <div class="box" style="display: flex;flex-direction: row;padding-left: 1vw;padding-right: 1vw;">
      <div id="leftImg3" >
        <img style="height: 80vh;border-radius: 1vw;width: 53vw;" src="../img/6e1390633559f2b7dd493f4a966639e8b34e2e32b2125-gjhY4e_fw1200.jpg" >
      </div>
      <div id="tightMessage3">
        <img style="height: 80vh;width: 44.5vw" src="../img/2文字框.png" >
      </div>
    </div>

  </div>
  <img src="../img/2底部标题.png" style="height: 300px;object-fit: fill;position: relative;right: -600px;">

</div>






<!-- 导航栏 -->
<div id="navigation" style="height: 10vh; border-top-left-radius: 60px;border-top-right-radius: 60px;position: fixed;top: 0;width: 97vw;">
  <div id="appLOGO">
    <img id="appPic" src="../img/首页图标2/LOGOPic.png" style="margin-left: -1vw;">
    <img src="../img/首页图标2/logo.png" style="height: 4vw;">
    <!-- <text id="appName" style="font-size: 1.6vw;margin-left: 0.5vw;" >Raspberry</text> -->
  </div>
  <div id="profile">
    <img src="../img/首页图标2/搜索栏.png" style="height: 3.5vw;margin-right: 0.8vw;">
    <img id = "Uploadpage" src="../img/首页图标2/加号图标.png" style="width: 4vw;margin-right: 1.5vw;">
    <%
      User user = (User) session.getAttribute("user");
      if (user == null || user.getProfilePic() == null) {
    %>
    <img id = "userIcon" src="../img/首页图标2/用户图标.png" style="width: 4vw;margin-right: 1.5vw;">
    <%
    } else {
    %>
    <img src="../ImageServlet" >
    <%
      }
    %>
  </div>

  <script>
    document.getElementById("Uploadpage").addEventListener("click", function() {
      window.location.href = "../utf8-jsp/index.html";
    });

    document.getElementById("userIcon").addEventListener("click", function() {
      if (<%= (session.getAttribute("user") == null) ? "true" : "false" %>) {
        // if user not logged in, redirect to LoginServlet
        window.location.href = "../LoginServlet?action=ask";
      } else {
        // if user logged in, log out user
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "../LogoutServlet", true);
        xhr.send();

        xhr.onload = function() {
          if (xhr.status === 200) {
            // change img src back to default after logging out
            document.getElementById("userIcon").src = "../img/首页图标2/用户图标.png";
          }
        };
      }
    });
  </script>

</div>
<div id="scroll" style="display: flex;flex-direction: column;align-items: center;position: fixed;top: 10vh;">
  <img src="../img/首页图标2/滚动条.png" style="width: 70vw;margin-top: 1.5vh;z-index: 1000;">
</div>

</body>
</html>
