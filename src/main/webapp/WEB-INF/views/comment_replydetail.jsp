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

<form action="comment_replydetailAf.do" id="replywindow" method="post">
<br><br><br><br>
		<div align="center" style="text-decoration: underline;">
		<input type="hidden" name="commentseq" value="<%=comment.getCommentseq()%>">
		<input type="hidden" name="ref" value="<%=comment.getRef()%>">
		<input type="hidden" name="step" value="<%=comment.getStep()%>">
		<input type="hidden" name="depth" value="<%=comment.getDepth()%>">
		<input type="hidden" name="alias" value="<%=dto.getAlias()%>">
		<input type="hidden" name="boardseq" value="<%=comment.getBoardseq()%>">
		<%=dto.getAlias()%>&nbsp&nbsp&nbsp&nbsp
		<%=comment.getContent()%>
		</div>
		<br><br><br><br>

		<div style="width: 1000px">	<!-- 댓글적는 부분 -->
			<table>
				<div class="card mb-2">
					<div class="card-header bg-light" align="center">
						<i class="fa fa-comment fa">댓글 (위 댓글의 답글을 작성하세요.)</i>
					</div>
					<div class="card-body">
						<ul class="list-group list-group-flush">
							<li class="list-group-item" align="center">
								<div class="form-inline mb-2">
								</div> <textarea class="form-control" id="commentcontentform" name="content"
									rows="3"></textarea><br>
								<button type="button" onclick="replyclose()" class="btn btn-danger">답글 등록</button><!-- onClick="javascript:addReply();" --> <!--onClick="comment_check()"  -->
							</li>
						</ul>
					</div>
				</div>
			</table>
		</div>
		</form>
		<script type="text/javascript">
		function replyclose(){
			// form에서의 name은 json으로 따로 넣어줘야하기 때문에 key, value로 묶어주는(Jsonify) 함수
			$.fn.serializeObject = function() { 
				  "use strict"
				  var result = {}
				  var extend = function(i, element) {
				    var node = result[element.name]
				    if ("undefined" !== typeof node && node !== null) {
				      if ($.isArray(node)) {
				        node.push(element.value)
				      } else {
				        result[element.name] = [node, element.value]
				      }
				    } else {
				      result[element.name] = element.value
				    }
				  }
				  $.each(this.serializeArray(), extend)
				  return result
				}
				var serializeObject = $('#replywindow').serializeObject();

			$.ajax({
	            url : "comment_replydetailAf.do", // 컨트롤러에 ajax 요청
	            type : 'POST', 
	            data : serializeObject, 
	            success : function(res) {
	                if (res == "commit"){
	                	opener.window.location.reload();
	                	self.close();
	                }
	            }, // error 
	            error : function(xhr, status) {
	                alert(xhr + " : " + status);
	            }
	        })
		}
		
		</script>
</body>


</html>