<%@page import="secure.mbti.a.dto.CommentDto"%>
<%@page import="secure.mbti.a.dto.MemberDto"%>
<%@page import="secure.mbti.a.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/bootstrap.css">
<!--지워도됨 -->
<!-- 댓글삭제부분 : style 마진 16px 추가 -->

<%
BoardDto board = (BoardDto) request.getAttribute("board");
%>
<%
MemberDto dto = (MemberDto) request.getSession().getAttribute("login");
%>

<%
CommentDto commentDto = (CommentDto) request.getAttribute("comment_update");  // 콘트롤 키값
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
	
<!-- 강사님 부트스트렙 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

#btn btn-dark mt-3{
<style type="text/css"></style>
 }



</head>
<body>
	<header>
		<nav>
			<div class="fixed-top py-3 px-3 bg-dark text-center" id="nav">
				<a href="#test" class="text-light distance">유형소개</a> <a href="#test"
					class="text-light distance">유형별게시판</a> <a href="board_free.do?page=1"
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
<br><br>
		</div>
	</section>
	


		</table>
		</form>

	</div>
	  
<section>
	<div id="comment_list" align="center">

		<!-- 수정부분 -->
		<form action="comment_updateAf.do" method="post">
		<div style="overflow: auto">
		<input type="hidden" name="commentseq" value="<%=commentDto.getCommentseq()%>">
		<input type="hidden" name="boardseq" value="<%=commentDto.getBoardseq()%>">
		<input type="hidden" name="alias" value="<%=commentDto.getAlias()%>">
		</div>
		
		<div style="width: 1000px">	<!-- 댓글적는 부분 -->
			<table>
				<div class="card mb-2">
					<div class="card-header bg-light" style="align-content: left">
						<i class="fa fa-comment fa">수정 중인 댓글</i>
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
									rows="3"><%=commentDto.getContent()%></textarea>
								<button type="submit" class="btn btn-dark mt-3 center">댓글 수정</button><!-- onClick="javascript:addReply();" -->
								<button type="button" class="btn btn-danger center" onclick="location.href='comment_delete.do?commentseq=<%=commentDto.getCommentseq()%>'" style="margin-top: 16px">댓글 삭제</button>
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
				location.href = "board_free.do?boardseq=" + boardseq + "&page=1";
			}
			
			
			
			/*
			function comment_update( boardseq ){
				location.href = "board_detail.do?boardseq=" + boardseq;
			}*/
			

			
			

</script>
</body>
</html>