<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<link href="css/regiStyle.css?version4" rel="stylesheet" />
<link href="css/bootstrap.css?version2" rel="stylesheet" />
<!-- <link href="css/bootstrap-select.min.css" rel="stylesheet" /> -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>

<style type="text/css">
.check-btn{
padding: 0px 15px;
}

.register-btn{
padding: 6px 12px;
}

.btn-secondary2 {
    color: #fff;
    background-color: #6c757d;
    border-color: #6c757d;
}
.form-group > dropdown.bootstrap-select{
padding : 10px 32px;
}

.form-group button{
background-color:#f0f0f0;
padding : 10px 32px;
}
</style>

</head>

<body>

<article>
<div class="sidenav" style= "background-image : url(./resources/homeBoot/assets/img/solo_regi.jpg); background-size : cover;">
<div class="login-main-text">
   <h2 style="font-weight :bold;">PLAN 16<br>동료가 되어주세요!</h2>
   <p>회원가입으로 이용하실 수 있습니다.</p>
</div>
</div>
</article>
	<article>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form id="frm" action="regiAf.do" method = "post">     
                  <!-- MBTI SELECT -->       
                  <div class="form-group">    
                                                
                    <label>MBTI</label><br>
                    <select name="mbti" id ="mbti" class="selectpicker" style="border: 1px solid #ced4da; padding:10px 32px;" aria-label="Default select example" onfocus='this.size=5;' onblur='this.size=1;' onchange='this.size=1; this.blur();'>
                    
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
                  <!-- ID 입력 -->
                  <label>ID</label>
                  <div class="form-group" style="display :flex;">                     
                     <input type="text" class="form-control" placeholder="ID" name = "id" id="id" style="margin-right :10px;">                  
                     <button type="button" class="btn btn-dark check-btn" id="btn" style="color: #fff;background-color: #6c757d;border-color: #6c757d;"> 확인</button>                                                                   
                   </div>    
                     <p id="idcheck" style="font-size: 12px;"></p>	
                 
                  <!-- PWD 입력 -->            
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" class="form-control" oninput="pwdCheck()" placeholder="Password" name = "pwd" id="pwd">
                  </div>
                  <p id="pwdWrite" style="font-size: 12px"></p>
                  
                  <!-- NAME 입력 -->
                  <div class="form-group">
                     <label>Name</label>
                     <input type="text" oninput="nameCheck()" class="form-control" placeholder="Name" name = "Name" id="name">
                  </div>
                  <p id="nameWrite" style="font-size: 12px"></p>
                  
                  <!-- ALIAS 입력 -->
                  <div class="form-group">
                     <label>Alias</label>
                     <input type="text" oninput="aliasCheck()" class="form-control" placeholder="Alias" name = "alias" id="alias">
                  </div>
                  <p id="aliasWrite" style="font-size: 12px"></p>
                  
                  <!-- EMAIL 입력 -->
                  <div class="form-group">
                     <label>Email</label>
                     <input type="text" oninput="emailCheck()" class="form-control" placeholder="Email" name = "email" id="email">
                  </div>
                  <p id="emailWrite" style="font-size: 12px"></p>
                  
                  <!-- ID,pwd,alias,name 중복체크 및 정규식 적용 확인을 위해 만듬 -->
                  <div>
                  <input type="hidden" id="idHidden" value="0">                 
                  <input type="hidden" id="pwdHidden" value="2">                
                  <input type="hidden" id="aliasHidden" value="2">                 
                  <input type="hidden" id="nameHidden" value="2">
                  <input type="hidden" id="emailHidden" value="2">
                  </div>                 
                  <!-- 회원가입 버튼 -->
                  <button type="button" style="background-color:#004176; color:white" class="btn btn-secondary register-btn" onclick="account()">회원가입</button>
                  
               </form>
               
            </div>
         </div>
      </div>
      </article>
      
<script type="text/javascript">
	  //회원가입 버튼 클릭시 모든항목 검사 후 submit
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
   			else if($("#emailHidden").val() == '2'){   				
   				alert('적절하지 않은 이메일 입니다.');
   			}
   			else{
   				$("#frm").submit();
   			}   			    			
    	}
    	
      //ID중복체크 버튼 눌렀을때 실행되는 함수
      $(document).ready(function () {
    	  
    	 $("#btn").click(function () {
    		 //아이디 값이 비어있으면 alert
    		if($("#id").val() == ''){
    			alert('ID를 입력해 주세요.')
    		}    		 
    			else{	//입력된 ID값이 있을때
    			// id 확인 -> ajax
    			$.ajax({
    				url:"idcheck.do",
    				type:"post",
    				data:{ id:$("#id").val() },
    				success:function( msg ){

    					if(msg == "YES"){	//사용중인 ID가 없음
    						$("#idcheck").css("color", "#808080");
    						$("#idcheck").html("사용 가능한 아이디입니다.");
    						//중복 검사 했다는 의미로 값 1 넣어줌
    						$("#idHidden").val("1");
    					}
    					else{				//이미 사용중인 ID가 있음
    						$("#idcheck").css("color", "#ff0000");
    						$("#idcheck").html("이미 사용중인 아이디입니다.");
    						$("#id").val("");
    						//중복된 ID가 있다는 의미로 값 2넣어줌
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
      
      //PWD 정규식 검사 oninput속성으로 입력될때마다 검사함
      function pwdCheck(){
		
    	  var pwd = $("#pwd").val();
    	  if(!/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/.test(pwd)) {
    		  $("#pwdWrite").css("color","#ff0000");
    	      $("#pwdWrite").html("문자,숫자,특수문자를 포함한 8자 이상 16자 미만의 패스워드를 설정해 주세요."); 
    	      //정규식 검사 불합격의 의미로 2를 넣어줌
			  $("#pwdHidden").val("2");
    	  }
    	  else if(/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/.test(pwd)) {
    		  $("#pwdWrite").css("color","#808080");
    		  $("#pwdWrite").html("사용 가능한 패스워드 입니다.");
    		  //정규식 검사 통과의 의미로 1을 넣어줌
    		  $("#pwdHidden").val("1");

    	  }

      }
    //EMAIL 정규식 검사 oninput속성으로 입력될때마다 검사하고 통과하면 EMAIL 중복검사 실행
     function emailCheck(){
    	 var email = $("#email").val();
    	 var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
    	 
    	 if(!regEmail.test(email)){
    		 $("#emailWrite").css("color","#ff0000");
    		 $("#emailWrite").html('이메일 형식이 올바르지 않습니다.');
    	 }
    	 else if(regEmail.test(email)){
 			// email 확인 -> ajax
 			$.ajax({
 				url:"emailcheck.do",
 				type:"post",
 				data:{ email:$("#email").val() },
 				success:function( msg ){
 				
 					if(msg == "YES"){	//사용중인 이메일이 없음
 						$("#emailWrite").css("color", "#808080");
 						$("#emailWrite").html("사용 가능한 이메일입니다.");
 						$("#emailHidden").val("1");

 					}else{				//사용중인 이메일이 있음
 						$("#emailWrite").css("color", "#ff0000");
 						$("#emailWrite").html("이미 사용중인 이메일입니다.");		
 						$("#emailHidden").val("2");
 
 					}			
 				},
 				error:function(){
 					alert('error');
 				}
 			});
 		}
     }
     
  	 //ALIAS 정규식 검사 oninput속성으로 입력될때마다 검사하고 통과하면 ALIAS 중복검사 실행
     function aliasCheck(){

   	  var alias = $("#alias").val();
   	  if(!/^([a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{1,10}$/.test(alias)) {
   		  $("#aliasWrite").css("color","#ff0000");
   	      $("#aliasWrite").html("문자와 숫자를 포함하고 2자 이상 10자 미만으로 작성해 주세요."); 
			  $("#aliasHidden").val("2");
   	  }
   	  else if(/^([a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{1,10}$/.test(alias)) {
   			// ALIAS 확인 -> ajax
			$.ajax({
				url:"aliascheck.do",
				type:"post",
				data:{ alias:$("#alias").val() },
				success:function( msg ){
				//	alert('success');
				//	alert(msg);
				
					if(msg == "YES"){	//사용중인 ALIAS가 없음
						$("#aliasWrite").css("color", "#808080");
						$("#aliasWrite").html("사용 가능한 닉네임입니다.");
						//정규식,중복검사 통과의 의미로 1을 넣어줌
						$("#aliasHidden").val("1");
						
					}else{				//사용중인 ALIAS가 있음
						$("#aliasWrite").css("color", "#ff0000");
						$("#aliasWrite").html("이미 사용중인 닉네임입니다.");	
						//정규식은 통과했지만 중복검사를 통과하지 못해 2를 넣어줌
						$("#aliasHidden").val("2");
					}			
				},
				error:function(){
					alert('error');
				}
			});
   	  }

     }
     
  	 //NAME 정규식 검사
     function nameCheck(){

   	  var name = $("#name").val();
   	  if(!/^[가-힣]{2,7}$/.test(name)) {
   		  $("#nameWrite").css("color","#ff0000");
   	      $("#nameWrite").html("한글 이름의 2~7자 이내로 작성해 주세요.");
   	      //정규식 검사 불합격의 의미로 2를 넣어줌
		  $("#nameHidden").val("2");
   	  }
   	  else if(/^[가-힣]{2,7}$/.test(name)) {
   		  $("#nameWrite").css("color","#808080");
   		  $("#nameWrite").html("당신의 이름은 "+name+" 입니다!");
   		  //정규식 검사 통과의 의미로 1을 넣어줌
   		  $("#nameHidden").val("1");
   	  }

     }

    
</script>

</body>


</html>
