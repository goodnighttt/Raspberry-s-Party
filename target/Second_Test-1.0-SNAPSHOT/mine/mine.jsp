<%@ page import="com.example.User.User" %><%--
  Created by IntelliJ IDEA.
  User: 23605
  Date: 2023/6/2
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>个人主页</title>
<%--    <link rel="stylesheet" type="text/css" href="mine.css"/>--%>
    <style>

        * {
            padding: 0;
            margin: 0;

        }

        /* 导航栏 */
        #navigation{display: flex;flex-direction: row;justify-content: space-between;align-items: center;background-color: white;color: #e2706a;padding: 10px 50px;}

        #appLOGO{display: flex;flex-direction: row;align-items: center;}
        #appPic{border-radius: 50%;width: 5vw;object-fit: fill;margin-right: 10px;}

        /* 内容 */
        #all{background-color: #E14C57;width: 100vw;height: 100vh;}
        .inters{display: flex;flex-direction: column;align-items: center;font-size: 2vw;margin-left: 3vw;margin-top: 1vh;}
        .interKind{color:#E14C57;}
        .interNum{font-weight: 600;}
        .num{font-size: 1vw;position: absolute;background-color:#E14C57 ;color: white;border-radius: 50%;width: 2vw;height: 2vw;
            display: -moz-box;/*兼容Firefox*/
            display: -webkit-box;/*兼容FSafari、Chrome*/

            -moz-box-align: center;/*兼容Firefox*/
            -webkit-box-align: center;/*兼容FSafari、Chrome */

            -moz-box-pack: center;/*兼容Firefox*/
            -webkit-box-pack: center;/*兼容FSafari、Chrome */
        }

        #book:hover{transform: scale(1.1) rotate(5deg);transition: 0.2s ease-in-out;}
        #honor:hover{transform: scale(1.1);transition: 0.2s ease-in-out;}


        /* 书 */
        #mybook{
            transform: rotate(-10deg);
            width: 300px;
            height: 400px;
            background-color: #fff;
            /* 开启3d效果 */
            transform-style: preserve-3d;
            /* 视距 */
            perspective: 2000px;
            /* 阴影 */
            box-shadow: inset 300px 0 30px rgba(0,0,0,0.2),
            0 10px 100px rgba(0,0,0,0.3);
            transition: 1s;
        }
        /* 向左旋转 */
        #mybook:hover{
            transform: rotate(0);
            box-shadow: inset 20px 0 30px rgba(0,0,0,0.2),
            0 10px 100px rgba(0,0,0,0.3);
        }
        /* 书的侧边 */
        #mybook::before{
            content: "";
            position: absolute;
            left: 2px;
            top: -5px;
            width: 100%;
            height: 5px;
            background-color: #000000;
            transform-origin: left;
            transform: skewX(-45deg);
        }
        #mybook::after{
            content: "";
            position: absolute;
            top: 0;
            right: -5px;
            width: 5px;
            height: 100%;
            background-color: #000000;
            transform-origin: left;
            transform: skewY(-45deg);
        }
        #cover{
            width: 100%;
            height: 100%;
            background-color: #5cb9d7;
            display: flex;
            justify-content: center;
            align-items: center;
            /* 相对定位 */
            position: relative;
            transform-origin: left;
            transition: 2s ease-in-out;
        }
        #title{
            position: absolute;
            right: 30px;
            top: 30px;
            background-color: #fff;
            font-size: 40px;
            font-family: "隶书";
            /* 竖向文本 */
            writing-mode: vertical-lr;
            padding: 5px;
            /* 字间距 */
            letter-spacing: 5px;
        }
        /* 打开封面 */
        #mybook:hover #cover{
            transform: rotateY(-135deg);
        }
        #mybook:hover{
            transform: translateX(130px) scale(1.1) ;

        }
        #content{
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1;
            font-size: 40px;
            font-family: "隶书";
            line-height: 50px;
            letter-spacing: 5px;
            display: flex;
            justify-content: center;
            align-items: center;
        }


        .open{top: 40vh;left: 42vw;scale: 4;}

    </style>
</head>
<body>

<div id="all">
    <img src="../img/个人主页/白色底图.png" style="width: 64vw;margin-top: 24vh;margin-left: 13vw;position: absolute;">
    <img src="../img/个人主页/人物.png" style="width: 30vw;position: absolute;right: 4vw;top: 7.5vh;">
    <img src="../img/个人主页/问号.png" style="width: 7vw;position: absolute;right: 23vw;top: 22vh;cursor: pointer;z-index: 100;" id="book">
    <div id="inbox" style="width: 64vw;height: 60vh;margin-top: 24vh;margin-left: 13vw;position: absolute;">
        <!-- 主要内容框 -->
        <div id="inbox1">
            <!-- 上半部分 -->
<%--            <img src="../img/个人主页/头像.png" style="position: absolute;left: 2vw;top: -4vw;width: 11.5vw;">--%>
            <%
                User user = (User) session.getAttribute("user");
                if (user == null || user.getProfilePic() == null) {
            %>
            <img src="../img/首页图标2/用户图标.png"  style="width: 10vw;position: absolute;left: 2vw;top: -10vh;border-radius: 50%;" id="toProfile">
            <%
            } else {
            %>
            <img id = "toProfile" src="../ImageServlet" style="width: 10vw;position: absolute;left: 2vw;top: -10vh;border-radius: 50%;">
            <%
                }
            %>
            <div id="nameAbout" style="position: absolute;top: 6vh;left: 14.5vw;display: flex;flex-direction: row;align-items: center;">
                <div id="name" style="font-size: 3vw;">EVERYBODYSOS</div>
                <img src="../img/个人主页/编辑按钮.png" style="width: 8vw;height: 5.5vh;object-fit: fill;margin-left: 1.3vw;">
            </div>

            <!-- 下半部分 -->
            <div id="down" style="position: absolute;top: 20vh;display: flex;flex-direction: row;">
                <div id="left">
                    <div id="inter" style="display: flex;flex-direction: row;">
                        <div class="inters" id="focus" >
                            <div class="interKind" id="">关注</div>
                            <div class="interNum" id="">25</div>
                        </div>
                        <div class="inters" id="fans">
                            <div class="interKind" id="">粉丝</div>
                            <div class="interNum" id="">100</div>
                        </div>
                        <div class="inters" id="articles">
                            <div class="interKind" id="">文章</div>
                            <div class="interNum" id="">2</div>
                        </div>
                        <div class="inters" id="collect">
                            <div class="interKind" id="">收藏</div>
                            <div class="interNum" id="">30</div>
                        </div>
                    </div>
                    <div id="photos" style="display: flex;flex-direction: row;">
                        <img src="../img/个人主页/照片墙.png" style="margin-left: 2.8vw;margin-top: 3vh;width: 18vw;">
                        <img src="../img/个人主页/照片墙.png" style="margin-left: 1vw;margin-top: 3vh;width: 18vw;">
                    </div>
                </div>
                <div id="right" style="display: flex;flex-direction: row;margin-left: 2vw;">
                    <div id="nums">
                        <img src="../img/个人主页/综合.png" style="width: 7vw;margin-top: 8vh;margin-left: 2vw;">
                        <div class="num" id="" style="top: 11.5vh;right: 9.3vw;">2</div>
                        <div class="num" id="" style="top: 22.8vh;right: 9.3vw;">500</div>
                    </div>
                    <img src="../img/个人主页/勋章.png" style="width: 5.5vw;height: 20vh;margin-top: 8vh;margin-left: 2vw;cursor: pointer;" id="honor">
                </div>
            </div>
        </div>
        <script>
            // document.getElementById("Uploadpage").addEventListener("click", function() {
            //     window.location.href = "../utf8-jsp/index.html";
            // });

            document.getElementById("toProfile").addEventListener("click", function() {
                if (<%= user.getProfilePic() == null ? "true" : "false" %>) {
                    // if user not logged in, redirect to LoginServlet
                    window.location.href = "Uploadhead.jsp";
                } else {
                    //如果用户已登录，就跳转到个人主页
                    // window.location.href = "../mine/mine.jsp";
                    // window.location.href = "../ToMineServlet";
                }
            });
        </script>
    </div>

</div>



<!-- 导航栏 -->
<div id="navigation" style="height: 10vh; border-top-left-radius: 80px;border-top-right-radius: 80px;position: fixed;top: 0;width: 98.3vw;">
    <div id="appLOGO">
        <img id="appPic" src="../img/首页图标2/LOGOPic.png" style="margin-left: -1vw;cursor: pointer;" onclick="toSquare()">
        <img src="../img/个人主页/logo.png" style="height: 4vw;">
        <!-- <text id="appName" style="font-size: 1.6vw;margin-left: 0.5vw;" >Raspberry</text> -->
    </div>
    <div id="profile">
        <img src="../img/个人主页/搜索.png" style="height: 3.5vw;margin-right: 0.8vw;">
        <img src="../img/个人主页/加号.png"  style="width: 3.5vw;margin-right: 1.5vw;">
        <img src="../img/个人主页/用户.png"  style="width: 3.5vw;margin-right: 1.5vw;">

    </div>
</div>

<!-- 书 -->
<div id="mybook" style="position: absolute;top: 28vh;left: 72vw;scale: 0.1;">
    <div id="cover">
        <!-- <span id="title"></span> -->
    </div>
    <div id="content">
        <div class="page">
            <img src="../img/word.PNG" style="width: 4vw;">
        </div>

    </div>
</div>

<script type="text/javascript">
    const book=document.getElementById('book');
    const mybook=document.getElementById('mybook');

    book.onclick=function(){

        mybook.style.top='40vh';
        mybook.style.left='42vw';
        mybook.style.scale='4';
    }

    function toSquare(){
        window.location.href = '../square/newSquare.html';
    }
</script>
</body>
</html>
