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
                     <button type="button" class="btn btn-dark check-btn" id="btn" onclick="idcheck()">확인</button>
                                                                                       
                   </div>    
                     <p id="idcheck" style="font-size: 14px"></p>	
                 
                               
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" class="form-control" placeholder="Password" name = "pwd" id="pwd">
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
                  <div>
                  <input type="hidden" id="chcheck" value="0">
                  </div>
                  
                             
                  <button type="button" class="btn btn-secondary register-btn" onclick="account()">회원가입</button>
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
    			if($("#chcheck").val() == '0'){
    				alert('ID 중복확인을 해주세요.');
    			}
    			else if($("#chcheck").val() == '2'){
    				alert('중복된 ID 입니다.');
    			}
    			else if($("#chcheck").val() == '1'){
    				$("#frm").submit();
    			}
    			
    		}
    	}
      
      $(document).ready(function () {
    		
    		$("#btn").click(function () {
    		//	alert('btn click');
    		//	let id = $("#id").val();
    		//	alert(id);
    			
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
    						$("#chcheck").val("1");
    					}else{
    						$("#idcheck").css("color", "#ff0000");
    						$("#idcheck").html("사용중인 아이디입니다.");
    						$("#id").val("");
    						$("#chcheck").val("2");
    					}			
    				},
    				error:function(){
    					alert('error');
    				}
    			});
    		});	
    	});

    
</script>
</body>
</html>
