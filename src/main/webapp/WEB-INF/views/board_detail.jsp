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
MemberDto dto = (MemberDto) request.getAttribute("dto");
%>

<%
List<CommentDto> comments = (List<CommentDto>) request.getAttribute("comments");
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
				<a href="#test" class="text-light distance">유형소개</a> 
				<a href="#test" class="text-light distance">유형별게시판</a> 
				<a href="board_free.do"class="text-light distance">자유게시판</a> 
				<a href="worldcup_choice.do" class="text-light distance">월드컵</a>
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

	<p>글 디테일부분과 댓글이 있는 곳</p>
	<!-- 본문 글 디테일 부분(댓글부분 제외) -->
	<section>
		<div class="wrapper" align="center">
			<!--    attribute property -->
			<table class="table table-bordered" style="width: 1000px">
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
					<td><textarea rows="15" cols="100" name="content" readonly><%=board.getContent()%></textarea></td>
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
			<button type="button" onclick="board_update(<%=board.getBoardseq()%>)">수정</button>
			
			<!-- 아래에 있는 함수 이름 : board_delete -->
			<button type="button" onclick="board_delete(<%=board.getBoardseq()%>)">삭제</button>

			<%
			}
			%>

		</div>
	</section>
	
	

	<!-- 댓글리스트 부분 -->
<section>
	<div id="comment_list" align="center">
		<table>
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
					if (board.getDel() == 1) {
					%>
					<tr>
						<td colspan="4">삭제된 댓글입니다.</td>
					</tr>
					<%
					} else {
					%>
					<tr>
						<!-- 한 줄 -->
						<th><%=i + 1%><hr></th>
						<td>&nbsp<hr></td>
						<!-- 댓글번호 -->
						<td>
							<!-- 한 칸 --> <!-- 작성자 --> <%=comment.getAlias()%><hr>
						</td>
						<td><%=comment.getContent()%><hr></td>
						<td><%=comment.getWdate()%><hr></td>
					</tr>
					<%
					}
					}
					}
					%>

		</table>
		<div style="width: 1000px">	<!-- 댓글적는 부분 -->
			<table>

				<div class="card mb-2">

					<div class="card-header bg-light">
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

								</div> <textarea class="form-control" id="exampleFormControlTextarea1"
									rows="3"></textarea>
								<button type="button" class="btn btn-dark mt-3"
									onClick="javascript:addReply();">댓글 등록</button>
							</li>
						</ul>
					</div>
				</div>
			</table>
		</div>	<!-- 댓글적는 부분 끝 -->
	</div>
</section>
		<!-- wrapper마감 -->

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
			
			
</script>
</body>
</html>