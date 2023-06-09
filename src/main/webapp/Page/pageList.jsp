<%@ page import="com.example.Page.Page" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 23605
  Date: 2023/6/2
  Time: 1:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 20px;
      background-color: #f8f9fa;
    }
    h2 {
      color: #6c757d;
    }
    ul {
      list-style: none;
      padding: 0;
    }
    li {
      margin-bottom: 20px;
      background-color: #fff;
      border: 1px solid #dee2e6;
      border-radius: .25rem;
      padding: 20px;
      box-shadow: 0 2px 6px 0 rgba(0, 0, 0, .2);
    }
    a {
      color: #007bff;
      text-decoration: none;
    }
    a:hover {
      color: #0056b3;
      text-decoration: underline;
    }
    p {
      color: #6c757d;
    }
    .author, .date {
      font-size: 0.8em;
      color: #adb5bd;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Search Results</h2>
  <ul>
    <% for (Page currentPage : (List<Page>)request.getAttribute("pages")) { %>
    <li>
      <a href="PageDetailsServlet?id=<%= currentPage.getPageId() %>"><%= currentPage.getHeadtitle() %></a>
      <p><%= currentPage.getContent() %></p>
      <p class="author">Author: <%= currentPage.getUsername() %></p>
      <p class="date">Posted: <%= currentPage.getPublishtime() %></p>
    </li>
    <% } %>
  </ul>
</div>
</body>
</html>
