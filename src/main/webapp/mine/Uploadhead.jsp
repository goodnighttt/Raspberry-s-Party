<%@ page import="com.example.User.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <img src="../img/头像.png">
    
    
    <h2 class="text-center">Welcome, <%= ((User) session.getAttribute("user")).getUsername() %>!</h2>

    <div class="row justify-content-center">
        <div class="col-6">
            <form action="../UploadServlet" method="post" enctype="multipart/form-data" class="mt-5">
                <div class="form-group">
                    <label for="image">Upload your profile picture:</label>
                    <input type="file" id="image" name="image" accept="image/*" class="form-control-file">
                </div>
                <button type="submit" class="btn btn-primary">Upload Image</button>
            </form>
        </div>
    </div>

<%--    <div id="profilePic" class="text-center mt-5">--%>
<%--        <img src="../ImageServlet" alt="Your profile picture" class="img-thumbnail">--%>
<%--    </div>--%>
</div>
</body>
</html>
