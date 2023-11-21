<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Post</title>
</head>
<body>

<h1>Add New Post</h1>
<form action="addpost.jsp" method="post">
    <table>
        <tr><td>Title:</td><td><input type="text" name="title"/></td></tr>
        <tr><td>Author:</td><td><input type="text" name="author"/></td></tr>
        <tr><td>Publisher:</td><td><input type="text" name="publisher"/></td></tr>
        <tr><td>Year:</td><td><input type="text" name="year"/></td></tr>
        <tr><td>ISBN:</td><td><input type="text" name="ISBN"/></td></tr>
        <tr><td>image src(Can upload later):</td><td><input type="text" name="Img"/></td></tr>
        <tr><td><a href="posts.jsp">View All Records</a></td><td align="right"><input type="submit" value="Add Post"/></td></tr>
    </table>
</form>

</body>
</html>
