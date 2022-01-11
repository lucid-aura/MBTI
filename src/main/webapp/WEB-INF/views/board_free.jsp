<%@page import="secure.mbti.a.dto.BoardDto"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
List<BoardDto> board_free = (List<BoardDto>)request.getAttribute("board_free");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>자유게시판</h1>

</body>
</html>