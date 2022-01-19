<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="css/loginStyle.css?version=7" rel="stylesheet" />

<style type="text/css">
.form-group>p>span {
	font-weight: bold;
}
</style>
</head>
<body>

	<article>
		<div class="sidenav" style="background: #004176; background-image: url(./resources/homeBoot/assets/img/login_final.jpg); background-size: cover;">			
		<div class="login-main-text">
			<h2 style="font-weight : bold;">PLAN 16 로그인</h2>					
			<p>PLAN16에 오신것을 환영합니다.</p>
		</div>
		</div>
	</article>

	<article>
		<div class="main">
		<div class="col-md-6 col-sm-12">
		<div class="login-form">
		
			<form id="frm" action="loginAf.do" method="post">
			
				<!-- ID입력 -->
				<div class="form-group">				
					<label>ID</label>
					 <input type="text" class="form-control" placeholder="ID" name="id" id="id">						
				</div>
				
				<!-- PWD입력 -->
				<div class="form-group">				
					<label>Password</label> <input type="password" class="form-control" placeholder="Password" name="pwd" id="pwd">						
					<p id="logincheck" style="font-size: 13px; margin-top: 5px;"></p>				
				</div>
				<!-- 로그인,회원가입 버튼 -->
				<button type="button" class="btn"style="background-color: #004176; color: white" onclick="login()">로그인</button>					
				<button type="button" class="btn btn-secondary" onclick="register()">회원가입</button>
					
			</form>
			
		</div>
		</div>
		</div>
	</article>

	<script type="text/javascript">
	
	//회원가입 버튼 클릭시 regi.do로 이동
	function register() {
	location.href = "regi.do";	
	}
	
	//로그인 화면에서 ID PWD 입력 후 ENTER 누르면 login()실행
	$("#frm").keypress(function(e) {
		if(e.keyCode === 13){
			login();
		}
	});
	
	//로그인 버튼 눌렀을 때 
	function login() {
		//입력된 ID가 없거나 값이 스페이스바 값일때 alert 실행
		if($("#id").val().trim() == ""){
			alert("아이디를 입력해 주세요");
		//입력된 PWD가 없거나 값이 스페이스바 값일때 alert 실행
		}else if($("#pwd").val().trim() == ""){
			alert("비밀번호를 입력해 주세요");
		}
		//ID와 PWD가 입력되었을때 검사 실행
		else{
			// id 확인 -> ajax
			$.ajax({
				url:"idpwdcheck.do",
				type:"post",
				data:{ id:$("#id").val(), pwd:$("#pwd").val()},
				success:function( msg ){
				
					if(msg == "YES"){ //ID와 PWD 값이 일치함
						$("#frm").submit();
					}
					else{			  //ID와 PWD값이 일치하지 않음
						$("#logincheck").css("color", "#ff0000");
						$("#logincheck").html("아이디 또는 비밀번호가 잘못 입력되었습니다.<br><span>아이디</span>와 <span>비밀번호</span>를 정확히 입력해 주세요.");
						//PWD값 삭제, PWD입력 유도용 focus
						$("#pwd").val("");	
						$("#pwd").focus();
					}			
				},
				error:function(){	//통신에러
					alert('error');
				}
			});
		}
	}
</script>
</body>
</html>
