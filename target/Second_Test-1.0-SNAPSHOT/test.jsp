<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>欢迎来到未来世界</title>
    <style>
        /* 全局样式 */
        body {
            font-family: 'Helvetica Neue', sans-serif;
            font-size: 16px;
            margin: 0;
            padding: 0;
            color: #555;
            background-color: #f9f9f9;
        }

        a {
            color: #555;
            text-decoration: none;
        }

        a:hover {
            color: #007bff;
        }

        /* 导航 */
        nav {
            background-color: #007bff;
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        nav li {
            display: inline-block;
            margin: 0 10px;
        }

        nav a {
            display: block;
            padding: 10px;
            color: #fff;
            text-align: center;
            transition: background-color 0.3s ease-in-out;
        }

        nav a:hover {
            background-color: #fff;
            color: #007bff;
        }

        /* 标题 */
        h1, h2, h3 {
            margin: 0;
            padding: 10px;
        }

        h1 {
            font-size: 36px;
            font-weight: bold;
            text-align: center;
            color: #007bff;
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            color: #555;
            border-bottom: 2px solid #007bff;
        }

        h3 {
            font-size: 18px;
            font-weight: bold;
            color: #007bff;
        }

        /* 横幅 */
        .banner {
            background-color: #007bff;
            color: #fff;
            text-align: center;
        }

        .banner p {
            font-size: 20px;
            margin: 20px;
        }

        /* 特色文章 */
        .featured {
            padding: 20px;
        }

        .featured li {
            margin-bottom: 20px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #e9e9e9;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
        }

        .featured h3 {
            margin-bottom: 10px;
        }

        /* 订阅 */
        .subscribe {
            background-color: #007bff;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        .subscribe h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .subscribe p {
            font-size: 20px;
            margin-bottom: 20px;
        }

        .subscribe form {
            display: inline-block;
        }

        .subscribe label {
            display: inline-block;
            margin-right: 10px;
        }

        .subscribe input[type="email"] {
            font-size: 16px;
            padding: 10px;
            border-radius: 3px;
            border: none;
            margin-right: 10px;
        }

        .subscribe input[type="submit"] {
            background-color: #fff;
            color: #007bff;
            font-size: 16px;
            padding: 10px 20px;
            border-radius: 3px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out, color 0.3s ease-in-out;
        }

        .subscribe input[type="submit"]:hover {
            background-color: #007bff;
            color: #fff;
        }
        /* 页脚 */
        footer {
            background-color: #555;
            color: #fff;
            text-align: center;
            padding: 10px;
        }

    </style>
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="#">首页</a></li>
            <li><a href="#">科技新闻</a></li>
            <li><a href="#">机器人</a></li>
            <li><a href="#">太空旅行</a></li>
            <li><a href="#">联系我们</a></li>
        </ul>
    </nav>
</header>
<section class="banner">
    <h1>欢迎来到未来世界</h1>
    <p>人工智能、机器人、太空探索，未来的科技正在改变我们的生活！</p>
</section>
<section class="featured">
    <h2>特色文章</h2>
    <ul>
        <li>
            <a href="#">
                <h3>机器人之美</h3>
                <p>机器人的出现让我们的生活更加方便、更加舒适，它们是未来的主角。</p>
            </a>
        </li>
        <li>
            <a href="#">
                <h3>太空探索</h3>
                <p>人类从未停止探索太空的脚步，我们的目标是将人类送上更远的星球。</p>
            </a>
        </li>
        <li>
            <a href="#">
                <h3>人工智能的未来</h3>
                <p>人工智能正在成为未来科技的主要驱动力，它们的应用将会是无限的。</p>
            </a>
        </li>
    </ul>
</section>
<section class="subscribe">
    <h2>订阅我们的新闻</h2>
    <p>想要获得更多有关未来科技的最新消息吗？请订阅我们的电子邮件新闻简报。</p>
    <form>
        <label for="email">输入您的电子邮件地址：</label>
        <input type="email" id="email" name="email" required>
        <input type="submit" value="订阅">
    </form>
</section>
<footer>
    <p>版权所有 &copy; 2023 未来世界科技有限公司</p>
</footer>

</body>
</html>



