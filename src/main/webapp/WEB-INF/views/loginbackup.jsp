<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button type="button" onclick="enfp()">enfp</button>
<script type="text/javascript">
function enfp() {
	location.href = "enfp.do";
}
</script>
<div>
<form action="intro.do" method = POST>
<table>

<tr>
<td>
<input type = "text" id="id" name = "id" placeholder="아이디" ><br>
<input type = "checkbox" id="chk_save=id">아이디 저장
</td>
</tr>

<tr>
<td>
<input type = "text" id="pwd" name = "pwd" placeholder="비밀번호">
</td>

</tr>
</table>
</form>
</div>
</body>
</html>