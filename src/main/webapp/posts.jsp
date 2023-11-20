<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.BoardDAO, com.BoardVO, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Book List</title>
	<style>
		#list {
			font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}

		#list td, #list th {
			border: 1px solid #ddd;
			padding: 8px;
			text-align: center;
		}

		#list tr:nth-child(even) {
			background-color: #f2f2f2;
		}

		#list tr:hover {
			background-color: #ddd;
		}

		#list th {
			padding-top: 12px;
			padding-bottom: 12px;
			text-align: center;
			background-color: #006bb3;
			color: white;
		}
	</style>
	<script>
		function delete_ok(id) {
			var a = confirm("정말로 삭제하겠습니까?");
			if (a) location.href = 'deletepost.jsp?id=' + id;
		}
	</script>
</head>
<body>
<h1>Book List</h1>
<%
	BoardDAO boardDAO = new BoardDAO();
	List<BoardVO> list = boardDAO.getBoardList();
	request.setAttribute("list", list);
%>
<table id="list" width="90%">
	<tr>
		<th>Id</th>
		<th>Img</th>
		<th>Title</th>
		<th>Author</th>
		<th>Publisher</th>
		<th>Year</th>
		<th>ISBN</th>
		<th>Edit</th>
		<th>Delete</th>
		<th>View</th>
	</tr>
	<c:forEach items="${list}" var="u">
		<tr>
			<td>${u.getSeq()}</td>
			<td>
				<c:choose>
					<c:when test="${not empty u.getImg()}">
						<img src="upload/${u.getImg()}" alt="Book Image" width="150" height="200">
					</c:when>
					<c:otherwise>
						<a href="fileform.jsp?id=${u.getSeq()}">No Image</a>
					</c:otherwise>
				</c:choose>
			</td>
			<td>${u.getTitle()}</td>
			<td>${u.getAuthor()}</td>
			<td>${u.getPublisher()}</td>
			<td>${u.getYear()}</td>
			<td>${u.getISBN()}</td>
			<td><a href="editform.jsp?id=${u.getSeq()}">Edit</a></td>
			<td><a href="javascript:delete_ok('${u.getSeq()}')">Delete</a></td>
			<td><a href="view.jsp?id=${u.getSeq()}">View</a></td>
		</tr>
	</c:forEach>
</table>
<br/><a href="addpostform.jsp">Add New Post</a>
</body>
</html>
