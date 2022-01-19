<%@page import="java.util.Map"%>
<%@page import="secure.mbti.a.dto.MemberDto"%>
<%@page import="secure.mbti.a.dto.MbtiReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Map<String, Object> reviewInfo = (Map<String, Object>)request.getAttribute("reviewInfo");
	List<MbtiReviewDto> reviewList = (List<MbtiReviewDto>)reviewInfo.get("reviewList");
	MemberDto mem =(MemberDto)request.getSession().getAttribute("login");
%>    
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- 기본 설정 -->
	<link rel="stylesheet" href="css/mbtiReviewStyle.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>mbtiReview</title>
</head>
<body>
	<div id="wrap">
	<!-- 상단 MBTI 리뷰 제목영역 -->
		<header>
			<h1><%=reviewInfo.get("selectmbti") %> 리뷰</h1>
		</header>
		<!-- 리뷰 상단 테이블 영역 -->
		<mainheader>
			<table>
				<thead>
					<tr>
						<td>MBTI</td>
						<td>별점</td>
						<td>리뷰</td>
					</tr>
				</thead>
			</table>
		</mainheader>
		<!-- 리뷰 테이블 영역 -->
		<main>
			<table>
				<tbody>
					<%
						if(reviewList == null || reviewList.size()==0){
					%>
						<tr><td colspan="3" class="reviewnone">리뷰를 작성해주세요!</td></tr>
					<%
						}else{
							for(int i =0; i<reviewList.size(); i++){
					%>
							
							<tr>
								<form id="frmReview" action="reviewModify.do" method="post">
									<td class="tablefirst"><%=reviewList.get(i).getRecordmbti() %></td>
									<td class="tablemiddle">
										<%for(int n =0; n< reviewList.get(i).getAsterion() ;n++){%>
										♥
										<%} %>
									</td>
									<td class="tableend">
										<input type="text" name="review" size="65px"value="<%=reviewList.get(i).getReview() %>" readonly>
										<%
											if(reviewList.get(i).getId().equals(mem.getId())){
										%>
											<button type="button" name="reviewseq" class="updateBtn" value="<%=reviewList.get(i).getReviewseq() %>">수정</button>
											<button type="button" name="reviewseq" class="deleteBtn" value="<%=reviewList.get(i).getReviewseq() %>">삭제</button>
										<%} %>
									</td>
								</form>
							</tr>
					<%		
						}}
					%>
				</tbody>
			</table>
		</main>
		<!-- 리뷰 작성 영역 -->
		<section id="write">
			<table>
				<tr>
					<form id="frm" action="reviewWriteAf.do" method="post">
					<input type="hidden" name="targetmbti" value="<%=reviewInfo.get("selectmbti") %>">
					<input type="hidden" name="id" value="<%=mem.getId() %>">
					<td class="userMbti">
						<input type="text" size="3px" value="<%=mem.getMbti() %>" readonly>
					</td>
					<td class="userAsterion">
						<select name="asterion">
							<option value="5" selected>♥♥♥♥♥</option>
							<option value="4">♥♥♥♥</option>
							<option value="3">♥♥♥</option>
							<option value="2">♥♥</option>
							<option value="1">♥</option>
						</select>
					</td>
					<td class="userReview">
						<input type="text" id="reivew" name="review" size="65px" placeholder="글자제한 (30자)" >
						<button type="button" class="writeBtn" onclick = "reviewWrite()" >작성</button>
					</td>
					</form>
				</tr>
			</table>	
		</section>
		<!-- 닫기 버튼 영역 -->
		<section id="close">
			<button class="closeBtn" type="button">닫기</button>
		</section>
	</div>
	
	<script>
		/* 기본 설정 */
		let modify=0;	/* 0: 수정없음, 1: 수정중 */
		let placeholder;	/* 작성 입력창 문구 */
		
		/* 리뷰 체크 */
		function reviewWrite(e){
			if(modify!=1){
				let str = e.parents().children("input").val();
				/* e.attr("type","button"); */
	  	 		if(str.length>30){
					alert("30자이하로 작성하세요!");
					return 0;
				}else if (str==""){
					alert("글을 작성하세요!");
					return 0;
				}else{
					e.attr("type","submit");
					return 1;
				}
			}
		}
		
		/* alert($(this).prop('tagName')); */
		/* $(this).parents().prop('readonly', false); */
		$(document).ready(function() {
			
			/* 리뷰 작성 */
			$(".writeBtn").click(
				function(){
					reviewWrite($(this));}	
			);
			
			/* 리뷰 수정 */
			$(".updateBtn").click(
				function(e){
					if(modify!=1){
						/* e.preventDefault(); */
						modify=1;
						$(this).text("완료");
						$(this).parents().children("input").prop('readonly', false);
						$(this).parents().children("input").css('background-color', 'var(--textInput-color)');
						$(".writeBtn").parents().children("input").prop('readonly', true);
					}else{
						if($(this).text()=="완료"){
							modify=0;
							if(reviewWrite($(this))==1){		
								$(this).text("수정");
								$(this).parents().children("input").prop('readonly', true);
								$(".writeBtn").parents().children("input").prop('readonly', false);
								
							}else{
								modify=1;
							}
						}
					}
				}
			);
			
			/* 리뷰 작성 입력창 */
			$("#reivew").focus(
				function(){
					if(modify!=1){
					placeholder=$(this).attr("placeholder");
					$(this).attr("placeholder","");
				}}
			);
			$("#reivew").blur(
					function(){
						$(this).attr("placeholder",placeholder);}
			);
			
			/* 리뷰 삭제 */
 			$(".deleteBtn").click(
 				function(){
 					if(modify!=1){
 						$(this).parents().children("input").removeAttr("name");
 						$(this).attr("type","submit");
 						}
 				}
			);
			
			/* 리뷰창 닫기 */
			$("#close").children("button").click(
				function(){window.close();}
			);
				
		});
		

	</script>
</body>
</html>