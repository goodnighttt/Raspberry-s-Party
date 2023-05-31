<%@ page import="com.google.gson.Gson" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Recommended Movies</title>
    <script src="/js/recommendation.js"></script>
</head>
<body>
<h1>Recommended Movies for You</h1>
<div id="movieContainer">
    <!-- Movies will be dynamically populated here by JavaScript -->
</div>
<script>
    // Pass the Java list to JavaScript as an array

    var top10Movies = JSON.parse('<%= request.getSession().getAttribute("top10MoviesJson") %>');

    displayMovies(top10Movies);
</script>
</body>
</html>
