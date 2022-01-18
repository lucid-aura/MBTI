<%@page import="secure.mbti.a.dto.MemberDto"%>
<%@page import="secure.mbti.a.dto.CommentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
CommentDto comment = (CommentDto) request.getAttribute("comment");
%>
<%
MemberDto dto = (MemberDto) request.getSession().getAttribute("login");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="comment_replydetailAf.do" method="post" id="replywindow">

		<input type="hidden" name="commentseq" value="<%=comment.getCommentseq()%>">
		<input type="hidden" name="ref" value="<%=comment.getRef()%>">
		<input type="hidden" name="step" value="<%=comment.getStep()%>">
		<input type="hidden" name="depth" value="<%=comment.getDepth()%>">
		<input type="hidden" name="alias" value="<%=dto.getAlias()%>">
		<input type="hidden" name="boardseq" value="<%=comment.getBoardseq()%>">
		<%=dto.getAlias()%>
		<%=comment.getContent()%>

		<div style="width: 1000px">	<!-- 댓글적는 부분 -->
			<table>
				<div class="card mb-2">
					<div class="card-header bg-light" style="align-content: left">
						<i class="fa fa-comment fa">댓글 (위 댓글의 답글을 작성하세요.)</i>
					</div>
					<div class="card-body">
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<div class="form-inline mb-2">
									<!--아이디 입력부분 일시삭제 <label for="replyId"><i
										class="fa fa-user-circle-o fa-2x"></i></label> <input type="text"
										class="form-control ml-2" placeholder="Enter yourId"
										id="replyId"> -->

								</div> <textarea class="form-control" id="commentcontentform" name="content"
									rows="3"></textarea><br>
									
								<button type="button" onclick="replyclose()" class="btn btn-danger">댓글 등록</button><!-- onClick="javascript:addReply();" --> <!--onClick="comment_check()"  -->

							</li>
						</ul>
					</div>
				</div>
			</table>
		</div>
		</form>
		<script type="text/javascript">
		function replyclose(){
			/* window.opener.name = "parentPage"; // 부모창의 이름 설정 */
			
			var replycommentwindow=document.getElementById('replywindow');
			opener.parent.location='board_detail.do?boardseq=<%=comment.getBoardseq()%>';//부모창에 호출될 url 
			
			opener.parent.location.reload();
			replycommentwindow.submit();
		    self.close();


		   /*  self.close();
 */
		}
		</script>
</body>


</html>