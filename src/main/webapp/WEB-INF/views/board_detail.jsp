<%@page import="secure.mbti.a.dto.CommentDto"%>
<%@page import="secure.mbti.a.dto.MemberDto"%>
<%@page import="secure.mbti.a.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/bootstrap.css">
<!--지워도됨 -->

<%!
public String arrow(int depth){
	String res = "<img src='image/arrow.png' width='20px' height='20px' />";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;"; // 여백
	
	String ts = "";
	for(int i = 0; i<depth; i++){
		ts += nbsp;
	}
	
	return depth==0?"":ts+res;
}
%>
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
<style type="text/css">
#table_detail{
	 border-collapse:collapse;
}

</style>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css?version=3">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</head>
<body onunload="close_popup()">
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
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	



	
	<!-- 본문 글 디테일 부분(댓글부분 제외) -->
	<section>
		<div align="center">
		<div>
			<!--    attribute property -->
			<table id="table_detail" class="table table-bordered"  border="0" style="width: 1000px">
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
			</div>
			<div align="center">
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
			
			<button type="button" class="btn btn-dark" onclick="location.href='board_backlist.do?boardtype=<%=board.getBoardtype()%>'">목록</button>

			<%
			}
			%>
			</div>

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
		<button type="button" class="btn btn-light"><p style="font-weight:bold; margin: 10px 15px;">댓글 <%= comment_count%></p></button><br><br>
		</div>
					<%
					if (comments == null || comments.size() == 0) {
					%>
					<tr>
						<td colspan="4">작성된 댓글이 없습니다.<br><br></td>
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
						<td colspan="4" align="center">삭제된 댓글입니다.<br><br></td>
					</tr>
					<%
					} else {
					%>
					
					<%-- <tr onClick="location.href='comment_update.do?commentseq=<%=comment.getCommentseq() %>'" style = "cursor:pointer;"> --%>
					<tr id="btn_comment_check">
<%-- "location.href='comment_update.do?commentseq=<%=comment.getCommentseq() %>'" --%>
						<!-- 한 줄 -->
						<th onClick="comment_check(<%=comment.getCommentseq()%>)" style = "cursor:pointer; display:none;" ><%=i + 1%>&nbsp&nbsp&nbsp</th>
						<td>&nbsp<hr></td>
						<!-- 댓글번호 --> 
						<td onClick="comment_check(<%=comment.getCommentseq()%>)" style = "cursor:pointer;">
							<!-- 한 칸 --> <!-- 작성자 --> <%=comment.getAlias()%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						</td>
						<td onClick="comment_check(<%=comment.getCommentseq()%>)" style = "cursor:pointer; width: 650px; word-break:break-all;"><%=arrow(comment.getDepth()) %>&nbsp&nbsp<%=comment.getContent()%>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
						<td onClick="comment_check(<%=comment.getCommentseq()%>)" style = "cursor:pointer;"><%=comment.getWdate().substring(0, comment.getWdate().length()-2)%></td>
						<td>&nbsp&nbsp&nbsp&nbsp<button class="btn btn-light" onClick="comment_replycontent(<%=comment.getCommentseq()%>)">답글</button>
						</td>
						
					</tr>
					
					
					<%
					}
					}
					}
					%>

		</table>
		<br>
		<form action="comment.do" method="post" id="btn_check">

		<input type="hidden" name="boardseq" value="<%=board.getBoardseq()%>">
		<input type="hidden" name="alias" value="<%=dto.getAlias()%>">

		<div style="width: 1000px">	<!-- 댓글적는 부분 -->
			<table>
				<div class="card mb-2">
					<div class="card-header bg-light" style="align-content: left">
						<i class="fa fa-comment fa">댓글 (위 댓글 클릭시 수정/삭제가 가능합니다.)</i>
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
									
								<button type="button" onClick="comment_checkcomment()" class="btn btn-danger">댓글 등록</button><!-- onClick="javascript:addReply();" --> <!--onClick="comment_check()"  -->

							</li>
						</ul>
					</div>
				</div>
			</table>
		</div>
		</form>

<script type="text/javascript">
	var commentshow;

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
			function board_free(boardseq){
				location.href = "board_free.do?boardseq= + " + boardseq + "&page=1";
			}
			
			//댓글등록 빈값을 넣어 오류날때
			function comment_checkcomment(){ 
				var check = $("#exampleFormControlTextarea1").val();
				check.trim();
				if( check=="" || check == null || check == undefined ){ 
					alert("내용을 입력하세요.");
				}
				else{
					$("#btn_check").submit();
					
				}
			};
			
			function comment_check(commentseq){
				var ff =$("#btn_comment_check").children('td').eq(1).text().trim();
				console.log(ff);
				if(ff == "<%=dto.getAlias()%>"){
					location.href="comment_update.do?commentseq=" + commentseq;
				} else{
					alert("댓글작성자가 아닙니다.")
				}
			
				<%-- "location.href='comment_update.do?commentseq=<%=comment.getCommentseq() %>'" --%>
			}
			
			//리뷰
			function comment_replycontent(commentseq){
				if(commentshow !=null){
					commentshow.close();
				}
			
				let link = 'comment_replycontent.do?commentseq='+commentseq;
				commentshow = window.open(link,'','width=1000, height=600, resizable=no');
				commentshow.focus();
				
				
				
				//window.close();
			}
			function close_popup(){
				if(commentshow !=null){
					commentshow.close();
				}
				location.href="board_detail.do";
			}

</script>
</body>
</html>