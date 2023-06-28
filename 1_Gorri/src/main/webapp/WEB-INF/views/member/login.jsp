<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
    <title>로그인 폼</title>
    <style>
     a{color:black; }
	 a:hover{color:#ffab00;}
	     
    </style>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
	<%@include file="../common/memberTop.jsp" %>
<!-- 	<img src="logo2.png" > -->
	
	<div class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">로그인 폼</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" action="${ contextPath }/loginConfirm.me" method="POST">
        <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
        <label for="inputEmail" class="sr-only">Your ID</label>
        <input name="userId" type="text" id="uid" class="form-control" placeholder="Your ID" required autofocus><BR>
        <label for="inputPassword" class="sr-only">Password</label>
        <input name="userPwd" type="password" id="upw" class="form-control" placeholder="Password"required><br>
       
        <button id="loginSubmit" class="btn btn-lg btn-primary btn-block" style="background-color:#ffab00; border:none;" type="submit">로 그 인</button><br>
        
        <a href="${contextPath}/join.me">
         <button id="joinSubmit" class="btn btn-lg btn-primary btn-block" style="background-color:#ffab00; border:none;" type="button">회 원 가 입</button>
        </a> 
        <br>
  		<div id="spanFind"> <a href="${ contextPath }/findId.me">아이디 찾기</a> / <a href="${ contextPath }/findPwd.me">비밀번호 찾기</a></div>	
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
  	
  	
  	document.addEventListener("keydown", (e)=>{
  		if(e.key == 'Enter'){
  			console.log(document.querySelector('form'));
  			document.querySelector('form').submit();
  		}
  	});
  
  </script>
  
  </body>
</html>