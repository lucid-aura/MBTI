<%@page import="secure.mbti.a.dto.MbtiReviewDto"%>
<%@page import="secure.mbti.a.dto.MbtiDetailDto"%>
<%@page import="java.util.List"%>
<%@page import="secure.mbti.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Object> selectInfo = (List<Object>)request.getAttribute("selectMbti");
	MemberDto mem =(MemberDto)request.getSession().getAttribute("login");
	String selectname = (String)request.getAttribute("filename");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!-- 기본 설정 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/detailMbtiStyle.css">
	<link rel="stylesheet" href="css/style.css?version=3">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<title>detailMBTI</title>
</head>
<body>
	<!-- 상단 영역 (기본) -->
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
	
	<!-- 작업영역 -->
	<%
	List<String> mbtiList = (List<String>)(Object)selectInfo.get(1);
	MbtiDetailDto mbtiContent = (MbtiDetailDto)(Object)selectInfo.get(2);
	String ratio = (String)(Object)selectInfo.get(3);
	String asterion = (String)(Object)selectInfo.get(4);
    %>
	<!-- 전체묶음 -->
	<div id="wrap">
		<!-- 좌측 메뉴바 -->
		<aside id="mbtiMenu">
			<section>
				<!-- 메뉴항목 -->
					<ul>
	    			    <%
						   	for (String str:mbtiList){
						%>
	    				<li><a href="#" class="mbtiMenuBtn"><%=str%></a></li>
						<%
						   	}
						%>
					</ul>
			</section>
		</aside>
		
		<!-- 우측 메인 -->
		<main id="wrapMain">
			<section id="wrapContent">
				<!-- 콘텐츠 영역(이미지) -->
				<article>
					<img src="image/mbti_<%=mbtiContent.getMbti().toLowerCase()%>.png" id="mainImg">
				</article>
				<!-- 콘텐츠 영역(MBTI 제목) -->
				<article><div><%=mbtiContent.getMbti()%></div></article>
				<!-- 콘텐츠 영역(MBTI 구분) -->
				<article><%=mbtiContent.getMbtidivide() %></article>
				<!-- 콘텐츠 영역(설명1) -->
				<article><%=mbtiContent.getContent() %></article>
				<!-- 콘텐츠 영역(이미지_가로바) -->
				<article><img src="image/mbti_<%=mbtiContent.getMbti().toLowerCase()%>_bar.png" id="barImg"></article>
				<!-- 콘텐츠 영역(MBTI 서브타이틀) -->
				<article><div><%=mbtiContent.getSubtitle() %></div></article>
				<!-- 콘텐츠 영역(MBTI 설명) -->
				<article><%=mbtiContent.getSummary() %></article>
				<!-- 콘텐츠 영역(MBTI 궁합) -->
				<article>
					<div>
						<div>최상<br>궁합</div>
						<%for(int i=0; i<3; i++){
								if((mbtiContent.getBestrelation().length()%4)+1>i){%>
						<div class="bestrelation bestrelationButton"><%=mbtiContent.getBestrelation().replaceAll(",", "").substring(4*i, 4*(i+1))%></div>
						<%}else{%>
						<div class="bestrelation bestrelationButton"></div>
						<%}}%>
						<div>최악<br>궁합</div>
						<%for(int i=0; i<3; i++){
							if((mbtiContent.getWorstrelation().length()%4)+1>i){%>
						<div class="worstrelation worstrelationButton"><%=mbtiContent.getWorstrelation().replaceAll(",", "").substring(4*i, 4*(i+1))%></div>
						<%}else{%>
						<div class="worstrelation worstrelationButton"></div>
						<%}}%>
					</div>
				</article>
				<!-- 콘텐츠 영역(조회수, 비율) -->
				<article>
					<div id="tooltip"></div>	
					<div>
						<img src="image/icon_asterion.png" style="cursor:pointer" onclick="mbtiReview()">
						<div><a style="cursor:pointer" onclick="mbtiReview()"><%=asterion %></a></div>
						
						<img src="image/icon_view.png">
						<div><%=mbtiContent.getViewcount() %></div>
						<img src="image/icon_ratio.png">
						<div><%=ratio %></div>
					</div>				
				</article>
			</section>
			<section class="wrapButton">
				<form id="frm" action="board_type.do" method="get">
					<button id="boardMoveBtn" name="type" value="<%=mbtiContent.getMbti()%>"><%=mbtiContent.getMbti() %> 게시판으로 이동</button>
				</form>
				
			</section>
		</main>
	</div>
	
	<script>
		let review;
		/* 리뷰로 이동 */
		function mbtiReview(){
			if(review !=null){
				review.close();
			}
			let targetmbti = $("#wrapContent article:nth-child(2) div").text();
			let link = 'mbtiReview.do?targetmbti='+targetmbti;
			review = window.open(link, '_blank', 'width=1000, height=600, resizable=no');
			review.focus();
		}
		
		
		$(document).ready(function() {
			let memberMbti = '<%=mem.getMbti()%>';	/* 리턴값: 대문자 */
			let introSelectMbti = '<%=selectInfo.get(0) %>';
			
			/* 페이지 진입시 초기 지정 */
			let selectMenu = introSelectMbti;
			let selectIndex=0;
			menuCheck(selectMenu);
			buttonCheck(selectMenu);
			relationButton();

			
			/* MBTI 메뉴에 스타일적용 */
			function menuCheck(str) {
	  			$(".mbtiMenuBtn").each(function(index, item){
	  				if($(this).text().toLowerCase()==str){
	  					$(".mbtiMenuBtn:eq("+index+")").addClass("listSelectHover");
	  					selectIndex=index;
	  				}else{
	  					$(".mbtiMenuBtn:eq("+index+")").removeClass("listSelectHover");
	  				}
				});
			}

			/* 게시판 이동버튼 활성화/비활성화 */
			function buttonCheck(str){
				if(str!=memberMbti.toLowerCase()){
					$('#boardMoveBtn').css('backgroundColor','var(--buttonOff-color)');
					$('#boardMoveBtn').css('cursor','default');
				}else{
					$('#boardMoveBtn').css('backgroundColor','var(--buttonOn-color)');
					$('#boardMoveBtn').css('cursor','pointer');
				}
			}
			


			/* MBTI 메뉴 클릭*/
			$(".mbtiMenuBtn ,.bestrelationButton ,.worstrelationButton").click(function(e){
				if($(this).text()!=""){
					/* 클릭시 상단이동 해제 */
					e.preventDefault();
					selectMenu=$(this).text();
					menuCheck($(this).text().toLowerCase());
					buttonCheck($(this).text().toLowerCase());
					/* 화면 내용 구성 */
					$.ajax({
						url:	"mbtiContent.do",
						type:	"post",
						data:	"selectMenu=" + $(this).text(),			
						success: function( repdata ){
							const ratio = repdata.ratio;
							const content = repdata.content;
							const asterion = repdata.asterion;
	
							$("#mainImg").attr("src","image/mbti_"+content.mbti.toLowerCase()+".png");
							$("#wrapContent article:nth-child(2) div").text(content.mbti);
							$("#wrapContent article:nth-child(3)").text(content.mbtidivide);
							$("#wrapContent article:nth-child(4)").html(content.content);
							$("#barImg").attr("src","image/mbti_"+content.mbti.toLowerCase()+"_bar.png");
							$("#wrapContent article:nth-child(6) div").text(content.subtitle);
							$("#wrapContent article:nth-child(7)").html(repdata.summary);
							$("#wrapContent article:nth-child(9) div:nth-child(2) a").text(asterion);
							$("#wrapContent article:nth-child(9) div:nth-child(4)").text(content.viewcount);
							$("#wrapContent article:nth-child(9) div:nth-child(6)").text(ratio);
							$("#boardMoveBtn").text(content.mbti + " 게시판으로 이동");
							$("#boardMoveBtn").val(content.mbti);
							
							/* 궁합 텍스트 변경 */
							for(let i=0; i<3; i++){
								if((content.bestrelation.length%4)+1>i){
									/* 정규식 사용(g : 발생할 모든 패턴에 대한 전역 검색,i : 대/소문자 구분 안함) */
									$("#wrapContent article:nth-child(8) div:nth-child("+(i+2)+")").text(content.bestrelation.replace(/,/gi,"").substring(4*i, 4*(i+1)));
								}else{
									$("#wrapContent article:nth-child(8) div:nth-child("+(i+2)+")").text("");
								}
								if((content.worstrelation.length%4)+1>i){
									/* 정규식 사용(g : 발생할 모든 패턴에 대한 전역 검색,i : 대/소문자 구분 안함) */
									$("#wrapContent article:nth-child(8) div:nth-child("+(i+6)+")").text(content.worstrelation.replace(/,/gi,"").substring(4*i, 4*(i+1)));
								}else{
									$("#wrapContent article:nth-child(8) div:nth-child("+(i+6)+")").text("");
								}
							}
							relationButton();
						},
						error: function (){
						}
						
					});
				}
			});
			
			
			/* 궁합 버튼 관련 */
			function relationButton(){
				$(".bestrelationButton").each(function(index, item){
	  				if($(".bestrelationButton:eq("+index+")").text()!=""){
	  					$(".bestrelationButton:eq("+index+")").addClass("bestrelation");
	  					$(".bestrelationButton:eq("+index+")").removeClass("lationHoverOff");
	  					$(".bestrelation:eq("+index+")").hover(
	  							function(){$(this).addClass("bestrelationHover");},
	  							function(){$(this).removeClass("bestrelationHover");}
	  						);
	  				}else{
	  					$(".bestrelationButton:eq("+index+")").addClass("lationHoverOff");
	  					$(".bestrelationButton:eq("+index+")").removeClass("bestrelation");
	  				}
				});
				$(".worstrelationButton").each(function(index, item){
	  				if($(".worstrelationButton:eq("+index+")").text()!=""){
	  					$(".worstrelationButton:eq("+index+")").addClass("worstrelation");
	  					$(".worstrelationButton:eq("+index+")").removeClass("lationHoverOff");
	  					$(".worstrelation:eq("+index+")").hover(
	  							function(){$(this).addClass("worstrelationHover");},
	  							function(){$(this).removeClass("worstrelationHover");}
	  						);
	  				}else{
	  					$(".worstrelationButton:eq("+index+")").addClass("lationHoverOff");
	  					$(".worstrelationButton:eq("+index+")").removeClass("worstrelation");
	  				}
				});
			}



			
						
			/* MBTI 메뉴 마우스오버시 스타일 적용 */
			 $(".mbtiMenuBtn").hover(
					 function(){$(this).addClass("listHover");},
					 function(){$(this).removeClass("listHover");}
					 );
			
			/* 게시판이동 버튼 클릭시 */
			$("#boardMoveBtn").click(function(e){
				if(memberMbti==selectMenu.toUpperCase()){
					$("#frm").submit();
				}else{
					e.preventDefault();
				}			
				
			});


            /* 상단 메뉴 클릭시 이동불가 */
            /* $("nav a").click(function(e){e.preventDefault();}); */
            /* 상단 메뉴 효과 관련 */
/*             $("nav a").mouseover(
            	function(){
            		$(this).css("cursor","default");
            		$(this).css("color","#f8f9fa");
            		$(this).css("text-decoration-color","#343a40");
            		/* $(this).unbind('mouseenter mouseleave');
            	}); */
		});
	</script>
</body>
</html>