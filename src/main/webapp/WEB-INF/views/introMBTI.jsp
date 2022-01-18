<%@page import="java.util.Random"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="secure.mbti.a.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDto mem =(MemberDto)request.getSession().getAttribute("login");
	List<String> mbtilist = (List<String>)request.getAttribute("mbtilist");
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
				<a href="board_FREE.do?page=1" class="text-light distance">자유게시판</a>
				<a href="worldcup_choice.do" class="text-light distance">월드컵</a>
				<button type="button" onclick="outbtn()">로그아웃</button>
			</div>
		</nav>
	</header>
	
	<!-- 작업영역 -->
    <%
	/* MBTI 유형 분류 준비 */
    String mbtiType[] = new String[mbtilist.size()];
    List<String> mbtiTypeI = new ArrayList<String>();
    List<String> mbtiTypeE = new ArrayList<String>();

    List<Integer> centerRest = new ArrayList<Integer>();
    for(String str:mbtilist){
     	if(str.toLowerCase().charAt(0)=='e'){
    		mbtiTypeE.add(str.toLowerCase());
    	}else{
    		mbtiTypeI.add(str.toLowerCase());
    	}
    }
    /* 본인MBTI를 놓을 위치지정 (화면가운데위치:1,2,5,6) */
    int memberLocation[] = {1,2,5,6};
    int selectLocation = memberLocation[new Random().nextInt(memberLocation.length)];
    
    /* MBTI배치 (0열,3열: 비선택/1열,2열: 선택) */
    if(mem.getMbti().toLowerCase().charAt(0)=='e'){
    	centerRest.add(1);
    	centerRest.add(2);
    	mbtiTypeE.remove(mbtiTypeE.indexOf(mem.getMbti().toLowerCase()));
	}else{
    	centerRest.add(0);
    	centerRest.add(3);
    	mbtiTypeI.remove(mbtiTypeI.indexOf(mem.getMbti().toLowerCase()));
	}
    
    for (int i=0; i<mbtiType.length; i++){
    	if(i!=selectLocation){
	    	if(centerRest.contains(i%4)){
	    		int index = new Random().nextInt(mbtiTypeE.size());
	    		mbtiType[i]=mbtiTypeE.get(index);
	    		mbtiTypeE.remove(index);
	    	}else{
	    		int index = new Random().nextInt(mbtiTypeI.size());
	    		mbtiType[i]=mbtiTypeI.get(index);
	    		mbtiTypeI.remove(index);
	    	}    		
    	}
    }
    mbtiType[selectLocation]=mem.getMbti().toLowerCase();
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
    	<input type="hidden" id="selectMbti" name="selectMbti" value="">
    </form>

	<script>
	    $(document).ready(function() {
	    	let memberMbti = '<%=mem.getMbti()%>';	/* 리턴값: 대문자 */
	    	imageBorder(memberMbti.toLowerCase());

	    	/* 사용자 MBTI의 이미지 효과 */
	    	function imageBorder(select){
				const imgArray = $(".image img").get();
				for(let i=0; i<imgArray.length; i++){
					let imageSrc = $(".image:eq("+i+") img").attr("src");
					let name = imageSrc.substring(imageSrc.lastIndexOf("/")+1, imageSrc.lastIndexOf("."));
					if(name.split("_")[1]==select){
						$(".image:eq("+i+")").addClass("rainbowBorder");
 						$(".image:eq("+i+") figurecaption").addClass("rainbowBorder");
 						$(".image:eq("+i+")").css("order","0");
						break;
					}
				}
	    	}
	    	
	    	/* 이미지 클릭시 해당 이미지파일 이름의 mbti로 이동 */
		    $(".image").click(function(){
	            let index = $(".image").index(this);
		        let imageSrc = $(".image:eq("+index+") img").attr("src");
	            let name = imageSrc.substring(imageSrc.lastIndexOf("/")+1, imageSrc.lastIndexOf("."));
	            $("#selectMbti").val(name.split("_")[1]);
	            $("#frm").submit();
		    });
	    	
	    	/* 마우스 호버 효과 */
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
            
            /* 상단 메뉴 클릭시 이동불가 */
            $("nav a").click(function(e){e.preventDefault();});
            
            /* 상단 메뉴 효과 관련 */
            $("nav a").mouseover(
            	function(){
            		$(this).css("cursor","default");
            		$(this).css("color","#f8f9fa");
            		$(this).css("text-decoration-color","#343a40");
            	});
		    
		});
	    
	</script>
</body>
</html>