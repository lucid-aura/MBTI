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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>결과창</title>
</head>
<body>
	<div class="wrapper">
		<header>
			<nav>
				<div class="fixed-top py-3 px-3 bg-dark text-center" id="nav">
					<a href="#test" class="text-light distance">유형소개</a> <a
						href="#test" class="text-light distance">유형별게시판</a> <a
						href="#test" class="text-light distance">자유게시판</a> <a
						href="worldcup_choice.do" class="text-light distance">월드컵</a>
					<button>로그아웃</button>
				</div>
			</nav>
		</header>

		<section>
			<div class="worldcup_result">
				<article>
					<div>
						<%=worldcupresult.getTopic()%>에서 당신의 선택은
						<%=worldcupresult.getWorldcupname()%>입니다.
						<br>
						전체 선택 횟수 : <%=worldcupresult.getChoicecount()%>

					</div>
					<div  class="worldcup_result_left">
						<img src='image/<%=worldcupresult.getWorldcupname()%>.jpg' class="choice" />
					</div>
					<div class="worldcup_result_right">			
						<table class="table table-hover">
							<thead>
							<tr bgcolor="#d3d3d3">
								<th>번호</th><th>닉네임</th><th>내용</th><th>수정</th><th>삭제</th>
							</tr>
							</thead>
							<tbody  id="worldcup_table">
							<%
							for (int i = 0; i < Math.min(8, comments.size()); i++) {
								if (comments.get(i).getDel() == 1){
							%>
								<tr><td colspan=5>삭제된 댓글입니다.</td></tr>
							<%
								}
								else{
							%>
								<tr>
								<td><%=i+1 %></td>
								<td width="150px"><%=comments.get(i).getAlias()%></td>
								<td width="500px" style="word-break:break-all"><%=comments.get(i).getContent()%></td>
								<%
									// member에서 alias를 받아와서 비교
									if (comments.get(i).getAlias().equals("hsh")){
								%>
										<td><span class="glyphicon glyphicon-repeat"></span></td>
										<td><button type="button" class="btn-close" onclick="delete_worldcup_comment(<%=comments.get(i).getCommentseq()%>)"></button></td>
								<%
									}
									else{
								%>
										<td><span  style="display: none;" class="glyphicon glyphicon-repeat"></span></td>
										<td><button type="button" style="display: none;" class="btn-close"></button></td>
								<%
									}
								}
							}
							%>
							</tbody>
						</table>
						<div id="worldcup_page">
						<% for (int i = 0; i<(int)(comments.size()-1)/8+1; i++) {%>
						
						<a href="javascript:void(0);" onclick="comment_page(<%=i%>)">[<%=i+1 %>]</a>
				
						<%} %>
						</div>
						<div style="">
						<input type="text" id="worldcup_input" size="90%" style="vertical-align:middle;"><button type="button" id="worldcup_submit" class="btn btn-dark float-right" >댓글달기</button>
						</div>

					</div>
				</article>
			</div>
		</section>

		<footer> </footer>


	</div>
<script type="text/javascript">
var comment_list = [];
$(document).ready(function () {


	
	<%
	for (int i=0; i < comments.size(); i++){	
	%>
	comment_list.push({
		alias: '<%=comments.get(i).getAlias()%>',
		boardseq: <%=comments.get(i).getBoardseq()%>,
		commentseq: <%=comments.get(i).getCommentseq()%>,
		content: '<%=comments.get(i).getContent()%>',
		del: <%=comments.get(i).getDel()%>,
		wdate: '<%=comments.get(i).getWdate()%>'
	});
	<% 
	}
	%>	
	console.log(comment_list);
	$("#worldcup_submit").click(function() {
		// alert('click');
		//$.ajax( {url:"idcheck.do",type:"post",data:{ id:$("#id").val() },success:
		$.ajax({
			url:"worldcup_result.do",
			type: "POST",
			data: { // ----------- 보낼 데이터 세팅
				/* alias: member.getAlias()*/
				alias: "hsh",
				boardseq : "<%=worldcupresult.getBoardseq()%>",
				content : $("#worldcup_input").val()
			},
			success:function( rep ){
				// alert(rep);
				// console.log(rep);
				// 테이블 갱신 
				// 아랫 줄은 약간의 꼼수
				// 'hsh' 부분에 닉네임이 들어가야함.				
				comment_list = rep;

				comment_page(0);
			},
			error:function(){
				alert('error');
			}
		});
	});
		
});

function delete_worldcup_comment(seq){
	alert("delete");
	$.ajax({
		url:"worldcup_detele_comment.do",
		type: "POST",
		data: { // ----------- 보낼 데이터 세팅
			/* alias: member.getAlias()*/
			commentseq: seq,
			boardseq : <%=worldcupresult.getBoardseq()%>
		},
		success:function( rep ){
			console.log(rep)
/* 			var temp = rep;
			console.log(temp.content); */
			comment_list = rep;
			comment_page(0);
		},
		error:function(){
			alert('error_delete');
		}
	});
}
	
function comment_page(index) {
	// console.log(comment_list);
	var table = document.getElementById('worldcup_table');
/* 	table.innerHTML = '<thead><tr bgcolor="#d3d3d3"><th>번호</th><th>닉네임</th><th>내용</th>	<th>삭제</th></tr></thead>';
	var tbody =  */
	table.innerHTML = '';
	for (var i=index*8; i < index*8 + Math.min(comment_list.length - index*8, 8); i++) { 
		if (comment_list[i]['del'] == 1){
			var row = '<tr><td colspan=4>삭제된 댓글입니다.</td></tr>';
			table.innerHTML += row;
		}
		else {
			var show_delete = '';
			// member의 alias를 가져와서 비교
			if (comment_list[i]['alias'] == 'hsh'){
				show_delete = '<td><button type="button" class="btn-close" onclick="delete_worldcup_comment(' + comment_list[i]['commentseq'] +')"></button></td>';	
			}
			else{
				show_delete = '<td><button type="button"  style="display: none;" class="btn-close"></button></td>';
			}
			//var row = '<tr><td>'+ (i+1) +'</td><td  width="150px">' + comment_list[i][0] +'</td><td width="500px"  style="word-break:break-all">' + comment_list[i][1] + '</td><td><button type="button" class="btn-close" aria-label="Close"></button></td></tr>';
			var row = 
			'<tr>'+
				'<td>'+ (i+1) +'</td>' +
				'<td width="150px">' + comment_list[i]['alias'] +'</td>'+
				'<td width="500px" style="word-break:break-all">' + comment_list[i]['content'] + '</td>' +
				show_delete +
			'</tr>';
			table.innerHTML += row;
		}
	}
	var worldcup_page = document.getElementById('worldcup_page');
	worldcup_page.innerHTML = "";
	for (var i = 0; i<parseInt((comment_list.length-1)/8) + 1; i++) {
		worldcup_page.innerHTML += "<a href='#' onclick='comment_page(" + i + ")'>[" + (i+1) + "]</a> ";
	}
}
</script>
</body>
</html>