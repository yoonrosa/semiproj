<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/sign_in.css"></link>
    <title>비밀번호 재설정</title>
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
<!--     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
<!--     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>  -->
	<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
  	
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
	<%@include file="../common/memberTop.jsp" %>

	
	<div class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">비밀번호 재설정</h2>
		</div>
		<div class="card-body">
      
      <form class="form-signin" method="POST" action="${ contextPath }/changePwd.me" onsubmit="return validateForm()">
        	<label for="uid">&nbsp;&nbsp;아이디</label>
       		<input type="text" id="uid" class="form-control" placeholder="Your ID" name="userId" value="${ loginUser.userId }" readonly><br>
        	<label for="currentPwd">&nbsp;&nbsp;현재 비밀번호</label> 
			<input type="password" id="currentPwd" class="form-control" name="currentPwd" placeholder="Password" required>
			<div id="checkCurrentPwd">&nbsp;&nbsp;</div>
		
       		<label for="upw">&nbsp;&nbsp;비밀번호</label>
        	<input type="password" id="upw" class="form-control" name="userPwd" placeholder="Password" required><br>
        	<label for="upwc">&nbsp;&nbsp;비밀번호 확인</label>
        	<input type="password" id="upwc" class="form-control" placeholder="Password Confirm" required><br>
        
        	<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">비 밀 번 호 재 설 정</button>
      	<br>
        <a href="${ contextPath }/main.do">
        	<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button">메 인 으 로</button>
      	</a>
      </form>
      
		</div>
	</div>

    <script>
  	function validateForm(){
		const password = document.getElementById("upw").value;
	 	const confirmPassword = document.getElementById("upwc").value;	
		if (password !== confirmPassword) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		    return false; // 폼 전송 막음
		}		
		
		if(document.getElementById('checkCurrentPwd').innerHTML == '&nbsp;비밀번호가 일치하지 않습니다.'){
			alert("비밀번호를 확인해주세요");
			return false;
		}
		
		return true;
	}
  	
  	document.getElementById('currentPwd').addEventListener('change', function(){
		const checkCurrentPwd = document.getElementById('checkCurrentPwd');
		const userId = document.getElementById('uid').value;

		$.ajax({
			url : '${contextPath}/checkCurrentPwd.me',
			data : {
				userPwd : this.value.trim(),
				userId : userId		
			},
			success : data =>{
				if(data == "yes"){
					checkCurrentPwd.innerHTML = '&nbsp;비밀번호가 일치합니다.';
					checkCurrentPwd.style.color = 'green';
				} else{
					checkCurrentPwd.innerHTML = '&nbsp;비밀번호가 일치하지 않습니다.';
					checkCurrentPwd.style.color = 'red';
				}	
			},
			error: data =>{
				console.log(data);
			}
		})
	})
	
	
	
	
  	</script>
  </body>
</html>