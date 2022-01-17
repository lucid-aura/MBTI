<%@page import="secure.mbti.a.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        
<%
List<BoardDto> board_list = (List<BoardDto>)request.getAttribute("board_list");
%>
<%
int board_size = (int)request.getAttribute("board_size");
%>
<%
int board_page = (int)request.getAttribute("board_page");
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
<div class="wrapper">
	<header>
		<nav>
			<div class="fixed-top py-3 px-3 bg-dark text-center" id="nav">
				<a href="#test" class="text-light distance">유형소개</a>
				<a href="#test" class="text-light distance">유형별게시판</a>
				<a href="board_free.do?page=1" class="text-light distance">자유게시판</a>
				<a href="worldcup_choice.do" class="text-light distance">월드컵</a>
				<button>로그아웃</button>
			</div>
		</nav>
	</header>
<p>여긴 자유게시판입니다</p>
<div align="center">

<hr>

<select id="choice">
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<input type="text" id="search" value="">

<button type="button" onclick="searchBbs()">검색</button>

<br><hr><br>
<!--    attribute property -->
	<table class="table table-hover" style="width:1000px">
	<!-- <col width="30"><col width="200"><col width="80"> -->
	<thead>
	<tr>
	<th>번호</th><th>제목</th><th>정보</th><th>작성자</th>
	</tr>
	</thead>
	<tbody>
<%
if(board_list == null || board_list.size() == 0){	
%>
	<tr>
		<td colspan="4">작성된 글이 없습니다.</td>
	</tr>
<%
}
else{
	for(int i=0; i< board_list.size(); i++) {
		BoardDto board = board_list.get(i);	
		
%>
		<%
			if (board.getDel() == 1) {
		%>
		<tr>
			<td colspan="4">삭제된 글입니다.</td>
		</tr>
		<%
		}
			else{			
		%>
		<tr>
			<th><%=(board_page-1)*20+1+i%></th>
			<td>
				
				<a href="board_detail.do?boardseq=<%=board.getBoardseq() %>">
					<%=board.getTitle() %>
				</a>
			</td>
			
			<td align="center"><%=board.getId() %></td>
		</tr>

<%
		}
	}
}
%>
		</tbody>

	</table>
			<div>
	<%for(int i=0; i< (int)((board_size-1)/20)+1; i++) {
		
		%>
		
		<a href="board_free.do?page=<%=i+1%>"><%=i+1 %></a>
		
	<%
	}
	%>
	
</div>	
</div>

<br>
<div align="center">
	<a href = "board_write.do">글쓰기</a>
</div>

<!-- 
<script type="text/javascript">
location.href = "bbslist.do"; -> GET
</script>
 -->
</div>
 
<footer>
	<p>저작권표시</p>
</footer>
	
<script type="text/javascript">

function searchBbs(){
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	location.href="board_free.do?choice=" + choice + "&search=" + search;
}


</script>
</body>
</html>