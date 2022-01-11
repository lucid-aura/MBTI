<%@page import="java.util.Collections"%>
<%@page import="secure.mbti.a.dto.WorldCupDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<WorldCupDto> worldcuplist = (List<WorldCupDto>)request.getAttribute("worldcuplist");
Collections.shuffle(worldcuplist);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}

.content {
  font-family: system-ui, serif;
  font-size: 2rem;
  padding: 3rem;
  border-radius: 1rem;
  background: #ff6e6c;
}

.choice {
  width: 100%;
  height: 100%;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

<div class="wrapper">
	 
	<div class="content">
	<table>
	<tr>
	<td colspan="3" align='center'>
		<span id="round">8강</span>
	</td>
	</tr>
	
	<tr>
	<td><img src='image/<%=worldcuplist.get(0).getName() %>.jpg'  id="left" class="choice" onclick="left"/></td>
	<td>vs</td>
	<td><img src='image/<%=worldcuplist.get(1).getName() %>.jpg'  id="right" class="choice" onclick="right"/></td>
	</tr>
	
	</table>
	</div>
</div>

<script type="text/javascript">
var idx = 0;
var idx_list = [];
var temp_list = [];

$(document).ready(function () {
	<%
	for (int i=0; i < worldcuplist.size(); i++){
		
	%>
		temp_list.push('<%=worldcuplist.get(i).getName()%>')
	<% 
	}
	%>
	console.log(temp_list);
	$("#left").click(function () {
		select(0);
	});	
	
	$("#right").click(function () {
		select(1);
	});
});

function select(i) {
	idx_list.push(idx+i);
	console.log(idx_list);
	idx += 2;
	if (idx >= temp_list.length){
		alert("한바퀴 끝");
		if (temp_list.length == 2){ // 결승전 선택 후
			alert(temp_list[i] + " 승리");
			// 결과 창 이동 필요
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
	$('#left').attr('src', 'image/'+temp_list[idx] + '.jpg');
	$('#right').attr('src', 'image/'+temp_list[idx+1] + '.jpg');		
}


</script>

</body>

</html>