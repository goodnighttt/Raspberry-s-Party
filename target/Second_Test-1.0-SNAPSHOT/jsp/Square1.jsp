<%@ page import="com.example.User.User" %>
<%@ page import="com.example.Movie.Movie" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8" />
    <title>Raspberry</title>
    <link href="../css/square.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="../css/swiper.css"/>
    <script>
        document.querySelector('#searchIcon').addEventListener('click', function() {
            var searchBox = document.querySelector('#searchBox');
            if (searchBox.style.display === 'none') {
                searchBox.style.display = 'block';
            } else {
                searchBox.style.display = 'none';
            }
        });
    </script>

</head>
<body>
<!-- 导航栏 -->
<div id="navigation" style="height: 90px; border-top-left-radius: 70px;border-top-right-radius: 70px;">
<%--    <div id="appLOGO">--%>
<%--        <img id="appPic" src="../img/raspberry.jpg" >--%>
<%--        <text id="appName">Raspberry</text>--%>
<%--    </div>--%>
    <div id="appLOGO">
        <%
            User user = (User) session.getAttribute("user");
            if (user == null || user.getProfilePic() == null) {
        %>
        <img id="appPic" src="../img/raspberry.jpg" >
        <%
        } else {
        %>
        <img id="appPic" src="../ImageServlet" >
        <%
            }
        %>
        <text id="appName">Raspberry</text>
    </div>

    <div id="bars">
        <div id="square">
            <!-- 广场 -->
        </div>
        <div id="onlineSchool">
            <!-- 线上校园 -->
        </div>
        <div id="mine">
            <!-- 个人主页 -->
        </div>
    </div>
    <div id="profile">
        <% if(session.getAttribute("user") == null) { %>
        <form action="../LoginServlet" method="post">
            <input type="hidden" name="action" value="ask">
            <button type="submit">登录</button>

        </form>
        <% } else { %>
        <form action="../LogoutServlet" method="post">
            <button type="submit">注销</button>
            <span id="usernameLabel">
                <p>当前登录用户：<%= ((User) session.getAttribute("user")).getUsername() %></p>
            </span>

        </form>
        <% } %>
    </div>
    <div id="searchWrapper">
        <img id="searchIcon" src="../img/search.png" >
        <div id="searchBox" style="display: none;">
            <form id="searchForm" action="../SearchUserServlet" method="get">
                <input type="text" name="username" placeholder="Enter username to search" />
                <button type="submit">Search</button>
            </form>
        </div>
    </div>

    <script>
        document.querySelector('#searchIcon').addEventListener('click', function() {
            var searchBox = document.querySelector('#searchBox');
            if (searchBox.style.display === 'none') {
                searchBox.style.display = 'block';
            } else {
                searchBox.style.display = 'none';
            }
        });
    </script>
</div>

<!-- 轮播图 -->
<div id="pp1">
    <div id="pp2">
        <img src="../img/大树莓.jpg" />
        <img src="../img/大树莓.jpg" />
        <img src="../img/大树莓.jpg" />
        <img src="../img/大树莓.jpg" />
        <img src="../img/大树莓.jpg" />
        <img src="../img/大树莓.jpg" />
        <img src="../img/大树莓.jpg" />
        <img src="../img/大树莓.jpg" />
        <img src="../img/大树莓.jpg" />
        <img src="../img/大树莓.jpg" />
        <img src="../img/大树莓.jpg" />
        <img src="../img/大树莓.jpg" />

    </div>
</div>


<!-- 四张主题小图 -->
<div id="fourPic">
    <img class="oneOfFour" src="../img/02.jpg"/>
    <img class="oneOfFour" src="../img/01.jpg"/>
    <img class="oneOfFour" src="../img/4.jpg"/>
    <img class="oneOfFour" src="../img/6e1390633559f2b7dd493f4a966639e8b34e2e32b2125-gjhY4e_fw1200.jpg"/>
</div>

<!-- 推荐电影部分 -->
<div id="recommendedMovies">
    <h2>推荐电影</h2>
    <div class="movieList">
        <% List<Movie> top10Movies = (List<Movie>) request.getSession().getAttribute("top10Movies");
            if (top10Movies != null) {
                for (Movie movie : top10Movies) { %>
        <div class="movie">
            <img src="<%= movie.getImageUrl() %>" alt="电影封面">
            <h3><%= movie.getName() %></h3>
            <p>导演： <%= movie.getDirector() %></p>
            <p>演员： <%= movie.getActors() %></p>
            <p>类型： <%= movie.getGenres() %></p>
            <p>评分： <%= movie.getRating() %></p>
            <p>上映时间： <%= movie.getReleaseDate() %></p>
            <p>简介： <%= movie.getDescription() %></p>
        </div>
        <%  }
        } %>
    </div>
</div>


<!-- 广场主要内容-->
<div id="squareContent">
    <!-- 左边主要部分 -->
    <div id="main">
        <!-- 选择板块 -->
        <!-- <div id="titles">
            <div class="titleChoice" id="" style="color: red; font-weight: bold; border-bottom: 2px solid red;">
                热门推荐
            </div>
            <div class="titleChoice" id="">
                解压板块
            </div>
            <div class="titleChoice" id="">
                交流平台
            </div>
            <div class="titleChoice" id="">
                作业展示
            </div>
            <div class="titleChoice" id="">
                音视书
            </div>
        </div> -->
        <!-- 单个板块内容 -->
        <div id="recommend" style="position: relative;">
            <img src="../img/2标题.png" style="height: 300px;object-fit: fill;position: relative;left: -200px;">
            <img src="../img/大树莓.png" style="width: 80%;object-fit: fill;position: absolute;top: 0;left: 10%;margin-top: 310px;z-index: -10;" >
            <div id="content">
                <div id="oneDynamic" style="display: flex;flex-direction: row;position: relative;">
                    <div id="detailLeft"  >
                        <img src="../img/2文字框.png" style="object-fit: fill;height: 600px;position: absolute;left: 0;z-index: -1;">
                        <div id="detail" style="margin: 70px 50px 50px 80px;display: flex;flex-direction: column; justify-content: space-between;height: 440px;width: 600px;">
                            <div id="upper">
                                <div id="userInfo" style="display: flex;flex-direction: row;margin-bottom: 20px;">
                                    <img id="avatar" style="width: 60px;height: 60px;border-radius: 50%;" src="../img/76f7c9d5909705f2442e9210958c381e35bbba9019d83-gPQoxu.png" >
                                    <text>树莓1号</text>
                                </div>
                                <div id="title" style="font-size: 60px;font-weight: 600;">
                                    听说沃恩要被取代了，我们拿出看家文章和三大AI聊了聊
                                </div>
                            </div>

                            <div id="hudong" style="display: flex;flex-direction: row;color: white;justify-content: flex-end;margin-bottom: -40px;margin-right: -20px;">
                                <div id="zan" style="display: flex;flex-direction: row;align-items: center;margin-right: 40px;">
                                    <img src="../img/zan.png"  style="width: 60px;object-fit: fill;margin-right: 20px;">
                                    <text>1478</text>
                                </div>
                                <div id="comment" style="display: flex;flex-direction: row;align-items: center;">
                                    <img src="../img/comment.png" style="width: 60px;object-fit: fill;margin-right: 20px;">
                                    <text>300</text>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="imgRight" style="display: flex;flex-direction: column; justify-content:center ;margin-top: 45px;">
                        <img src="../img/2图片框.png" style="object-fit: fill;height: 600px;position: absolute;right: 0;z-index: 2;">
                        <img src="../img/94cbf0e4be27603677b2d7e9af8287b5.jpeg" style="width: 580px;object-fit: fill;position: absolute;right: 3px;">
                    </div>
                </div>

                <!-- 右侧版 -->
                <div id="oneDynamic" style="display: flex;flex-direction: row;position: relative;margin-top: 300px;">
                    <div id="detailRight"  style="margin-top: -260px;">
                        <img src="../img/2文字框.png" style="object-fit: fill;height: 600px;position: absolute;right: 0;z-index: -1;">
                        <div id="detail" style="margin: 70px 50px 50px 80px;display: flex;flex-direction: column; justify-content: space-between;height: 440px;width: 600px;position: absolute;right: 0;">
                            <div id="upper">
                                <div id="userInfo" style="display: flex;flex-direction: row;margin-bottom: 20px;">
                                    <img id="avatar" style="width: 60px;height: 60px;border-radius: 50%;" src="../img/76f7c9d5909705f2442e9210958c381e35bbba9019d83-gPQoxu.png" >
                                    <text>树莓1号</text>
                                </div>
                                <div id="title" style="font-size: 60px;font-weight: 600;">
                                    五一去哪玩？这些宝藏打卡点等你发现！
                                </div>
                            </div>

                            <div id="hudong" style="display: flex;flex-direction: row;color: white;justify-content: flex-end;margin-bottom: -40px;margin-right: -20px;">
                                <div id="zan" style="display: flex;flex-direction: row;align-items: center;margin-right: 40px;">
                                    <img src="../img/zan.png"  style="width: 60px;object-fit: fill;margin-right: 20px;">
                                    <text>1478</text>
                                </div>
                                <div id="comment" style="display: flex;flex-direction: row;align-items: center;">
                                    <img src="../img/comment.png" style="width: 60px;object-fit: fill;margin-right: 20px;">
                                    <text>300</text>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="imgLeft" style="display: flex;flex-direction: column; justify-content:center ;margin-top: 45px;">
                        <img src="../img/2图片框.png" style="object-fit: fill;height: 600px;position: absolute;left: 0;z-index: 2;">
                        <img src="../img/6e1390633559f2b7dd493f4a966639e8b34e2e32b2125-gjhY4e_fw1200.jpg" style="width: 580px;object-fit: fill;position: absolute;left: 3px;">
                    </div>
                </div>


                <!-- 左侧2 -->
                <div id="oneDynamic" style="display: flex;flex-direction: row;position: relative;margin-top: 300px;">
                    <div id="detailLeft"  >
                        <img src="../img/2文字框.png" style="object-fit: fill;height: 600px;position: absolute;left: 0;z-index: -1;">
                        <div id="detail" style="margin: 70px 50px 50px 80px;display: flex;flex-direction: column; justify-content: space-between;height: 440px;width: 600px;">
                            <div id="upper">
                                <div id="userInfo" style="display: flex;flex-direction: row;margin-bottom: 20px;">
                                    <img id="avatar" style="width: 60px;height: 60px;border-radius: 50%;" src="../img/76f7c9d5909705f2442e9210958c381e35bbba9019d83-gPQoxu.png" >
                                    <text>树莓1号</text>
                                </div>
                                <div id="title" style="font-size: 60px;font-weight: 600;">
                                    CHATGPT类大预言模型为什么会带来“神奇”能力？
                                </div>
                            </div>

                            <div id="hudong" style="display: flex;flex-direction: row;color: white;justify-content: flex-end;margin-bottom: -40px;margin-right: -20px;">
                                <div id="zan" style="display: flex;flex-direction: row;align-items: center;margin-right: 40px;">
                                    <img src="../img/zan.png"  style="width: 60px;object-fit: fill;margin-right: 20px;">
                                    <text>1478</text>
                                </div>
                                <div id="comment" style="display: flex;flex-direction: row;align-items: center;">
                                    <img src="../img/comment.png" style="width: 60px;object-fit: fill;margin-right: 20px;">
                                    <text>300</text>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="imgRight" style="display: flex;flex-direction: column; justify-content:center ;margin-top: 45px;">
                        <img src="../img/2图片框.png" style="object-fit: fill;height: 600px;position: absolute;right: 0;z-index: 2;">
                        <img src="../img/0.jpg" style="width: 580px;object-fit: fill;position: absolute;right: 3px;">
                    </div>
                </div>

            </div>
            <img src="../img/2底部标题.png" style="height: 300px;object-fit: fill;position: relative;right: -600px;">

        </div>
    </div>





</body>
</html>
