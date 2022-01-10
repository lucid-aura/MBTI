<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button type="button" onclick="home()">홈으로</button>
<button type="button" onclick="worldcup()">월드컵</button>
<script type="text/javascript">
function home() {
	location.href = "home.do";
}

function worldcup() {
	location.href = "worldcup.do";
}
</script>
</body>
</html>