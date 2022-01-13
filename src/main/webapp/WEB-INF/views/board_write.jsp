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
List<BoardDto> board_list = (List<BoardDto>)request.getAttribute("board_list");
%>

<%
List<CommentDto> comments = (List<CommentDto>)request.getAttribute("comments"); 
%>
    
<% /*  MemberDto mem = request.getSession().getAttribute("login");*/ %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p align="center">이곳은 글쓰기 영역(board_write.do)</p>

	<section>
		<article style="margin: 250px" padding="50px">
			<div id="containerAll"> 
			<form action="board_writeAf.do" method="post">

			<input type="text" name="id" class="form-control mt-4 mb-2" size="70px" value="임시아이디(mem.getId() %>)" readonly>
				<input type="text" name="bdTitle" class="form-control mt-4 mb-2"
					placeholder="제목을 입력해주세요." required>
				<div class="form-group">
					<textarea class="form-control" rows="10" name="bdContent"
						placeholder="내용을 입력해주세요" required></textarea>
				</div>
				<button type="submit" class="btn btn-dark mt-3"">등록</button>
				<button type="button" class="btn btn-dark mt-3" onclick="location.href='board_free.do'">취소</button>
	
			</form>
			
				<div class="card mb-2">
					<div class="card-header bg-light">
						<i class="fa fa-comment fa"></i> 댓글
					</div>
					<div class="card-body">
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
								<div class="form-inline mb-2">
									<label for="replyId"><i
										class="fa fa-user-circle-o fa-2x"></i></label> <input type="text"
										class="form-control ml-2" placeholder="Enter yourId"
										id="replyId">

								</div> <textarea class="form-control" id="exampleFormControlTextarea1"
									rows="3"></textarea>
								<button type="button" class="btn btn-dark mt-3"
									onClick="javascript:addReply();">post reply</button>
							</li>
						</ul>
					</div>
				</div>
			</div>

		</article>
	</section>
	
	<script type="text/javascript">


 </script>

</body>
</html>