<%@page import="secure.mbti.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//session에서 사용자 정보를 산출
MemberDto mem = (MemberDto)request.getSession().getAttribute("login");
System.out.println(mem.toString());
%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<!-- 기본 설정 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/introMbtiStyle.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<title>introMBTI</title>
</head>
<body>
	<!-- 상단 영역 (기본) -->
	<header>
		<nav>
			<div class="fixed-top py-3 px-3 bg-dark text-center" id="nav">
				<a href="introMBTI.do" class="text-light distance">유형소개</a>
				<a href="board_type.do?page=1" class="text-light distance">유형별게시판</a>
				<a href="board_free.do?page=1" class="text-light distance">자유게시판</a>
				<a href="worldcup_choice.do" class="text-light distance">월드컵</a>
				<button>로그아웃</button>
			</div>
		</nav>
	</header>
	
	<!-- 작업영역 -->
    <%
    String mbtiType[] = {
    					"istj", "isfj", "istp", "isfp",
    					"infj", "intj", "infp", "intp",
    					"estp", "esfp", "estj", "esfj",
    					"enfp", "entp", "enfj", "entj"
    					};
    %>
    
    
    <main>    	
    	<!-- 이미지 영역 -->
   		<section class="imageWrapper">
   		    <%
			   	for (String str:mbtiType){
			%>
   			<figure class="image">
			    <img src="image/mbti_<%=str %>.png"/>
			    <figurecaption class="hoverText"><%=str.toUpperCase() %></figurecaption>
			</figure>
			
			<%
			   	}
			%>
   		</section>
    </main>
    <form id="frm" action="detailMBTI.do" method="post">
    	<input type="hidden" id="filename" name="filename" value="">
    </form>
 
	<script>
		
	    $(document).ready(function() {
		    $(".image").click(function(){
	            let index = $(".image").index(this);
		        let imageSrc = $(".image:eq("+index+") img").attr("src");
	            let name = imageSrc.substring(imageSrc.lastIndexOf("/")+1, imageSrc.lastIndexOf("."));
	            $("#filename").val(name.split("_")[1]);
	            $("#frm").submit();
		        
		    });
		    
            $(".hoverText").hover(
					 function(){$(this).parents().children("img").addClass("imghover");},
					 function(){$(this).parents().children("img").removeClass("imghover");}
		    );
            $(".hoverText").mouseover(
            		function(){
            			$(this).parents().children("img").css("opacity","1");
            			$(this).parents().children("img").css("filter","saturate(1.0)");          		
            		}); 
            $(".hoverText").mouseleave(
            		function(){
            			$(this).parents().children("img").css("opacity","0.5");
            			$(this).parents().children("img").css("filter","saturate(0.1)");	
            		});
		    
		});
	    
	</script>
	
	
</body>
</html>