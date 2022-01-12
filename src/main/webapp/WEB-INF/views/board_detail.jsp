<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>여긴 글 내용있는 곳입니다</p>
<button type="button" onclick="board_write()">수정(board_update)</button>
<script type="text/javascript">
function board_update() {
	location.href = "board_detail.do";
}

</script>
<button type="button" onclick="board_write()">삭제(board_delete)</button>
<script type="text/javascript">
function board_delete() {
	location.href = "board_free.do";
}


</script>
</body>
</html>