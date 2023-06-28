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
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
	<%@include file="../common/memberTop.jsp" %>

	
	<div class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">비밀번호 재설정</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" method="POST" action="${ contextPath }/changePwd.me" onsubmit="return validateForm()">
        <label for="memberId">&nbsp;&nbsp;아이디</label>
        <input type="text" id="memberId" class="form-control" placeholder="Your Id" name="userId" value="${ userId }" readonly><BR>
       
       	<label for="password">&nbsp;&nbsp;새 비밀번호</label>
        <input type="password" id="password" class="form-control" name="userPwd" placeholder="새 비밀번호" required><br>
        <label for="passwordConfirm">&nbsp;&nbsp;새 비밀번호 재입력</label>
        <input type="password" id="passwordConfirm" class="form-control" placeholder="비밀번호 확인" required><br>
        
<!--         <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" id="findIdbut" type="button">아 이 디 찾 기</button><br> -->
        
        	<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">비 밀 번 호 재 설 정</button>
      	<br>
        <a href="${ contextPath }/main.do">
        	<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button">메 인 으 로</button>
      	</a>
      </form>
      
		</div>
	</div>

	<div class="modal">
	</div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 

  	<script>
  	function validateForm(){
		const password = document.getElementById("password").value;
	 	const confirmPassword = document.getElementById("passwordConfirm").value;	
		if (password !== confirmPassword) {
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		    return false; // 폼 전송 막음
		}		
		return true;
	}
  	</script>
  </body>
</html>