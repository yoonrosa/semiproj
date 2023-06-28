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
    <title>비밀번호 찾기</title>
    
    <style>
	    .selectCate{
	    	width:100%;
	    	text-align:left;
	    	border-color:lightgrey;
	    	
	    }
	    
	    .selectCate::after {
		  display:none;
		}
	    .dropdown-menu{
	    	border-color:lightgrey;
	    }
	    .cateSel{
	    	border-color:lightgrey;
	    }
	    #notMatch{
	    	font-size:20px;
	    	font-weight:bold;
	   		color:red;
	    }
	    
	    #checkPwdQ{
	    	background-color:#ffab00;
	    }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
	<%@include file="../common/memberTop.jsp" %>

	
	<div class="card align-middle" style="width:20rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">비밀번호 찾기</h2>
		</div>
		<div class="card-body">
      <form class="form-signin" method="POST" id="findPwdform" accept-charset="UTF-8" action="${ contextPath }/resetPwd.me">
        <label for="memberId">&nbsp;&nbsp; 아이디</label>
        <input type="text" id="memberId" class="form-control" placeholder="Your Id" name="userId" required autofocus><BR>
       

        <label for="upwc">&nbsp;&nbsp;비밀번호 찾기 질문</label><br>
        <div class="d-flex justify-content-end">
		  <button type="button" class="btn btn-danger dropdown-toggle selectCate" data-bs-toggle="dropdown" aria-expanded="false" style="border: 1px solid lightgrey; color:black; background-color:white;">
		     -------
		  </button>
		  <ul class="dropdown-menu">
		     <li><a class="dropdown-item cateSel">나의 보물 제 1호는?</a></li>
		     <li><a class="dropdown-item cateSel">나와 가장 친한 친구는?</a></li>
		     <li><a class="dropdown-item cateSel">가장 기억에 남는 장소는?</a></li>
		  </ul>
		  <input type="hidden" id="pwdQ" name="pwdQ">
		</div><br>
		
        <label for="pwfindA">&nbsp;&nbsp;비밀번호 찾기 답</label>
        <input type="text" id="pwfindA" class="form-control" name="pwdHint" placeholder="Answer" required><br>
        <div id="notMatch">
        
        </div>
        <button id="checkPwdQ" class="btn btn-lg btn-primary btn-block" type="submit">비 밀 번 호 재 설 정</button><br>
       </form>                
       	
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
	const label = document.querySelector('.selectCate');
	const options = document.querySelectorAll('.dropdown-item');
	const form = document.getElementById('findPwdform');
	// 클릭한 옵션의 텍스트를 라벨 안에 넣음
	const handleSelect = function(item) {
	  label.innerHTML = item.textContent;
	  label.parentNode.classList.remove('active');
	}
	// 옵션 클릭시 클릭한 옵션을 넘김
	options.forEach(function(option){
	  option.addEventListener('click', function(){
		  handleSelect(this);
		  document.getElementById('pwdQ').value=this.innerText;
		  console.log(document.getElementById('pwdQ').value);
		  
	  })
	})
	
	
  	</script>
  
  </body>
</html>