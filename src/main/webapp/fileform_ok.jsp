<%--
  Created by IntelliJ IDEA.
  User: ision
  Date: 2023/11/17
  Time: 4:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.BoardDAO" %>
<jsp:useBean id="u" class="com.BoardVO" />
<jsp:setProperty property="*" name="u"/>


<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String filename = "";
    int sizeLimit = 15 * 1024 * 1024;
    String realPath = request.getServletContext().getRealPath("upload");
    File dir = new File(realPath);
    if (!dir.exists()) dir.mkdirs();

    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
    filename = multipartRequest.getFilesystemName("img1");

    int seq = 0;

    String seqParameter = request.getParameter("id");
    if (seqParameter != null && !seqParameter.isEmpty()) {
        try {
            seq = Integer.parseInt(seqParameter);
            BoardDAO boardDAO = new BoardDAO();
            boardDAO.insertImage(seq, filename);
            response.sendRedirect("posts.jsp");
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

    } else {
        response.sendRedirect("posts.jsp");
    }


%>


</body>
</html>
