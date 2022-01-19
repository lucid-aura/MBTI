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
<link rel="stylesheet" href="css/style.css?version=3">
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
<div >
	<header>
				<nav>
			<div class="fixed-top py-3 px-3 text-center deepblue"  id="nav">
				<a href="introMBTI.do" ><img style="width:80px; heigth:20px;"class="nav_bar_logo" src='image/PLAN16_LOGO.png' /></a>
				<a href="introMBTI.do" class="text-light distance">유형소개</a>
				<a href="board_type.do?page=1" class="text-light distance">유형별게시판</a>
				<a href="board_FREE.do?page=1" class="text-light distance">자유게시판</a>
				<a href="worldcup_choice.do" class="text-light distance">월드컵</a>
				<button onclick="location.href='logout.do'">로그아웃</button>
			</div>
		</nav>
	</header>

<h1>게시판</h1>
<br><br>

<h1 align="center">ENTJ 게시판</h1> <!-- 바꿔야함 -->

<div>
<hr>

<div class="search-box col-md-5">
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <button class="btn btn-light dropdown-toggle" type="button" data-toggle="dropdown" 
            aria-haspopup="true" aria-expanded="false" id="choice" value="title">제목</button>                        
            <div class="dropdown-menu">
              <a href="javascript:void(0);" class="dropdown-item" onclick="func('title')">제목</a>
              <a href="javascript:void(0);" class="dropdown-item" onclick="func('content')">내용</a>
              <a href="javascript:void(0);" class="dropdown-item" onclick="func('writer')">작성자</a>              
            </div>           
        </div>
        <input type="text" class="form-control" aria-label="Search input with dropdown button" id="search" value="">
        <div class="input-group-append">
            <button class="btn btn-success" type="button"  onclick="searchBoard()" style="background-color: #004176;"
            >Search</button>
        </div>
    </div>
</div>





<!--    attribute property -->
	<table id="board_width" class="table table-hover" style="width:1200px" align="center">
	<!-- <col width="30"><col width="200"><col width="80"> -->
	<thead align="center">
	<tr>
	<!-- <th width="100px">번호</th><th width="330px">제목</th><th width="150px">작성자</th><th width="200px">작성날짜</th><th width="150px">조회횟수</th><th width="100px">댓글개수</th> -->
	<th width="80px" align="center">번호</th><th width="480px">제목</th><th width="70px">작성자</th><th width="130px" >작성날짜</th><th width="70">조회횟수</th><th width="70">댓글개수</th>
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
			<td colspan="6">&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 삭제된 글입니다.</td>
		</tr>
		<%
		}
			else{			
				%>
				<tr>
					<th class="text-center"><%=(board_page-1)*20+1+i%></th>
					<td >
						
						<a href="board_detail.do?boardseq=<%=board.getBoardseq() %>" > 
							<%=board.getTitle() %><%if(board.getCommentcount() > 0){ %><span style="color: red">(<%=board.getCommentcount() %>)</span>
							<%} %>
						</a>
					</td>
					
					<td align="center"><%=board.getId() %></td>
					
					
					<td align="center" ><%=board.getWdate().substring(0, board.getWdate().length() - 2) %></td>					
					
					<td align="center" ><%=board.getReadcount() %></td>
										
					<td align="center" ><%=board.getCommentcount() %></td>
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
<a href="board_ENTJ.do?page=<%=i+1%>"><%=i+1%></a> 
<%
}
%>
</div>
</div>

<br>
<div align="center">
	<a href="board_write.do?boardtype=15" class="btn btn-primary pull-right">글쓰기</a>	
</div>
</div>

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
	
	location.href="board_ENTJ.do?page=1&choice=" + choice + "&search=" + search; 
}

</script>

</body>
</html>
