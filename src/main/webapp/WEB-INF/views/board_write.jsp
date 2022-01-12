<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>여긴 글쓰는 곳입니다</p>
<button type="button" onclick="board_writeAf()">등록(board_free)</button>
<script type="text/javascript">

function board_writeAf() {
	location.href = "board_free.do";
}
 </script>

</body>
</html>