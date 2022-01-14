<%@page import="secure.mbti.a.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        
<%
List<BoardDto> board_list = (List<BoardDto>)request.getAttribute("board_list");
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
				<a href="introMBTI.do" class="text-light distance">유형소개</a>
				<a href="#board_writeAf.do" class="text-light distance">유형별게시판</a>
				<a href="board_free.do" class="text-light distance">자유게시판</a>
				<a href="worldcup_choice.do" class="text-light distance">월드컵</a>
				<button>로그아웃</button>
			</div>
		</nav>
	</header>
<h1></h1>	<br><br>
	<br>
<h1>자유게시판</h1>
<div align="center">

<hr>

<select id="choice">
	<option value="title">제목</option>
	<option value="content">내용</option>
	<option value="writer">작성자</option>
</select>

<input type="text" id="search" value="">

<button type="button" onclick="searchBbs()">검색</button>
</div>
<br><hr><br>

<table class="table">
  <thead class="thead-light">
    <tr>
      <th scope="col">번호</th>
      <th scope="col"> 제목</th>
      <th scope="col">글쓴이</th>
      <th scope="col">작성날짜</th>
      <th scope="col">조회횟수</th>
      <th scope="col">댓글개수</th>
    </tr>
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
			<th><%=i+1%></th>
			<td>
				
				<a href="board_detail.do?boardseq=<%=board.getBoardseq() %>">
					<%=board.getTitle() %>
				</a>
			</td>
			
			<td ><%=board.getId() %></td>
			
			</td>
			
			<td ><%=board.getWdate() %></td>
			
			</td>
			
			<td ><%=board.getReadcount() %></td>
			
			</td>
			
			<td ><%=board.getCommentcount() %></td>
		</tr>

<%
		}
	}
}
%>  
    </thead>
  </tbody>
</table>
</article>
</section>
<div align="center">
<nav aria-label="Page navigation example">
  <ul class="pagination" >
    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">Next</a></li>
  </ul>
</nav>
</div>

	<footer>

        <div align="center">
	<a href="board_write.do" class="btn btn-primary pull-right">글쓰기</a>	
</div>
	</footer>
    <script type="text/javascript">
        function searchBbs(){
            let choice = document.getElementById("choice").value;
            let search = document.getElementById("search").value;
            
            location.href="board_list.do?choice=" + choice + "&search=" + search;
        }
        </script>
</body>
</html>