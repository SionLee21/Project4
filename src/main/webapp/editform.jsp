<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@page import="com.BoardDAO, com.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Edit Form</title>
</head>
<body>

<%
	BoardDAO boardDAO = new BoardDAO();
	String id = request.getParameter("id");
	BoardVO u = boardDAO.getBoard(Integer.parseInt(id));
%>

<h1>Edit Form</h1>
<form action="editpost.jsp" method="post">
	<input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
	<table>
		<tr><td>Title:</td><td><input type="text" name="title" value="<%= u.getTitle()%>"/></td></tr>
		<tr><td>Author:</td><td><input type="text" name="author" value="<%= u.getAuthor()%>" /></td></tr>
		<tr><td>Publisher:</td><td><input type="text" name="publisher" value="<%= u.getPublisher()%>" /></td></tr>
		<tr><td>Year:</td><td><input type="text" name="year" value="<%= u.getYear()%>" /></td></tr>
		<tr><td>ISBN:</td><td><input type="text" name="ISBN" value="<%= u.getISBN()%>" /></td></tr>
		<tr><td>Img src:</td><td><input type="text" name="Img" value="<%= u.getImg()%>" /></td></tr>

		<tr><td colspan="2"><input type="submit" value="Edit Post"/>
			<input type="button" value="Cancel" onclick="history.back()"/></td></tr>
	</table>
</form>

</body>
</html>
