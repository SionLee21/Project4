<%--
  Created by IntelliJ IDEA.
  User: ision
  Date: 2023/11/17
  Time: 4:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="u" class="com.BoardVO" />
<jsp:setProperty property="*" name="u"/>

<html>
<head>
    <title>Title</title>
</head>
<body>

<form method="post" action="fileform_ok.jsp" enctype="multipart/form-data">
    이미지를 선택하세요 : <input type = "file" name="img1">
    <input type="submit" value="upload" />

</form>

</body>
</html>