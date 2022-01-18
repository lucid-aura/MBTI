<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="css/loginStyle.css?version=3" rel="stylesheet" />

</head>
<body>
<div class="sidenav" style="background:#004176; background-image : url(./resources/homeBoot/assets/img/bg-login.jpg)">
         <div class="login-main-text" >
            <h2>Application<br> Login Page</h2>
            <p>Login or register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form id="frm" action="loginAf.do" method = "post">
                  <div class="form-group">
                     <label>ID</label>
                     <input type="text" class="form-control" placeholder="ID" name = "id" id="id">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" class="form-control" placeholder="Password" name = "pwd" id="pwd">
                  </div>
                  <button type="button" class="btn"  style="background-color:#004176; color:white" onclick = "login()">Login</button>
                  <button type="button" class="btn btn-secondary" onclick="register()">Register</button>
               </form>
            </div>
         </div>
      </div>
      
      
      <script type="text/javascript">
	function register() {
	location.href = "regi.do";	
	}
	
	//로그인 화면에서 ID PWD 입력 후 엔터 누르면 login()실행
	$("#frm").keypress(function(e) {
		if(e.keyCode === 13){
			login();
		}
	});
	
	function login() {
		
		if($("#id").val().trim() == ""){
			alert("아이디를 입력해 주세요");
		}else if($("#pwd").val().trim() == ""){
			alert("비밀번호를 입력해 주세요");
		}else{ 
			$("#frm").submit();
		}
	}
</script>
</body>
</html>
