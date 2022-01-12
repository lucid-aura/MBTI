<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>여긴 자유게시판입니다</p>
<button type="button" onclick="board_write()">글쓰기(board_write)</button>
<script type="text/javascript">

function board_write() {
	location.href = "board_write.do";
}
 </script>
</body>
</html>