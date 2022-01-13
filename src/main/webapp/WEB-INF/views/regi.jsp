<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="css/regiStyle.css" rel="stylesheet" />

</head>
<body>
<div class="sidenav">
         <div class="login-main-text">
            <h2>Application<br> Register Page</h2>
            <p>Login or register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form id="frm" action="regiAf.do" method = "post">
               
                  <div class="form-group">
                     <label>ID</label>
                     <input type="text" class="form-control" placeholder="ID" name = "id">
                  </div>  
                               
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" class="form-control" placeholder="Password" name = "pwd">
                  </div>
                  
                  <div class="form-group">
                     <label>Name</label>
                     <input type="text" class="form-control" placeholder="Name" name = "Name" id="name">
                  </div>
                  
                  <div class="form-group">
                     <label>Alias</label>
                     <input type="text" class="form-control" placeholder="Alias" name = "alias" id="alias">
                  </div>
                  
                  <div class="form-group">
                     <label>Email</label>
                     <input type="text" class="form-control" placeholder="Email" name = "email" id="email">
                  </div>
                  
                  <div class="form-group">
                     <label>MBTI</label>
                    <select name="mbti" id ="mbti">
                    <option value="ENFJ">ENFJ</option>
                    <option value="ENFP">ENFP</option>
                    <option value="ENTJ">ENTJ</option>
                    <option value="ENTP">ENTP</option>
                    <option value="ESFJ">ESFJ</option>
                    <option value="ESFP">ESFP</option>
                    <option value="ESTJ">ESTJ</option>
                    <option value="ESTP">ESTP</option>
                    <option value="INFJ">INFJ</option>
                    <option value="INFP">INFP</option>
                    <option value="INTJ">INTJ</option>
                    <option value="INTP">INTP</option>
                    <option value="ISFJ">ISFJ</option>
                    <option value="ISFP">ISFP</option>
                    <option value="ISTJ">ISTJ</option>
                    <option value="ISTP">ISTP</option>                            
                    </select>
                  </div>
                             
                  <button type="button" class="btn btn-secondary" onclick="account()">Register</button>
               </form>
            </div>
         </div>
      </div>
      
      
<script type="text/javascript">
      function account() {
//    		alert('account');

    		if($("#id").val() == ''){
    			alert('아이디를 입력해 주십시오');
    		}
    		else if($("#pwd").val() == ''){
    			alert('패스워드를 입력해 주십시오');
    		}
    		else if($("#name").val() == ''){
    			alert('이름를 입력해 주십시오');
    		}
    		else if($("#alias").val() == ''){
    			alert('alias를 입력해 주십시오');
    		}
    		else if($("#email").val() == ''){
    			alert('이메일을 입력해 주십시오');
    		}
    		else if($("#mbti").val() == ''){
    			alert('MBTI를 입력해 주십시오');
    		}
    		else{
    			$("#frm").submit();
    		}
    	}
      
    
</script>
</body>
</html>
