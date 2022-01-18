<%@page import="java.util.List"%>
<%@page import="secure.mbti.a.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<BoardDto> board_list = (List<BoardDto>)request.getAttribute("board_list"); // list 가져오기
%>
<%
	int board_size = (int)request.getAttribute("board_size"); //int 가져오기
%>
<%
	int board_page = (int)request.getAttribute("board_page"); //페이지 가져오기
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


<style>
.pagination{
	display: block;
	text-align: center;
}

.search-box {
    margin: 100px auto;
}
.search-box .btn-light {
    border: 1px solid #ced4da;
}
</style>
<title>Insert title here</title>
</head>
<body>

<h1>게시판</h1>
<div class="wrapper">
	<header>
		<nav>
			<div class="fixed-top py-3 px-3 bg-dark text-center" id="nav">
				<a href="introMBTI.do" class="text-light distance">유형소개</a>
				<a href="board_ESFP.do?page=1" class="text-light distance">유형별게시판</a> <!-- 바꿔야함 -->
				<a href="board_free.do?page=1" class="text-light distance">자유게시판</a>
				<a href="worldcup_choice.do" class="text-light distance">월드컵</a>
				<button>로그아웃</button>
			</div>
		</nav>
	</header>
</div>
<br><br>
<h1>ESFP게시판</h1> <!-- 바꿔야함 -->

<div>
<hr>

<div class="search-box col-md-5">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown" 
            aria-haspopup="true" aria-expanded="false" id="choice" value="">제목</button>                        
            <div class="dropdown-menu">
              <a href="javascript:void(0);" class="dropdown-item" onclick="func('title')">제목</a>
              <a href="javascript:void(0);" class="dropdown-item" onclick="func('content')">내용</a>
              <a href="javascript:void(0);" class="dropdown-item" onclick="func('writer')">작성자</a>              
            </div>           
        </div>
        <input type="text" class="form-control" aria-label="Search input with dropdown button" id="search" value="">
        <div class="input-group-append">
            <button class="btn btn-success" type="button"  onclick="searchBoard()" >Search</button>
        </div>
    </div>
</div>





<!--    attribute property -->
	<table class="table table-hover" style="width:1200px" align="center">
	<!-- <col width="30"><col width="200"><col width="80"> -->
	<thead>
	<tr>
	<th width="100px">번호</th><th width="330px">제목</th><th width="150px">글쓴이</th><th width="200px">작성날짜</th><th width="150px">조회횟수</th><th width="100px">댓글개수</th>
	</tr>
	</thead>
	<tbody>
<%
if(board_list == null || board_list.size() == 0){	
%>
	<tr>
		<td colspan="6">작성된 글이 없습니다.</td>
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
			<td colspan="6">삭제된 글입니다.</td>
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
					
					<td ><%=board.getId() %></td>
					
					
					<td ><%=board.getWdate() %></td>					
					
					<td ><%=board.getReadcount() %></td>
										
					<td ><%=board.getCommentcount() %></td>
				</tr>

		<%
				}
			}
		}
		%>  
		</tbody>	
		
	</table>
<div align="center">
<% for(int i=0; i< (int)((board_size-1)/20)+1; i++){
	%>	
<a href="board_ESFP.do?page=<%=i+1%>"><%=i+1%></a> <!-- 바꿔야함 EX)board_free.do?page -->
<%
}
%>
</div>
</div>

<br>
<div align="center">
	<a href="board_write.do?boardtype=9" class="btn btn-primary pull-right">글쓰기</a>	<!-- 각자의 넘버로 바꾸기 -->
</div>
<!--  117 131 제목 바꾸기-->
<!-- 
<script type="text/javascript">
location.href = "bbslist.do"; -> GET
</script>
 -->
<script type="text/javascript">
function func(num) {	
	var ti ="";
	if(num =="title"){ 
		ti="제목"; 				
	}
	else if(num =="content"){
		ti="내용";
	}else{
		ti="작성자"
	}
	document.getElementById("choice").innerText = ti + "";	
	document.getElementById("choice").value = num + "";	
}

function searchBoard(){
	let choice = document.getElementById("choice").value;
	let search = document.getElementById("search").value;
	
	location.href="board_ESFP.do?page=1&choice=" + choice + "&search=" + search; //각자의 컨트롤러로 바꾸기
}
</script>

</body>
</html>