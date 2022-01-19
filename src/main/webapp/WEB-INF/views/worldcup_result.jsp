<%@page import="secure.mbti.a.dto.MemberDto"%>
<%@page import="secure.mbti.a.dto.CommentDto"%>
<%@page import="java.util.List"%>
<%@page import="secure.mbti.a.dto.WorldCupDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
WorldCupDto worldcupresult = (WorldCupDto)request.getAttribute("worldcupresult");
List<CommentDto> comments = (List<CommentDto>)request.getAttribute("comments");
MemberDto member = (MemberDto)request.getSession().getAttribute("login");
/* if (session.){
	response.sendRedirect("home.do");
} */
// Member 가져와야함

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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

<title>결과창</title>
</head>
<body>
	<div class="wrapper">
		<header>
		<nav>
			<div class="fixed-top py-3 px-3 text-center deepblue"  id="nav">
				<a><img class="nav_bar_logo" src='image/PLAN16_LOGO.png' /></a>
				<a href="introMBTI.do" class="text-light distance">유형소개</a>
				<a href="board_type.do?page=1" class="text-light distance">유형별게시판</a>
				<a href="board_FREE.do?page=1" class="text-light distance">자유게시판</a>
				<a href="worldcup_choice.do" class="text-light distance">월드컵</a>
				<button onclick="location.href='logout.do'">로그아웃</button>
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
								<th width="50px">번호</th><th width="150px">닉네임</th><th width="410px">내용</th><th>날짜</th><th width="50px">수정</th><th width="50px">삭제</th>
							</tr>
							</thead>
							<tbody  id="worldcup_table">
							<%
							int idx = (int)((comments.size()-1)/8);
							for (int i = 8*idx ; i < idx*8 + Math.min(8, (int)comments.size() - idx*8); i++) {
								if (comments.get(i).getDel() == 1){
							%>
								<tr><td colspan=6>삭제된 댓글입니다.</td></tr>
							<%
								}
								else{
							%>
								<tr>
								<td><%=i+1 %></td>
								<td width="150px" ><%=comments.get(i).getAlias()%></td>
								
								<%
									// member에서 alias를 받아와서 비교
									if (comments.get(i).getAlias().equals(member.getAlias())){
								%>
										<%-- <td width="500px" style="word-break:break-all"><input class="form-control"  type="text" style="width:500px;"  value="<%=comments.get(i).getContent()%>" ></td> --%>
										<td width="410px" style="word-break:break-all" >
											<span style="cursor:pointer"title="대댓창 열기" onclick="toggle_reply(<%=i%>)"><%=arrow(comments.get(i).getDepth()) %><%=comments.get(i).getContent()%></span>
											<span style="display:none"><br>
												<input type="text" size="42%" value="">
												<button type="button" onclick="worldcup_reply_comment(<%=i%>)" class="btn btn-success" style="float:right;"><i class="bi bi-check-circle"   style="float:right;"></i></button>
											</span>
										</td>
										<td><%=comments.get(i).getWdate().substring(0, comments.get(i).getWdate().length() - 2)%></td>
										<td><i class="bi bi-pencil-square" style="cursor:pointer" aria-hidden="true" onclick="update_worldcup_comment(<%=comments.get(i).getCommentseq()%>, <%=i%>)"></i></td>
										<td><button type="button" class="btn-close" onclick="delete_worldcup_comment(<%=comments.get(i).getCommentseq()%>, <%=(int)i/8 %>)"></button></td>
								<%
									}
									else{
								%>
										<td width="410px" style="word-break:break-all"><%=comments.get(i).getContent()%></td>
										<td><%=comments.get(i).getWdate().substring(0, comments.get(i).getWdate().length() - 2)%></td>
										<td><i  style="display: none;" class="bi bi-pencil-square"></i></td>
										<td><button type="button" style="display: none;" class="btn-close"></button></td>
								<%
									}
								}
								%>
								</tr>
								<%
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
		commentseq: <%=comments.get(i).getCommentseq()%>,
		alias: '<%=comments.get(i).getAlias()%>',
		boardseq: <%=comments.get(i).getBoardseq()%>,
		ref:<%=comments.get(i).getRef()%>,
		step:<%=comments.get(i).getStep()%>,
		depth:<%=comments.get(i).getDepth()%>,
		content: '<%=comments.get(i).getContent()%>',
		del: <%=comments.get(i).getDel()%>,
		wdate: '<%=comments.get(i).getWdate()%>'
	});
	<% 
	}
	%>	

	$("#worldcup_submit").click(function() {
		$.ajax({
			url:"worldcup_result.do",
			type: "POST",
			data: { // ----------- 보낼 데이터 세팅 alias 변경 필요
				/* alias: member.getAlias()*/
				alias: "<%=member.getAlias()%>",
				boardseq : "<%=worldcupresult.getBoardseq()%>",
				content : $("#worldcup_input").val()
			},
			success:function( rep ){	
				comment_list = rep;
				comment_page(parseInt((comment_list.length-1)/8));
				 $("#worldcup_input").val('');
			},
			error:function(){
				alert('error');
			}
		});
	});	
});


function update_worldcup_comment(seq, idx){
	var index = parseInt(idx%8) + 1;
	var query = "tbody tr:nth-child(" + index + ") td:nth-child(3)";
	var update_content = document.querySelector(query).textContent;
	update_content = update_content.trim();
	document.querySelector(query).innerHTML = 
		'<td width="410px" style="word-break:break-all; display:inline;"> ' +
			'<input class="form-control" type="text" style="width:76%; float:left"  value="' + update_content + '" >' +
			'<button type="button" class="btn btn-danger" onclick="undo_change(`'+ idx +'`, `'+query+'`, `'+ update_content + '`)" style="float:right;">' +
				'<i class="bi bi-arrow-counterclockwise"  style="float:right;"></i></button>' +
			'<button type="button" onclick="update_change(`'+idx+'`)" class="btn btn-success" style="float:right;">' +
				'<i class="bi bi-check-circle" font-size="1.25em"  style="float:right;"></i></button></td>'
}

function undo_change(i, query, before){
	document.querySelector(query).innerHTML =
		'<td width="410px" style="word-break:break-all">' + 
		'<span style="cursor:pointer"title="대댓창 열기" onclick="toggle_reply(' + i + ')">'  + arrow( comment_list[i].depth  ) + comment_list[i]['content'] +'</span>' + 
		'<span style="display:none"><br><input type="text" size="42%" value="">' + 
		'<button type="button" onclick="worldcup_reply_comment(' + i + ')" class="btn btn-success" style="float:right;">' +
		'<i class="bi bi-check-circle"   style="float:right;"></i></button></span></td>';
}

function update_change(idx){
	var index = parseInt(idx%8) + 1;
 	var update_comment  = comment_list[idx];
	var query = "tbody tr:nth-child(" + index + ") td:nth-child(3) input";
	var update_content = document.querySelector(query).value
	
 	$.ajax({
		url:"worldcup_update_comment.do",
		type: "POST",
		data: {
			boardseq: update_comment.boardseq,
			commentseq: update_comment.commentseq,
			content: update_content
		},
		success:function( rep ){
			comment_list = rep;
			comment_page(parseInt(idx/8));
		},
		error:function(){
			alert('error_update');
		}
	});
	
}

function delete_worldcup_comment(seq, list_idx){
	$.ajax({
		url:"worldcup_delete_comment.do",
		type: "POST",
		data: { // ----------- 보낼 데이터 세팅 Alias 변경 필요
			alias: '<%=member.getAlias()%>',
			commentseq: seq,
			boardseq : <%=worldcupresult.getBoardseq()%>
		},
		success:function( rep ){
			comment_list = rep;
			comment_page(list_idx);
		},
		error:function(){
			alert('error_delete');
		}
	});
}

function comment_page(index) {
	var table = document.getElementById('worldcup_table');
	table.innerHTML = '';
	for (var i=index*8; i < index*8 + Math.min(comment_list.length - index*8, 8); i++) { 
		if (comment_list[i]['del'] == 1){
			var row = '<tr><td colspan=6>삭제된 댓글입니다.</td></tr>';
			table.innerHTML += row;
		}
		else {
			var show_delete = '';
			
			show_content = '<td width="410px" style="word-break:break-all">' + 
			'<span style="cursor:pointer"title="대댓창 열기" onclick="toggle_reply(' + i + ')">' + arrow(comment_list[i].depth) +  comment_list[i]['content'] + '</span>' + 
			'<span style="display:none"><br><input type="text" size="42%" value="">' + 
			'<button type="button" onclick="worldcup_reply_comment(' + i + ')" class="btn btn-success" style="float:right;">' +
			'<i class="bi bi-check-circle"   style="float:right;"></i></button></span></td>';
			
			// member의 alias를 가져와서 비교해야함. 변경 필요
			if (comment_list[i]['alias'] == '<%=member.getAlias()%>'){

				show_update = '<td><i class="bi bi-pencil-square" style="cursor:pointer" aria-hidden="true" onclick="update_worldcup_comment(' + comment_list[i]['commentseq'] +', ' + i +')"></i></td>';
				show_delete = '<td><button type="button" class="btn-close" onclick="delete_worldcup_comment(' + comment_list[i]['commentseq'] +', ' + parseInt(i/8) +')"></button></td>';	
			}
			else{
				show_update = '<td><i  style="display: none;" class="bi bi-pencil-square"></i></td>'
				show_delete = '<td><button type="button"  style="display: none;" class="btn-close"></button></td>';
			}
			var row = 
			'<tr>'+
				'<td>'+ (i+1) +'</td>' +
				'<td width="150px">' + comment_list[i]['alias'] +'</td>'+
				show_content +
				'<td>' + comment_list[i].wdate.substring(0, comment_list[i].wdate.length - 2)  + '</td>' +
				show_update +
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

function toggle_reply(index) {
	
	// 일단 전부 닫기 (여러개 댓글창 열림 방지)
	var all_comment_input = document.querySelector("tbody tr:nth-child(3) td:nth-child(3) span:nth-child(2)");
	all_comment_input = document.querySelectorAll("tbody tr:nth-child(4)");
	index = parseInt(index%8);
	var rows = document.querySelectorAll("tbody tr");
	index += 1
	
	// 댓글창 클릭시 토글 부분
	for (var i = 1; i < rows.length+1; i++){
		var display = document.querySelector("tbody tr:nth-child("+ i + ") td:nth-child(3) span:nth-child(2)");
		if (display === null){
			//console.log(i);
		}
		else if (display.style.display.toString() == 'block' && i == index){
			display.style.display = 'none';
		}
		else if (display.style.display.toString() == 'block' && i != index){
			display.style.display = 'none';
		}
		else if (display.style.display.toString() == 'none' && i == index){
			display.style.display = 'block';
		}
	}

}

function worldcup_reply_comment(idx){
	var reply = comment_list[idx];
	var index = parseInt(idx%8);
	index += 1;
	var query = "tbody tr:nth-child(" + index + ") td:nth-child(3) span:nth-child(2)";
	
	// 새로운 comment 생성, alias 수정 필요
	reply.alias = "<%=member.getAlias()%>";
	reply.content = document.querySelector(query).querySelector('input').value;
 	$.ajax({
		url:"worldcup_reply_comment.do",
		type: "POST",
		data: reply,
		
		success:function( rep ){
			comment_list = rep;
			
			var new_comment_idx = idx+1;
			for (var i = idx+1; i < comment_list.length; i++){
				if (comment_list[i].step == idx){
					break;
				}
			}
			comment_page(parseInt(new_comment_idx/8));
		},
		error:function(){
			alert('error_reply');
		}
	}); 
}

function arrow(depth){
	var res = "<img src='image/arrow.png' width='20px' height='20px' />";
	var nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;"; // 여백
	
	var ts = "";
	for(var i = 0; i<depth; i++){
		ts += nbsp;
	}
	
	return depth==0?"":ts+res;
}
</script>
</body>
</html>