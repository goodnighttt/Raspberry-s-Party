<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>影视</title>
    <script src="music.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="music.css"/>
</head>
<body>
<div id="" style="position: relative;display: flex;flex-direction: column;align-items: center;">
    <img src="../img/影视推荐/标题.png" style="position: absolute;top: 13vh;width: 40vw;">
    <img id="CD" src="../img/影视推荐/光盘.png" style="position: absolute;top: 7vh;left: -14vw;width: 42vw;opacity: 0.6;">
</div>

<script>
    var top10movies = [
        {
            name: "电影1",
            releaseDate: "2022",
            country: "中国",
            actors: "演员1 演员2 演员3"
        },
        {
            name: "电影2",
            releaseDate: "2021",
            country: "美国",
            actors: "演员4 演员5 演员6"
        }
    ];

    var page = document.querySelector("#container .page");
    var leftPanel = page.querySelector(".left .panelR");
    // var leftDescription = page.querySelector(".left .description");
    var leftName = page.querySelector(".left .Title");
    var leftReleaseDate = page.querySelector(".left .subTitle");
    var leftActors = page.querySelector(".left .actors");

    var rightPanel = page.querySelector(".right .panelL");
    // var rightDescription = page.querySelector(".right .description");
    var rightName = page.querySelector(".right .Title");
    var rightReleaseDate = page.querySelector(".right .subTitle");
    var rightActors = page.querySelector(".right .actors");

    var movie1 = top10movies[0];
    var movie2 = top10movies[1];

    leftPanel.getElementsByTagName("img")[0].src = "../img/影视推荐/纯白.png";
    // leftDescription.innerText = "啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
    leftName.innerText = movie1.name;
    leftReleaseDate.innerHTML = "<span>" + movie1.releaseDate + "</span> <span>" + movie1.releaseDate + "</span>";
    leftActors.innerText = movie1.actors;

    rightPanel.getElementsByTagName("img")[0].src = "../img/影视推荐/纯黑.png";
    // rightDescription.innerText = "啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
    rightName.innerText = movie2.name;
    rightReleaseDate.innerHTML = "<span>" + movie2.releaseDate + "</span> <span>" + movie2.releaseDate + "</span>";
    rightActors.innerText = movie2.actors;

</script>

<!-- 滚动贴合 -->
<div id="container" style="position: relative;">
    <div class="page" style="position: relative;display: flex;flex-direction: column;align-items: center;">

        <div class="left" >
            <div id="" class="panelR" style="position: absolute;top: 22vh;left: 25vw;">
                <img  src="../img/影视推荐/纯白.png"  style="width: 27vw;">
                <div id="" style="width: 15vw;display: flex;flex-direction: column;align-items: center;position: absolute;top: 0;height: 33.5vh;justify-content: center;font-size: 1vw;margin-left: 8vw;">
                    <div class = "description" id="">
                        啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                    </div>
                </div>
            </div>


            <img src="../img/影视推荐/白色背景.png" style="position: absolute;top: 22vh;left: 25vw;width: 27vw;margin-top: -0.1vh;z-index: 10;" >
            <img class="arrowR" src="../img/影视推荐/箭头.png" onclick="toRight()" style="position: absolute;top: 38vh;left: 53.5vw;width: 2vw;cursor: pointer;" >

            <div class="content" style="position: absolute;top: 22vh;left: 25vw;z-index: 15;">
                <img src="../img/影视推荐/example.jpg" style="position: absolute;left: 1.2vw;top: 3.6vh;width: 9.5vw;font-family: STSong;">
                <div class="MainInfo"  style="position: absolute;top: 10vh;left: 11vw;width: 15vw;display: flex;flex-direction: column;align-items: center;line-height: 2.3vw;">
                    <div class="Title" style="font-size: 2vw;font-weight: 100;">中国机长</div>
                    <div class="subTitle" style="font-size: 1vw;"><span>2019</span> <span>中国</span></div>
                    <div class="actors" style="position: absolute;left: 0.8vw;top: 16vh;font-size: 0.7vw;line-height: 0.8vw;">
                        <div id="">主演</div>
                        <div class="actors">李华 张飞 刘明 王一 陈二</div>
                    </div>
                </div>
            </div>

        </div>
        <div class="right">
            <div id="" class="panelL" style="position: absolute;top: 57vh;right: 25vw;">
                <img class="panelL" src="../img/影视推荐/纯黑.png" style="width: 27vw;" >
                <div id="" style="width: 15vw;display: flex;flex-direction: column;align-items: center;position: absolute;top: 0;height: 33.5vh;justify-content: center;font-size: 1vw;margin-left: 4vw;color: white;">
                    <div class = "description" id="">
                        啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                    </div>
                </div>
            </div>

            <img src="../img/影视推荐/黑色背景.png" style="position: absolute;top: 57vh;right: 25vw;width: 27vw;z-index: 10;" >
            <img class="arrowL" src="../img/影视推荐/箭头2.png" style="position: absolute;top: 73vh;right: 53.5vw;width: 2vw;cursor: pointer;" >

            <div class="content" style="position: absolute;top: 57vh;right: 25vw;color: white;z-index: 15;">
                <img src="../img/影视推荐/example.jpg" style="position: absolute;right: 1.2vw;top: 3.6vh;width: 9.5vw;font-family: STSong;">
                <div class="MainInfo"  style="position: absolute;top: 10vh;right: 11vw;width: 15vw;display: flex;flex-direction: column;align-items: center;line-height: 2.3vw;">
                    <div class="Title" style="font-size: 2vw;font-weight: 100;">中国机长</div>
                    <div class="subTitle" style="font-size: 1vw;"><span>2019</span> <span>中国</span></div>
                    <div class="actors" style="position: absolute;right: 0.8vw;top: 16vh;font-size: 0.7vw;line-height: 0.8vw;display: flex;flex-direction: column;align-items: flex-end;">
                        <div id="">主演</div>
                        <div class="actors">李华 张飞 刘明 王一 陈二</div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>

<!-- 导航栏 -->
<div id="navigation" style="height: 7vh; border-top-left-radius: 60px;border-top-right-radius: 60px;position: fixed;top: 0;width: 97vw;">
    <div id="appLOGO">
        <img id="appPic" src="../img/首页图标2/LOGOPic.png" style="margin-left: 1vw;width: 3.2vw;">
        <img src="../img/影视推荐/logo.png" style="height: 3vw;margin-left: 1vw;">
        <!-- <text id="appName" style="font-size: 1.6vw;margin-left: 0.5vw;" >Raspberry</text> -->
    </div>
    <div id="profile" style="display: flex;flex-direction: row;align-items: center;">
        <img src="../img/影视推荐/搜索.png" style="height: 2vw;margin-right: 1.4vw;">
        <img src="../img/影视推荐/加号.png"  style="width: 2.5vw;margin-right: 1.2vw;">
        <img src="../img/影视推荐/用户.png"  style="width: 2.5vw;margin-right: 1.5vw;cursor: pointer;" id="toProfile">
        <!-- <img id="searchIcon" src="../img/search.png" > -->
        <!-- <button id="login" type="button" style="padding: 1vw 2vh;border-radius: 50%;font-size: 1vw;background-color:#e2706a ;color: white;border: 5px dotted  white;">登录</button> -->
    </div>
</div>



<script type="text/javascript">


</script>
</body>
</html>
