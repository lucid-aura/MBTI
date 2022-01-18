<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="css/regiStyle.css" rel="stylesheet" />
<link href="css/bootstrap.css" rel="stylesheet" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style type="text/css">

.check-btn{
padding: 0px 15px;
}

.register-btn{
padding: 6px 12px;
}
</style>
</head>
<body>
<div class="sidenav">
         <div class="login-main-text">
            <h2>MBTI<br> 회원가입을 환영합니다</h2>
            <p>register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form id="frm" action="regiAf.do" method = "post">
               
                  <div class="form-group">
                  
                     <label>MBTI</label><br>
                    <select name="mbti" id ="mbti" class="form-select" aria-label="Default select example" onfocus='this.size=5;'
                    onblur='this.size=1;' onchange='this.size=1; this.blur();'>
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
                  <label>ID</label>
                  <div class="form-group" style="display :flex;">
                     
                     <input type="text" class="form-control" placeholder="ID" name = "id" id="id" style="margin-right :10px;">                  
                     <button type="button" class="btn btn-dark check-btn" id="btn">확인</button>
                                                                                       
                   </div>    
                     <p id="idcheck" style="font-size: 12px;"></p>	
                 
                               
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" class="form-control" oninput="pwdCheck()" placeholder="Password" name = "pwd" id="pwd">
                  </div>
                  <p id="pwdWrite" style="font-size: 12px"></p>
                  
                  <div class="form-group">
                     <label>Name</label>
                     <input type="text" oninput="nameCheck()" class="form-control" placeholder="Name" name = "Name" id="name">
                  </div>
                  <p id="nameWrite" style="font-size: 12px"></p>
                  
                  <div class="form-group">
                     <label>Alias</label>
                     <input type="text" oninput="aliasCheck()" class="form-control" placeholder="Alias" name = "alias" id="alias">
                  </div>
                  <p id="aliasWrite" style="font-size: 12px"></p>
                  
                  <div class="form-group">
                     <label>Email</label>
                     <input type="text" oninput="emailCheck()" class="form-control" placeholder="Email" name = "email" id="email">
                  </div>
                  <p id="emailWrite" style="font-size: 12px"></p>
                  
                  <!-- ID중복체크 했는지 안했는지 확인을 위해 만듬 -->
                  <div>
                  <input type="hidden" id="idHidden" value="0">
                  </div>
                  <div>
                  <input type="hidden" id="pwdHidden" value="2">
                  </div>
                  <div>
                  <input type="hidden" id="aliasHidden" value="2">
                  </div>
                  <div>
                  <input type="hidden" id="nameHidden" value="2">
                  </div>                 
                             
                  <button type="button" class="btn btn-secondary register-btn" onclick="account()">회원가입</button>
                  
               </form>
               
            </div>
         </div>
      </div>
      
      
<script type="text/javascript">
      function account() {

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
    		else if($("#idHidden").val() == '0'){
   				alert('ID 중복 확인을 해주세요.');
   			}
   			else if($("#idHidden").val() == '2'){
   				alert('중복된 ID 입니다.');
   			}
   			else if($("#pwdHidden").val() == '2'){   				
   				alert('적절하지 않은 패스워드 입니다.');
   			} 
   			else if($("#nameHidden").val() == '2'){   				
   				alert('적절하지 않은 이름 입니다.');
   			}   
   			else if($("#aliasHidden").val() == '2'){   				
   				alert('적절하지 않은 닉네임 입니다.');
   			}   
   			else{
   				$("#frm").submit();
   			}
   			
    			
    		}
    	
      
      $(document).ready(function () {
    		
    		 $("#btn").click(function () {

    		if($("#id").val() == ''){
    			alert('ID를 입력해 주세요.')
    		}
    			else{
    			// id 확인 -> ajax
    			$.ajax({
    				url:"idcheck.do",
    				type:"post",
    				data:{ id:$("#id").val() },
    				success:function( msg ){
    				//	alert('success');
    				//	alert(msg);
    				
    					if(msg == "YES"){
    						$("#idcheck").css("color", "#808080");
    						$("#idcheck").html("사용 가능한 아이디입니다.");
    						$("#idHidden").val("1");
    					}
    					else{
    						$("#idcheck").css("color", "#ff0000");
    						$("#idcheck").html("이미 사용중인 아이디입니다.");
    						$("#id").val("");
    						$("#idHidden").val("2");
    					}			
    				},
    				error:function(){
    					alert('error');
    				}
    			});
    		}
    		});	
    	});
      
      function pwdCheck(){

    	  var pwd = $("#pwd").val();
    	  if(!/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/.test(pwd)) {
    		  $("#pwdWrite").css("color","#ff0000");
    	      $("#pwdWrite").html("문자,숫자,특수문자를 포함한 8자 이상 16자 미만의 패스워드를 설정해 주세요."); 
			  $("#pwdHidden").val("2");
    	  }
    	  else if(/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/.test(pwd)) {
    		  $("#pwdWrite").css("color","#808080");
    		  $("#pwdWrite").html("사용 가능한 패스워드 입니다.");
    		  $("#pwdHidden").val("1");

    	  }

      }
      
     function emailCheck(){
    	 var email = $("#email").val();
    	 var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
    	 
    	 if(!regEmail.test(email)){
    		 $("#emailWrite").css("color","#ff0000");
    		 $("#emailWrite").html('이메일 형식이 올바르지 않습니다.');
    	 }
    	 else if(regEmail.test(email)){
 			// id 확인 -> ajax
 			$.ajax({
 				url:"emailcheck.do",
 				type:"post",
 				data:{ email:$("#email").val() },
 				success:function( msg ){
 				//	alert('success');
 				//	alert(msg);
 				
 					if(msg == "YES"){
 						$("#emailWrite").css("color", "#808080");
 						$("#emailWrite").html("사용 가능한 이메일입니다.");

 					}else{
 						$("#emailWrite").css("color", "#ff0000");
 						$("#emailWrite").html("이미 사용중인 이메일입니다.");						
 
 					}			
 				},
 				error:function(){
 					alert('error');
 				}
 			});
 		}
     }
     
     function aliasCheck(){

   	  var alias = $("#alias").val();
   	  if(!/^([a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{1,10}$/.test(alias)) {
   		  $("#aliasWrite").css("color","#ff0000");
   	      $("#aliasWrite").html("문자와 숫자를 포함하고 2자 이상 10자 미만으로 작성해 주세요."); 
			  $("#aliasHidden").val("2");
   	  }
   	  else if(/^([a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{1,10}$/.test(alias)) {
   			// id 확인 -> ajax
			$.ajax({
				url:"aliascheck.do",
				type:"post",
				data:{ alias:$("#alias").val() },
				success:function( msg ){
				//	alert('success');
				//	alert(msg);
				
					if(msg == "YES"){
						$("#aliasWrite").css("color", "#808080");
						$("#aliasWrite").html("사용 가능한 닉네임입니다.");
						$("#aliasHidden").val("1");
					}else{
						$("#aliasWrite").css("color", "#ff0000");
						$("#aliasWrite").html("이미 사용중인 닉네임입니다.");						
						$("#aliasHidden").val("2");
					}			
				},
				error:function(){
					alert('error');
				}
			});
   	  }

     }
     
     function nameCheck(){

   	  var name = $("#name").val();
   	  if(!/^[가-힣]{2,7}$/.test(name)) {
   		  $("#nameWrite").css("color","#ff0000");
   	      $("#nameWrite").html("한글 이름의 2~7자 이내로 작성해 주세요."); 
		  $("#nameHidden").val("2");
   	  }
   	  else if(/^[가-힣]{2,7}$/.test(name)) {
   		  $("#nameWrite").css("color","#808080");
   		  $("#nameWrite").html("당신의 이름은 "+name+" 입니다!");
   		  $("#nameHidden").val("1");
   	  }

     }

    
</script>
</body>
</html>
