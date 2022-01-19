<%@page import="secure.mbti.a.dto.MemberDto"%>
<%@page import="secure.mbti.a.dto.CommentDto"%>
<%@page import="secure.mbti.a.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css?version=3">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<%
List<BoardDto> board_list = (List<BoardDto>)request.getAttribute("board_list");
%>
<%
int board_write = (int)request.getAttribute("boardtype");
%>

<%
List<CommentDto> comments = (List<CommentDto>)request.getAttribute("comments"); 
%>
    
<%
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
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
			<div class="fixed-top py-3 px-3 text-center deepblue"  id="nav">
				<a href="introMBTI.do" ><img style="width:80px; heigth:20px;"class="nav_bar_logo" src='image/PLAN16_LOGO.png' /></a>
				<a href="introMBTI.do" class="text-light distance">유형소개</a>
				<a href="board_type.do?page=1" class="text-light distance">유형별게시판</a>
				<a href="board_FREE.do?page=1" class="text-light distance">자유게시판</a>
				<a href="worldcup_choice.do" class="text-light distance">월드컵</a>
				<button type="button" class="btn btn-light btn-default btn-sm" onclick="location.href='logout.do'">로그아웃</button>
			</div>
		</nav>
	</header>
<!-- 고정바 -->



	<section>
		<article style="margin: 250px" padding="50px">
			<div id="containerAll"> 
			<form action="board_writeAf.do" method="post">
				<input type="hidden" name="boardtype" value="<%=board_write%>">
				<input type="text" name="id" class="form-control mt-4 mb-2" size="70px" value="<%=mem.getId()%>" readonly>	
				<input type="text" name="title" class="form-control mt-4 mb-2"
					placeholder="제목을 입력해주세요." required>
				<div class="form-group">
					<textarea class="form-control" rows="10" name="content"
						placeholder="내용을 입력해주세요" required></textarea>
				</div>
				<button type="submit" name="btn_check" class="btn btn-dark mt-3"">등록</button>
				<button type="button" name="btn_cancle" class="btn btn-dark mt-3" onclick="location.href='board_cancle.do?boardtype=<%=board_write%>'">취소</button>
	
			</form>
			</div>
		</article>
	</section>

	</div>
	
	<script type="text/javascript">


 </script>

</body>
</html>