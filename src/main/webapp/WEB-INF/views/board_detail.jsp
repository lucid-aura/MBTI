<%@page import="secure.mbti.a.dto.CommentDto"%>
<%@page import="secure.mbti.a.dto.MemberDto"%>
<%@page import="secure.mbti.a.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/bootstrap.css">
<!--지워도됨 -->


<%
BoardDto board = (BoardDto) request.getAttribute("board");
%>
<%
MemberDto dto = (MemberDto) request.getSession().getAttribute("login");
%>

<%
List<CommentDto> comments = (List<CommentDto>) request.getAttribute("comments");
%>
<%
int comment_count = (Integer)request.getAttribute("comment_count");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>




</head>
<body>
	<header>
		<nav>
			<div class="fixed-top py-3 px-3 bg-dark text-center" id="nav">
				<a href="#test" class="text-light distance">유형소개</a> <a href="#test"
					class="text-light distance">유형별게시판</a> <a href="board_free.do"
					class="text-light distance">자유게시판</a> <a href="worldcup_choice.do"
					class="text-light distance">월드컵</a>
				<button>로그아웃</button>
			</div>
		</nav>
	</header>
	<br>
	<hr>
	<br>
	<br>
	<br>
	<br>
	<br>

	
	<!-- 본문 글 디테일 부분(댓글부분 제외) -->
	<section>
		<div class="wrapper" align="center">
			<!--    attribute property -->
			<table class="table table-bordered" border="0" style="width: 1000px">
				<!-- <col width="30"><col width="200"><col width="80"> -->
				<%
				if (board == null) {
				%>
				<tr>
					<td colspan="3">글을 읽어올 수 없습니다..</td>
				</tr>
				<%
				} else {
				%>
				<tr>
					<th>작성자</th>
					<td><%=board.getId()%></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><%=board.getTitle()%></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td><%=board.getWdate()%></td>
				</tr>
				<tr>
					<th>조회수</th>
					<td><%=board.getReadcount()%></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="15" cols="100" name="content" style="border: none" readonly><%=board.getContent()%></textarea></td>
				</tr>

				<%
				}
				%>
			</table>
			<%
			MemberDto mem = (MemberDto) request.getSession().getAttribute("login");
			%>

			<%
			if (mem.getId().equals(board.getId())) {
			%>
			<!-- 아래에 있는 함수 이름 : board_update -->
			<button type="button" class="btn btn-dark" onclick="board_update(<%=board.getBoardseq()%>)">수정</button>
			
			<!-- 아래에 있는 함수 이름 : board_delete -->
			<button type="button" class="btn btn-danger" onclick="board_delete(<%=board.getBoardseq()%>)">삭제</button>
			
			<button type="button" class="btn btn-dark" onclick="board_free(<%=board.getBoardseq()%>)">목록</button>

			<%
			}
			%>
			

		</div>
	</section>
	


		</table>
		</form>

	</div>
	  
<section>
	<div id="comment_list" align="center">

		<table>
			<!-- 댓글개수 -->
		<div align="center">
		<br><br><br>
		<button type="button" class="btn btn-light">댓글 수 <%= comment_count%></button><br><br>
		</div>
					<%
					if (comments == null || comments.size() == 0) {
					%>
					<tr>
						<td colspan="4">작성된 댓글이 없습니다.</td>
					</tr>
					<%
					} else {
					for (int i = 0; i < comments.size(); i++) {
						CommentDto comment = comments.get(i);
					%>
					<%
					if (comment.getDel() == 1) {
					%>
					<tr>
						<td colspan="4" align="center">삭제된 댓글입니다.</td>
					</tr>
					<%
					} else {
					%>
					
					<tr onClick="location.href='comment_update.do?commentseq=<%=comment.getCommentseq() %>'" style = "cursor:pointer;">

						<!-- 한 줄 -->
						<th><%=i + 1%>&nbsp&nbsp&nbsp<hr></th>
						<td>&nbsp<hr></td>
						<!-- 댓글번호 -->
						<td>
							<!-- 한 칸 --> <!-- 작성자 --> <%=comment.getAlias()%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<hr>
						</td>
						<td><%=comment.getContent()%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<hr></td>
						<td><%=comment.getWdate()%><hr></td>
						
					</tr>
					<%
					}
					}
					}
					%>

		</table>
		<form action="comment.do" method="post">
		<div style="overflow: auto">
		<input type="hidden" name="boardseq" value="<%=board.getBoardseq()%>">
		<input type="hidden" name="alias" value="<%=dto.getAlias()%>">
		</div>

		<div style="width: 1000px">	<!-- 댓글적는 부분 -->
			<table>
				<div class="card mb-2">
					<div class="card-header bg-light" style="align-content: left">
						<i class="fa fa-comment fa">댓글</i>
					</div>
					<div class="card-body">
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<div class="form-inline mb-2">
									<!--아이디 입력부분 일시삭제 <label for="replyId"><i
										class="fa fa-user-circle-o fa-2x"></i></label> <input type="text"
										class="form-control ml-2" placeholder="Enter yourId"
										id="replyId"> -->

								</div> <textarea class="form-control" id="exampleFormControlTextarea1" name="content"
									rows="3"></textarea><br>
								<button type="submit" class="btn btn-danger">댓글 등록</button><!-- onClick="javascript:addReply();" -->

							</li>
						</ul>
					</div>
				</div>
			</table>
		</div>
		</form>

<script type="text/javascript">

/* 		답글	일단 제외
			function answer( boardseq ){
				location.href = "answer.do?seq=" + seq;
			} */
			function board_update( boardseq ){
				location.href = "board_update.do?boardseq=" + boardseq;
			}
			function board_delete( boardseq ){
				location.href = "board_delete.do?boardseq=" + boardseq;
			}
			function board_free( boardseq ){
				location.href = "board_free.do?boardseq=" + boardseq;
			}
			
			
			
			/*
			function comment_update( boardseq ){
				location.href = "board_detail.do?boardseq=" + boardseq;
			}*/
			
/*댓글 수정 버튼
$("#btn_commentUp").click(function(){
	var commentupdate = $("#commentupdate").val();
	$.ajax({
		type:"put",
		url:"${path}/comment/comment_update/${dto.boardseq}",
		header:{
			"Content-Type":"application/json"
		}
	})
}
*/
			
			

</script>
</body>
</html>