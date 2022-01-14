<%@page import="secure.mbti.a.dto.MemberDto"%>
<%@page import="secure.mbti.a.dto.CommentDto"%>
<%@page import="secure.mbti.a.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/bootstrap.css"> <!--지워도됨 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<%
BoardDto board = (BoardDto) request.getAttribute("board");
%>
<%
MemberDto dto = (MemberDto) request.getAttribute("dto");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">

<!-- 고정바 -->
	<header>
		<nav>
			<div class="fixed-top py-3 px-3 bg-dark text-center" id="nav">
				<a href="#test" class="text-light distance">유형소개</a>
				<a href="#test" class="text-light distance">유형별게시판</a>
				<a href="board_free.do" class="text-light distance">자유게시판</a>
				<a href="worldcup_choice.do" class="text-light distance">월드컵</a>
				<button>로그아웃</button>
			</div>
		</nav>
	</header>
<!-- 고정바 -->



	<section>
		<article style="margin: 250px" padding="50px">
			<div id="containerAll"> 
			<form action="board_updateAf.do" method="post">
			<input type="hidden" name="boardseq" value="<%=board.getBoardseq()%>">
				<input type="text" name="id" class="form-control mt-4 mb-2" size="70px" value=<%=board.getId()%> readonly>	
				<input type="text" name="title" class="form-control mt-4 mb-2"
					placeholder="제목을 입력해주세요." value="<%=board.getTitle()%>" required>
					<br>
				<div class="form-group">
					<textarea class="form-control" rows="10" name="content"
						placeholder="내용을 입력해주세요" required><%=board.getContent()%></textarea>
				</div>
				<input type="submit" value="수정하기">
	
			</form>
			</div>
		</article>
	</section>
	<footer>
	<p>저작권표시</p>
	</footer>
	</div>
	
	<script type="text/javascript">


 </script>

</body>
</html>