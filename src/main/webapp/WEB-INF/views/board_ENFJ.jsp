<%@page import="java.util.List"%>
<%@page import="secure.mbti.a.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<BoardDto> bbslist = (List<BoardDto>)request.getAttribute("bbslist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>

<h1>게시판</h1>

<div align="center">

<hr>
<select id="choice">
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<input type="text" id="search" value="">

<button type="button" onclick="searchBoard()">검색</button>

<br><hr><br>
<!--    attribute property -->
	<table class="table table-hover" style="width:1000px">
	<!-- <col width="30"><col width="200"><col width="80"> -->
	<thead>
	<tr>
	<th>번호</th><th>제목</th><th>글쓴이</th><th>작성날짜</th><th>조회횟수</th><th>댓글개수</th>
	</tr>
	</thead>
	<tbody>
<%
if(bbslist == null || bbslist.size() == 0){	
%>
	<tr>
		<td colspan="4">작성된 글이 없습니다.</td>
	</tr>
<%
}
else{
	for(int i=0; i< bbslist.size(); i++) {
		BoardDto bbs = bbslist.get(i);	
		
%>
		<%
			if (bbs.getDel() == 1) {
		%>
		<tr>
			<td colspan="4">삭제된 글입니다.</td>
		</tr>
		<%
		}
			else{			
		%>
<%
		}
	}
}
%>
		</tbody>	
	</table>
</div>
<br>
<div align="center">
	<a href = "bbswrite.do">글쓰기</a>
</div>

<!-- 
<script type="text/javascript">
location.href = "bbslist.do"; -> GET
</script>
 -->

<script type="text/javascript">
function searchBbs(){
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	location.href="board_ENFJ.do?choice=" + choice + "&search=" + search;
}
</script>

</body>
</html>
</body>
</html>