<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Users</title>
</head>
<body>
<h2>Search Users</h2>
<form action="../SearchUserServlet" method="get">
    Username: <input type="text" name="username">
    <input type="submit" value="Search">
</form>
</body>
</html>
