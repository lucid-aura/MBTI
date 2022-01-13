<%@page import="secure.mbti.a.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/css/bootstrap.css"> <!--지워도됨 -->
    
    <%
BoardDto board = (BoardDto)request.getAttribute("board");
%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</head>
<body>
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
	
	<div class="wrapper">



<p>여긴 댓글이 있는 곳입니다</p>

<div align="center">
<!--    attribute property -->
	<table class="table table-bordered" style="width:1000px">
	<!-- <col width="30"><col width="200"><col width="80"> -->
<%
if(bbs == null){	
%>
	<tr>
		<td colspan="3">글을 읽어올 수 없습니다..</td>
	</tr>
<%
}
else{
%>
	<tr>
	<th>작성자</th>
	<td><%=bbs.getId() %></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><%=bbs.getTitle() %></td>
	</tr>
		<tr>
		<th>작성일</th>
		<td><%=bbs.getWdate() %></td>
	</tr>
	<tr>
		<th>조회수</th>
		<td><%=bbs.getReadcount() %></td>
	</tr>
	<tr>
		<th>정보</th>
		<td><%=bbs.getRef() %>-<%=bbs.getStep() %>-<%=bbs.getDepth() %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="15" cols="100" name="content" readonly><%=bbs.getContent() %></textarea></td>
	</tr>

<%
}
%>
			
	</table>

<%
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");

%>
<button type="button" onclick="answer( <%=bbs.getSeq() %> )">답글</button>

<%
if (mem.getId().equals(bbs.getId())){
%>

<button type="button" onclick="updatebbs( <%=bbs.getSeq() %>)">수정</button>

<button type="button" onclick="deletebbs(<%=bbs.getSeq() %>)">삭제</button>
	
<%
}
%>
</div>

<script type="text/javascript">
function answer( seq ){
	location.href = "answer.do?seq=" + seq;
}
function updatebbs( seq ){
	location.href = "updatebbs.do?seq=" + seq;
}
function deletebbs( seq ){
	location.href = "deletebbs.do?seq=" + seq;
}

<div class="card mb-2">
	<div class="card-header bg-light">
	        <i class="fa fa-comment fa"></i> REPLY
	</div>
	<div class="card-body">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
			<div class="form-inline mb-2">
				<label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
				<input type="text" class="form-control ml-2" placeholder="Enter yourId" id="replyId">
				<label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
				<input type="password" class="form-control ml-2" placeholder="Enter password" id="replyPassword">
			</div>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
			<button type="button" class="btn btn-dark mt-3" onClick="javascript:addReply();">post reply</button>
		    </li>
		</ul>
	</div>
</div>
</div><!-- wrapper마감 -->
<footer>
	<p>저작권표시</p>
</footer>
<script type="text/javascript">
function writeAf() {
	location.href = "board_detail.do";
}
</script>
</body>
</html>