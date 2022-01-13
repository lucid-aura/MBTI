<%@page import="secure.mbti.a.dto.CommentDto"%>
<%@page import="java.util.List"%>
<%@page import="secure.mbti.a.dto.WorldCupDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%

WorldCupDto worldcupresult = (WorldCupDto)request.getAttribute("worldcupresult");
List<CommentDto> comments = (List<CommentDto>)request.getAttribute("comments");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>결과창</title>
</head>
<body>

<div class="wrapper">
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
	
	<section>
	<article>
				<%=worldcupresult.getWorldcupname() %>
				<%=worldcupresult.getTopic() %>
				<%=worldcupresult.getChoicecount() %>
				<%=comments.get(0).getAlias() %>
				<%=comments.get(0).getContent() %>
				<%=comments.get(1).getAlias() %>
				<%=comments.get(1).getContent() %>
	</article>
	</section>
	<footer>
	
	</footer>


</div>

</body>
</html>