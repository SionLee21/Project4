<%--
  Created by IntelliJ IDEA.
  User: ision
  Date: 2023/11/20
  Time: 5:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.BoardDAO, com.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Book Details</title>
</head>
<body>
<h1>Book Details</h1>
<%
    String id = request.getParameter("id");
    BoardDAO boardDAO = new BoardDAO();
    BoardVO book = boardDAO.getBoard(Integer.parseInt(id));
    request.setAttribute("book", book);
%>
<table>
    <tr>
        <td><b>Id:</b></td>
        <td>${book.getSeq()}</td>
    </tr>
    <tr>
        <td><b>Title:</b></td>
        <td>${book.getTitle()}</td>
    </tr>
    <tr>
        <td><b>Author:</b></td>
        <td>${book.getAuthor()}</td>
    </tr>
    <tr>
        <td><b>Publisher:</b></td>
        <td>${book.getPublisher()}</td>
    </tr>
    <tr>
        <td><b>Year:</b></td>
        <td>${book.getYear()}</td>
    </tr>
    <tr>
        <td><b>ISBN:</b></td>
        <td>${book.getISBN()}</td>
    </tr>
    <tr>
        <td><b>Image:</b></td>
        <td>
            <%
                String imgFilename = book.getImg();
                if (imgFilename != null && !imgFilename.isEmpty()) {
            %>
            <img src="upload/<%= imgFilename %>" alt="Book Image" width="150" height="200">
            <%
            } else {
            %>
            No Image Available
            <%
                }
            %>
        </td>
    </tr>
</table>
<br/><a href="posts.jsp">Back to Book List</a>
</body>
</html>

