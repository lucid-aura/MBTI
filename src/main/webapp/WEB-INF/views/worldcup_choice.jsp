<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css?version=3">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>선택창</title>
</head>
<body>
<div class="wrapper">
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
	<section>
		<article>
		<div class="container">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		    <div id="carouselSample" class="carousel slide" data-ride="carousel">
		    
		      <!-- 인디케이터(바로 이동할수 있는 바) -->       
		      <ol class="carousel-indicators">
		        <li data-target="#carouselSample" data-slide-to="0" class="active"></li>
		        <li data-target="#carouselSample" data-slide-to="1"></li>
		        <li data-target="#carouselSample" data-slide-to="2"></li>
		      </ol>
		      
		      <!-- 캐러셀 -->
		      <div class="carousel-inner">
		        <!-- First slide -->
		        <div class="carousel-item active">
		          <img onclick="choice('food')" style="cursor: pointer; width:1260px; heigth:720px;"class="d-block w-100" alt="slide" src="./image/food.jpg">
		          <!-- 캡션 -->
		          <div class="carousel-caption d-none d-md-block">
					<!-- 		          
		            <h5>음식</h5>
		            <p>좋아하는 음식 월드컵</p>
		            -->
		          </div>
		       		</div>
		        <!-- Second slide -->
		        <div class="carousel-item">          
		          <img onclick="choice('celebrity')" style="cursor: pointer; width:1260px; heigth:720px;" class="d-block w-100" alt="slide" src="./image/celebrity.jpg">
		          <!-- 캡션 -->
	          
		          <div class="carousel-caption d-none d-md-block">
					<!-- 	
		            <h5>인물</h5>
		            <p>좋아하는 인물 월드컵</p>
		           -->
		            </div>
		        </div>
		        <!-- Third slide -->
		        <div class="carousel-item">
		          <img onclick="choice('color')" style="cursor: pointer; width:1260px; heigth:720px;" class="d-block w-100" alt="slide" src="./image/color.jpg">          
		          <!-- 캡션 -->
	          
					<div class="carousel-caption d-none d-md-block">
										<!-- 	
		            <h5>색상</h5>
		            <p>좋아하는 색상 월드컵</p>
		             -->
		          </div> 

		        </div>
		      </div>
		      
		      <!-- 컨트롤러 부분 -->
		      <!-- 앞으로 돌아가는 아이콘 -->
		      <a class="carousel-control-prev" href="#carouselSample" role="button" data-slide="prev">
		        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		        <span class="sr-only">앞으로</span>
		      </a>
		      <!-- 다음으로 이동하는 아이콘 -->
		      <a class="carousel-control-next" href="#carouselSample" role="button" data-slide="next">
		        <span class="carousel-control-next-icon" aria-hidden="true"></span>
		        <span class="sr-only">다음으로</span>
		      </a>
		      
		    </div>
		  </div>
		  
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			
		</article>
	</section>
	<footer>
	
	</footer>
</div>
<script type="text/javascript">

/* 선택 완료시 해당 토픽을 query로 하여 창 이동 */
function choice(topic) {
	location.href = "worldcup.do?topic=" + topic;
}
</script>
</body>
</html>