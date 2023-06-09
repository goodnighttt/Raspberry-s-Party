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
    var top10Movies = JSON.parse('<%= request.getSession().getAttribute("top10MoviesJson") %>');

    function displayMovies(movies) {
        // var container = document.getElementById('container');

        movie1name = movies[0].name;
        movie2name = movies[1].name;
        movie3name = movies[2].name;
        movie4name = movies[3].name;
        movie5name = movies[4].name;
        movie6name = movies[5].name;
        movie7name = movies[6].name;
        movie8name = movies[7].name;
        movie9name = movies[8].name;
        movie10name = movies[9].name;

        document.getElementById('name1').innerHTML = movie1name;
        document.getElementById('name2').innerHTML = movie2name;
        document.getElementById('name3').innerHTML = movie3name;
        document.getElementById('name4').innerHTML = movie4name;
        document.getElementById('name5').innerHTML = movie5name;
        document.getElementById('name6').innerHTML = movie6name;
        document.getElementById('name7').innerHTML = movie7name;
        document.getElementById('name8').innerHTML = movie8name;
        document.getElementById('name9').innerHTML = movie9name;
        document.getElementById('name10').innerHTML = movie10name;

        movie1des = movies[0].description;
        movie2des = movies[1].description;
        movie3des = movies[2].description;
        movie4des = movies[3].description;
        movie5des = movies[4].description;
        movie6des = movies[5].description;
        movie7des = movies[6].description;
        movie8des = movies[7].description;
        movie9des = movies[8].description;
        movie10des = movies[9].description;

        // document.getElementById('description1').innerHTML = movie1des;
        // document.getElementById('description2').innerHTML = movie2des;
        // document.getElementById('description3').innerHTML = movie3des;
        // document.getElementById('description4').innerHTML = movie4des;
        // document.getElementById('description5').innerHTML = movie5des;
        // document.getElementById('description6').innerHTML = movie6des;
        // document.getElementById('description7').innerHTML = movie7des;
        // document.getElementById('description8').innerHTML = movie8des;
        // document.getElementById('description9').innerHTML = movie9des;
        // document.getElementById('description10').innerHTML = movie10des;


        movie1actor = movies[0].actors;
        movie2actor = movies[1].actors;
        movie3actor = movies[2].actors;
        movie4actor = movies[3].actors;
        movie5actor = movies[4].actors;
        movie6actor = movies[5].actors;
        movie7actor = movies[6].actors;
        movie8actor = movies[7].actors;
        movie9actor = movies[8].actors;
        movie10actor = movies[9].actors;

        document.getElementById('actors1').innerHTML = movie1actor;
        document.getElementById('actors2').innerHTML = movie2actor;
        document.getElementById('actors3').innerHTML = movie3actor;
        document.getElementById('actors4').innerHTML = movie4actor;
        document.getElementById('actors5').innerHTML = movie5actor;
        document.getElementById('actors6').innerHTML = movie6actor;
        document.getElementById('actors7').innerHTML = movie7actor;
        document.getElementById('actors8').innerHTML = movie8actor;
        document.getElementById('actors9').innerHTML = movie9actor;
        document.getElementById('actors10').innerHTML = movie10actor;


        movie1img = movies[0].imageUrl;
        movie2img = movies[1].imageUrl;
        movie3img = movies[2].imageUrl;
        movie4img = movies[3].imageUrl;
        movie5img = movies[4].imageUrl;
        movie6img = movies[5].imageUrl;
        movie7img = movies[6].imageUrl;
        movie8img = movies[7].imageUrl;
        movie9img = movies[8].imageUrl;
        movie10img = movies[9].imageUrl;

        var imageElement1 = document.getElementById('img1');
        imageElement1.src = movie1img;
        imageElement1.setAttribute("referrerpolicy", "no-referrer");
        var imageElement2 = document.getElementById('img2');
        imageElement2.src = movie2img;
        imageElement2.setAttribute("referrerpolicy", "no-referrer");
        var imageElement3 = document.getElementById('img3');
        imageElement3.src = movie3img;
        imageElement3.setAttribute("referrerpolicy", "no-referrer");
        var imageElement4 = document.getElementById('img4');
        imageElement4.src = movie4img;
        imageElement4.setAttribute("referrerpolicy", "no-referrer");
        var imageElement5 = document.getElementById('img5');
        imageElement5.src = movie5img;
        imageElement5.setAttribute("referrerpolicy", "no-referrer");
        var imageElement6 = document.getElementById('img6');
        imageElement6.src = movie6img;
        imageElement6.setAttribute("referrerpolicy", "no-referrer");
        var imageElement7 = document.getElementById('img7');
        imageElement7.src = movie7img;
        imageElement7.setAttribute("referrerpolicy", "no-referrer");
        var imageElement8 = document.getElementById('img8');
        imageElement8.src = movie8img;
        imageElement8.setAttribute("referrerpolicy", "no-referrer");
        var imageElement9 = document.getElementById('img9');
        imageElement9.src = movie9img;
        imageElement9.setAttribute("referrerpolicy", "no-referrer");
        var imageElement10 = document.getElementById('img10');
        imageElement10.src = movie10img;
        imageElement10.setAttribute("referrerpolicy", "no-referrer");





    }

    window.onload = function() {
        displayMovies(top10Movies);
    };


</script>

<!-- 滚动贴合 -->
<div id="container" style="position: relative;">

    <div class="page" style="position: relative;display: flex;flex-direction: column;align-items: center;">

        <div class="left" >
            <div id="" class="panelR" style="position: absolute;top: 22vh;left: 25vw;">
                <img  src="../img/影视推荐/纯白.png"  style="width: 27vw;">
                <div id="" style="width: 15vw;display: flex;flex-direction: column;align-items: center;position: absolute;top: 0;height: 33.5vh;justify-content: center;font-size: 1vw;margin-left: 8vw;">
                    <div id="description1">
                        啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                    </div>
                </div>
            </div>


            <img id = "" src="../img/影视推荐/白色背景.png" style="position: absolute;top: 22vh;left: 25vw;width: 27vw;margin-top: -0.1vh;z-index: 10;" >
            <img class="arrowR" src="../img/影视推荐/箭头.png" onclick="toRight()" style="position: absolute;top: 38vh;left: 53.5vw;width: 2vw;cursor: pointer;" >

            <div class="content" style="position: absolute;top: 22vh;left: 25vw;z-index: 15;">
                <img id = "img1"src="../img/影视推荐/example.jpg" style="position: absolute;left: 1.2vw;top: 3.6vh;width: 9.5vw;font-family: STSong;">
                <div class="MainInfo"  style="position: absolute;top: 10vh;left: 11vw;width: 15vw;display: flex;flex-direction: column;align-items: center;line-height: 2.3vw;">
                    <div id = "name1" class="Title" style="font-size: 1vw;font-weight: 100;">中国机长</div>
                    <div id = "releaseDate1"class="subTitle" style="font-size: 1vw;"><span>2019</span> <span>中国</span></div>
                    <div class="actors" style="position: absolute;left: 0.8vw;top: 16vh;font-size: 0.7vw;line-height: 0.8vw;">
                        <div id="">主演</div>
                        <div id = "actors1" class="actors">李华 张飞 刘明 王一 陈二</div>
                    </div>
                </div>
            </div>

        </div>

        <div class="right">
            <div id="" class="panelL" style="position: absolute;top: 57vh;right: 25vw;">
                <img class="panelL" src="../img/影视推荐/纯黑.png" style="width: 27vw;" >
                <div id="" style="width: 15vw;display: flex;flex-direction: column;align-items: center;position: absolute;top: 0;height: 33.5vh;justify-content: center;font-size: 1vw;margin-left: 4vw;color: white;">
                    <div id="description2">
                        啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                    </div>
                </div>
            </div>

            <img src="../img/影视推荐/黑色背景.png" style="position: absolute;top: 57vh;right: 25vw;width: 27vw;z-index: 10;" >
            <img class="arrowL" src="../img/影视推荐/箭头2.png" style="position: absolute;top: 73vh;right: 53.5vw;width: 2vw;cursor: pointer;" >

            <div class="content" style="position: absolute;top: 57vh;right: 25vw;color: white;z-index: 15;">
                <img id = "img2" src="../img/影视推荐/example.jpg" style="position: absolute;right: 1.2vw;top: 3.6vh;width: 9.5vw;font-family: STSong;">
                <div class="MainInfo"  style="position: absolute;top: 10vh;right: 11vw;width: 15vw;display: flex;flex-direction: column;align-items: center;line-height: 2.3vw;">
                    <div id = "name2"class="name2" style="font-size: 1vw;font-weight: 100;">中国机长</div>
                    <div id = "releaseDate2"class="releaseDate2" style="font-size: 1vw;"><span>2019</span> <span>中国</span></div>
                    <div class="actors" style="position: absolute;right: 0.8vw;top: 16vh;font-size: 0.7vw;line-height: 0.8vw;display: flex;flex-direction: column;align-items: flex-end;">
                        <div id="">主演</div>
                        <div id="actors2"class="actors2">李华 张飞 刘明 王一 陈二</div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="page" style="position: relative;display: flex;flex-direction: column;align-items: center;">

        <div class="left" >
            <div id="" class="panelR" style="position: absolute;top: 22vh;left: 25vw;">
                <img  src="../img/影视推荐/纯白.png"  style="width: 27vw;">
                <div id="" style="width: 15vw;display: flex;flex-direction: column;align-items: center;position: absolute;top: 0;height: 33.5vh;justify-content: center;font-size: 1vw;margin-left: 8vw;">
                    <div id="description3">
                        啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                    </div>
                </div>
            </div>


            <img src="../img/影视推荐/白色背景.png" style="position: absolute;top: 22vh;left: 25vw;width: 27vw;margin-top: -0.1vh;z-index: 10;" >
            <img class="arrowR" src="../img/影视推荐/箭头.png" onclick="toRight()" style="position: absolute;top: 38vh;left: 53.5vw;width: 2vw;cursor: pointer;" >

            <div class="content" style="position: absolute;top: 22vh;left: 25vw;z-index: 15;">
                <img id = "img3"src="../img/影视推荐/example.jpg" style="position: absolute;left: 1.2vw;top: 3.6vh;width: 9.5vw;font-family: STSong;">
                <div class="MainInfo"  style="position: absolute;top: 10vh;left: 11vw;width: 15vw;display: flex;flex-direction: column;align-items: center;line-height: 2.3vw;">
                    <div id = "name3" class="Title" style="font-size: 1vw;font-weight: 100;">中国机长</div>
                    <div id = "releaseDate3"class="subTitle" style="font-size: 1vw;"><span>2019</span> <span>中国</span></div>
                    <div class="actors" style="position: absolute;left: 0.8vw;top: 16vh;font-size: 0.7vw;line-height: 0.8vw;">
                        <div id="">主演</div>
                        <div id = "actors3" class="actors">李华 张飞 刘明 王一 陈二</div>
                    </div>
                </div>
            </div>

        </div>

        <div class="right">
            <div id="" class="panelL" style="position: absolute;top: 57vh;right: 25vw;">
                <img class="panelL" src="../img/影视推荐/纯黑.png" style="width: 27vw;" >
                <div id="" style="width: 15vw;display: flex;flex-direction: column;align-items: center;position: absolute;top: 0;height: 33.5vh;justify-content: center;font-size: 1vw;margin-left: 4vw;color: white;">
                    <div id="description4">
                        啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                    </div>
                </div>
            </div>

            <img src="../img/影视推荐/黑色背景.png" style="position: absolute;top: 57vh;right: 25vw;width: 27vw;z-index: 10;" >
            <img class="arrowL" src="../img/影视推荐/箭头2.png" style="position: absolute;top: 73vh;right: 53.5vw;width: 2vw;cursor: pointer;" >

            <div class="content" style="position: absolute;top: 57vh;right: 25vw;color: white;z-index: 15;">
                <img  id = "img4" src="../img/影视推荐/example.jpg" style="position: absolute;right: 1.2vw;top: 3.6vh;width: 9.5vw;font-family: STSong;">
                <div class="MainInfo"  style="position: absolute;top: 10vh;right: 11vw;width: 15vw;display: flex;flex-direction: column;align-items: center;line-height: 2.3vw;">
                    <div id="name4"class="name4" style="font-size: 2vw;font-weight: 100;">中国机长</div>
                    <div id="releaseDate4"class="releaseDate4" style="font-size: 1vw;"><span>2019</span> <span>中国</span></div>
                    <div class="actors" style="position: absolute;right: 0.8vw;top: 16vh;font-size: 0.7vw;line-height: 0.8vw;display: flex;flex-direction: column;align-items: flex-end;">
                        <div id="">主演</div>
                        <div id="actors4"class="actors4">李华 张飞 刘明 王一 陈二</div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="page" style="position: relative;display: flex;flex-direction: column;align-items: center;">

        <div class="left" >
            <div id="" class="panelR" style="position: absolute;top: 22vh;left: 25vw;">
                <img  src="../img/影视推荐/纯白.png"  style="width: 27vw;">
                <div id="" style="width: 15vw;display: flex;flex-direction: column;align-items: center;position: absolute;top: 0;height: 33.5vh;justify-content: center;font-size: 1vw;margin-left: 8vw;">
                    <div id="description5">
                        啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                    </div>
                </div>
            </div>


            <img src="../img/影视推荐/白色背景.png" style="position: absolute;top: 22vh;left: 25vw;width: 27vw;margin-top: -0.1vh;z-index: 10;" >
            <img class="arrowR" src="../img/影视推荐/箭头.png" onclick="toRight()" style="position: absolute;top: 38vh;left: 53.5vw;width: 2vw;cursor: pointer;" >

            <div class="content" style="position: absolute;top: 22vh;left: 25vw;z-index: 15;">
                <img id = "img5"src="../img/影视推荐/example.jpg" style="position: absolute;left: 1.2vw;top: 3.6vh;width: 9.5vw;font-family: STSong;">
                <div class="MainInfo"  style="position: absolute;top: 10vh;left: 11vw;width: 15vw;display: flex;flex-direction: column;align-items: center;line-height: 2.3vw;">
                    <div id = "name5" class="Title" style="font-size: 1vw;font-weight: 100;">中国机长</div>
                    <div id = "releaseDate5"class="subTitle" style="font-size: 1vw;"><span>2019</span> <span>中国</span></div>
                    <div class="actors" style="position: absolute;left: 0.8vw;top: 16vh;font-size: 0.7vw;line-height: 0.8vw;">
                        <div id="">主演</div>
                        <div id = "actors5" class="actors">李华 张飞 刘明 王一 陈二</div>
                    </div>
                </div>
            </div>

        </div>

        <div class="right">
            <div id="" class="panelL" style="position: absolute;top: 57vh;right: 25vw;">
                <img class="panelL" src="../img/影视推荐/纯黑.png" style="width: 27vw;" >
                <div id="" style="width: 15vw;display: flex;flex-direction: column;align-items: center;position: absolute;top: 0;height: 33.5vh;justify-content: center;font-size: 1vw;margin-left: 4vw;color: white;">
                    <div id="description6">
                        啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                    </div>
                </div>
            </div>

            <img src="../img/影视推荐/黑色背景.png" style="position: absolute;top: 57vh;right: 25vw;width: 27vw;z-index: 10;" >
            <img class="arrowL" src="../img/影视推荐/箭头2.png" style="position: absolute;top: 73vh;right: 53.5vw;width: 2vw;cursor: pointer;" >

            <div class="content" style="position: absolute;top: 57vh;right: 25vw;color: white;z-index: 15;">
                <img id = "img6" src="../img/影视推荐/example.jpg" style="position: absolute;right: 1.2vw;top: 3.6vh;width: 9.5vw;font-family: STSong;">
                <div class="MainInfo"  style="position: absolute;top: 10vh;right: 11vw;width: 15vw;display: flex;flex-direction: column;align-items: center;line-height: 2.3vw;">
                    <div id="name6"class="name6" style="font-size: 1vw;font-weight: 100;">中国机长</div>
                    <div id="releaseDate6"class="releaseDate6" style="font-size: 1vw;"><span>2019</span> <span>中国</span></div>
                    <div class="actors" style="position: absolute;right: 0.8vw;top: 16vh;font-size: 0.7vw;line-height: 0.8vw;display: flex;flex-direction: column;align-items: flex-end;">
                        <div id="">主演</div>
                        <div id="actors6"class="actors6">李华 张飞 刘明 王一 陈二</div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="page" style="position: relative;display: flex;flex-direction: column;align-items: center;">

        <div class="left" >
            <div id="" class="panelR" style="position: absolute;top: 22vh;left: 25vw;">
                <img  src="../img/影视推荐/纯白.png"  style="width: 27vw;">
                <div id="" style="width: 15vw;display: flex;flex-direction: column;align-items: center;position: absolute;top: 0;height: 33.5vh;justify-content: center;font-size: 1vw;margin-left: 8vw;">
                    <div id="description7">
                        啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                    </div>
                </div>
            </div>


            <img src="../img/影视推荐/白色背景.png" style="position: absolute;top: 22vh;left: 25vw;width: 27vw;margin-top: -0.1vh;z-index: 10;" >
            <img class="arrowR" src="../img/影视推荐/箭头.png" onclick="toRight()" style="position: absolute;top: 38vh;left: 53.5vw;width: 2vw;cursor: pointer;" >

            <div class="content" style="position: absolute;top: 22vh;left: 25vw;z-index: 15;">
                <img id = "img7" src="../img/影视推荐/example.jpg" style="position: absolute;left: 1.2vw;top: 3.6vh;width: 9.5vw;font-family: STSong;">
                <div class="MainInfo"  style="position: absolute;top: 10vh;left: 11vw;width: 15vw;display: flex;flex-direction: column;align-items: center;line-height: 2.3vw;">
                    <div id = "name7" class="Title" style="font-size: 1vw;font-weight: 100;">中国机长</div>
                    <div id = "releaseDate7"class="subTitle" style="font-size: 1vw;"><span>2019</span> <span>中国</span></div>
                    <div class="actors" style="position: absolute;left: 0.8vw;top: 16vh;font-size: 0.7vw;line-height: 0.8vw;">
                        <div id="">主演</div>
                        <div id = "actors7" class="actors">李华 张飞 刘明 王一 陈二</div>
                    </div>
                </div>
            </div>

        </div>

        <div class="right">
            <div id="" class="panelL" style="position: absolute;top: 57vh;right: 25vw;">
                <img class="panelL" src="../img/影视推荐/纯黑.png" style="width: 27vw;" >
                <div id="" style="width: 15vw;display: flex;flex-direction: column;align-items: center;position: absolute;top: 0;height: 33.5vh;justify-content: center;font-size: 1vw;margin-left: 4vw;color: white;">
                    <div id="description8">
                        啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                    </div>
                </div>
            </div>

            <img src="../img/影视推荐/黑色背景.png" style="position: absolute;top: 57vh;right: 25vw;width: 27vw;z-index: 10;" >
            <img class="arrowL" src="../img/影视推荐/箭头2.png" style="position: absolute;top: 73vh;right: 53.5vw;width: 2vw;cursor: pointer;" >

            <div class="content" style="position: absolute;top: 57vh;right: 25vw;color: white;z-index: 15;">
                <img id = "img8"src="../img/影视推荐/example.jpg" style="position: absolute;right: 1.2vw;top: 3.6vh;width: 9.5vw;font-family: STSong;">
                <div class="MainInfo"  style="position: absolute;top: 10vh;right: 11vw;width: 15vw;display: flex;flex-direction: column;align-items: center;line-height: 2.3vw;">
                    <div id="name8"class="name8" style="font-size: 1vw;font-weight: 100;">中国机长</div>
                    <div id="releaseDate8"class="releaseDate8" style="font-size: 1vw;"><span>2019</span> <span>中国</span></div>
                    <div class="actors" style="position: absolute;right: 0.8vw;top: 16vh;font-size: 0.7vw;line-height: 0.8vw;display: flex;flex-direction: column;align-items: flex-end;">
                        <div id="">主演</div>
                        <div id="actors8"class="actors8">李华 张飞 刘明 王一 陈二</div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="page" style="position: relative;display: flex;flex-direction: column;align-items: center;">

        <div class="left" >
            <div id="" class="panelR" style="position: absolute;top: 22vh;left: 25vw;">
                <img  src="../img/影视推荐/纯白.png"  style="width: 27vw;">
                <div id="" style="width: 15vw;display: flex;flex-direction: column;align-items: center;position: absolute;top: 0;height: 33.5vh;justify-content: center;font-size: 1vw;margin-left: 8vw;">
                    <div id="description9">
                        啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                    </div>
                </div>
            </div>


            <img src="../img/影视推荐/白色背景.png" style="position: absolute;top: 22vh;left: 25vw;width: 27vw;margin-top: -0.1vh;z-index: 10;" >
            <img class="arrowR" src="../img/影视推荐/箭头.png" onclick="toRight()" style="position: absolute;top: 38vh;left: 53.5vw;width: 2vw;cursor: pointer;" >

            <div class="content" style="position: absolute;top: 22vh;left: 25vw;z-index: 15;">
                <img id = "img9"src="../img/影视推荐/example.jpg" style="position: absolute;left: 1.2vw;top: 3.6vh;width: 9.5vw;font-family: STSong;">
                <div class="MainInfo"  style="position: absolute;top: 10vh;left: 11vw;width: 15vw;display: flex;flex-direction: column;align-items: center;line-height: 2.3vw;">
                    <div id = "name9" class="Title" style="font-size: 1vw;font-weight: 100;">中国机长</div>
                    <div id = "releaseDate9"class="subTitle" style="font-size: 1vw;"><span>2019</span> <span>中国</span></div>
                    <div class="actors" style="position: absolute;left: 0.8vw;top: 16vh;font-size: 0.7vw;line-height: 0.8vw;">
                        <div id="">主演</div>
                        <div id = "actors9" class="actors">李华 张飞 刘明 王一 陈二</div>
                    </div>
                </div>
            </div>

        </div>

        <div class="right">
            <div id="" class="panelL" style="position: absolute;top: 57vh;right: 25vw;">
                <img class="panelL" src="../img/影视推荐/纯黑.png" style="width: 27vw;" >
                <div id="" style="width: 15vw;display: flex;flex-direction: column;align-items: center;position: absolute;top: 0;height: 33.5vh;justify-content: center;font-size: 1vw;margin-left: 4vw;color: white;">
                    <div id="description10">
                        啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊
                    </div>
                </div>
            </div>

            <img src="../img/影视推荐/黑色背景.png" style="position: absolute;top: 57vh;right: 25vw;width: 27vw;z-index: 10;" >
            <img class="arrowL" src="../img/影视推荐/箭头2.png" style="position: absolute;top: 73vh;right: 53.5vw;width: 2vw;cursor: pointer;" >

            <div class="content" style="position: absolute;top: 57vh;right: 25vw;color: white;z-index: 15;">
                <img id = "img10"src="../img/影视推荐/example.jpg" style="position: absolute;right: 1.2vw;top: 3.6vh;width: 9.5vw;font-family: STSong;">
                <div class="MainInfo"  style="position: absolute;top: 10vh;right: 11vw;width: 15vw;display: flex;flex-direction: column;align-items: center;line-height: 2.3vw;">
                    <div id="name10"class="name10" style="font-size: 1vw;font-weight: 100;">中国机长</div>
                    <div id="releaseDate10"class="releaseDate10" style="font-size: 1vw;"><span>2019</span> <span>中国</span></div>
                    <div class="actors" style="position: absolute;right: 0.8vw;top: 16vh;font-size: 0.7vw;line-height: 0.8vw;display: flex;flex-direction: column;align-items: flex-end;">
                        <div id="">主演</div>
                        <div id="actors10"class="actors10">李华 张飞 刘明 王一 陈二</div>
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
