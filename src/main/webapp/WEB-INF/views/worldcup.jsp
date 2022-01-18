<%@page import="java.util.Collections"%>
<%@page import="secure.mbti.a.dto.WorldCupDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

List<WorldCupDto> worldcuplist = (List<WorldCupDto>)request.getAttribute("worldcuplist");
String topic = worldcuplist.get(0).getTopic();
Collections.shuffle(worldcuplist);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="wrapper">
	<header>
		<nav>
			<div class="fixed-top py-3 px-3 bg-dark text-center" id="nav">
				<a href="#test" class="text-light distance">유형소개</a>
				<a href="#test" class="text-light distance">유형별게시판</a>
				<a href="#test" class="text-light distance">자유게시판</a>
				<a href="worldcup_choice.do" class="text-light distance">월드컵</a>
				<button>로그아웃</button>
			</div>
		</nav>
	</header>
	<section>
		<article>
			<div class="content" style="width: 1680px;	height:720px;">
			<table style="text-align:center">
			<tr>
				<td colspan="3" align='center'>
					<span id="round">8강</span>
				</td>
			</tr>
			<tr>
				<td ><img src='image/<%=worldcuplist.get(0).getWorldcupname() %>.jpg'  id="left" class="choice" onclick="left"/></td>
				<td id="vs">vs</td>
				<td><img src='image/<%=worldcuplist.get(1).getWorldcupname() %>.jpg'  id="right"  class="choice" onclick="right"/></td>
			</tr>
			</table>
			</div>
		</article>
	</section>

	<footer>
	
	</footer>

</div>
  
<script type="text/javascript">
var idx = 0;
var idx_list = [];
var temp_list = [];
var topic = 
$(document).ready(function () {
	<%
	for (int i=0; i < worldcuplist.size(); i++){
		
	%>
		temp_list.push([<%=worldcuplist.get(i).getWorldcupseq()%>, '<%=worldcuplist.get(i).getWorldcupname()%>'])
	<% 
	}
	%>

	$("#left").click(function () {
		$("#right").hide();
		$("#vs").hide();
		$("#left").width('50%');
		$("#left").height('50%'); 
		$("#left").animate({
	        width: '+=25%',
	        height: '+=25%'
	    }, 2300);
		//$("#right").show();

		setTimeout(function() {
			select(0);
			}, 2500);

	});	
	
	$("#right").click(function () {
		$("#left").hide();
		$("#vs").hide();
		$("#right").width('50%');
		$("#right").height('50%'); 
		$("#right").animate({
	        width: '+=25%',
	        height: '+=25%'
	    }, 2300);
		setTimeout(function() {
			select(1);
			}, 2500);

	});
});

function select(i) {
		$("#left").width('100%');
		$("#left").height('100%'); 
		$("#right").width('100%');
		$("#right").height('100%'); 
		
 		$("#left").show();
 		$("#vs").show();
 		$("#right").show();
	idx_list.push(idx+i);

	idx += 2;
	if (idx >= temp_list.length){
		if (temp_list.length == 2){ // 결승전 선택 후
			alert(temp_list[i][1] + " 승리");
			
			// 결과 창 이동 필요, 시큐어 코딩 적용해야함(vs 민감한 정보가 아니라서 굳이?)
			location.href  = "worldcup_result.do?worldcupseq=" + temp_list[i][0];
		}
		else { // 8, 4 강 종료 후
			idx = 0;
			if (idx_list.length == 2){
				$('#round').html("결승전");
			}
			else{
				$('#round').html(idx_list.length+"강");	
			}

			var new_temp_list = []
			for (var i =0; i<idx_list.length; i++){
				new_temp_list.push(temp_list[idx_list[i]]);
			}
			idx_list = []; 
			console.log(new_temp_list);
			temp_list = new_temp_list;
		}
	}
	$('#left').attr('src', 'image/'+temp_list[idx][1] + '.jpg');
	$('#right').attr('src', 'image/'+temp_list[idx+1][1] + '.jpg');		
}


</script>

</body>

</html>