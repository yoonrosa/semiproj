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
    <title>회원가입</title>
    
    <style>
    #spanFind{text-align:center; color:black; text-decoration:none;}
    .ubirth{
    	position: relative;
  		height: 40px;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
  		
  		width: 50px;
    }
    .selectCate{
    	width:100%;
    	text-align:left;
    	background-image: none;
    }
    
    .selectCate::after {
	     display:none;
    
	}
    
    .movePage{
    	text-decoration:none;
    	font-size:15px;
    	color:lightgray;
    }
    .movePage:hover{
    	color:black;
    }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" type="text/javascript"></script>

  </head>
  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
  	<%@include file="../common/memberTop.jsp" %>
	<div class="card align-middle" style="width:40rem; border-radius:20px;">
		<div class="card-title" style="margin-top:30px;">
			<h2 class="card-title text-center" style="color:#113366;">내 정보 수정</h2>
		</div>
		<div class="card-body">
		
      <form class="form-signin" onsubmit="return "method="POST" action="${contextPath }/updateMember.me">
        
        <label for="uName">&nbsp;&nbsp;이름</label>
        <input type="text" id="uName" class="form-control" placeholder="Your Name" name="userName" value="${ loginUser.userName }" readonly><BR>
        
        
        <label for="uid">&nbsp;&nbsp;아이디</label>
        <input type="text" id="uid" class="form-control" placeholder="Your ID" name="userId" value="${ loginUser.userId }" readonly><br>
         
        <label for="uNickName">&nbsp;&nbsp;닉네임</label>
        <input type="text" id="uNickName" class="form-control" placeholder="Your Nickname" name="nickName" value="${ loginUser.nickName }"required>
         <p id="checkNickName">&nbsp;</p>
		       
        <label for="upwc">&nbsp;&nbsp;비밀번호 찾기 질문</label><br>
        <button type="button" class="btn btn-danger dropdown-toggle selectCate" data-bs-toggle="dropdown" aria-expanded="false"  style="background-color:white; border:1px solid lightgrey; color:black;">
   				 ${ loginUser.pwdQ }
  		</button> &nbsp;
  		
  		
  		<ul class="dropdown-menu">
    		<li><a class="dropdown-item cateSel">나의 보물 제 1호는?</a></li>
    		<li><a class="dropdown-item cateSel">나와 가장 친한 친구는?</a></li>
    		<li><a class="dropdown-item cateSel">가장 기억에 남는 장소는?</a></li>
  		</ul>
  		<input type="hidden" name="pwdQ" value="${ loginUser.pwdQ }">
        <br>
		
		       
        <label for="pwfindA">&nbsp;&nbsp;비밀번호 찾기 답</label>
        <input type="text" id="pwfindA" class="form-control" name="pwdHint" value="${ loginUser.pwdHint }" required><br>
                
        <label for="uphone">&nbsp;&nbsp;핸드폰 번호</label>
        <input type="text" id="uphone" class="form-control" name="phone" value="${ loginUser.phone }" required><br>

        <div style="text-align:right; padding-right:10px;">
        	<span id="changePwd" class="movePage">비밀번호 수정하기</span> | <span id="deleteMyInfo" class="movePage">탈퇴하기</span>
        </div>
        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit" style="border:#ffab00; background-color:#ffab00;">정보 수정하기</button><br>
       
        <a href="${ contextPath }/main.do">
        	<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button">메 인 으 로</button>
      	</a>
      </form>
      
		</div>
	</div>

	<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
			<div class="modal-dialog" role="document">
    			<div class="modal-content rounded-3 shadow">
	      				<div class="modal-body p-4 text-center">
	        				<h3 class="mb-0">정말로 탈퇴하시겠습니까?</h3>
	        				<p class="mb-0">탈퇴 후 이 계정은 다시 사용하실 수 없습니다. </p>
	      				</div>
	      				<div class="modal-footer flex-nowrap p-0">
		        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" onclick="location.href='${contextPath}/quitGorri.me?userId=${ loginUser.userId }'">
		        				<strong>네</strong>
		        			</button>
		        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
		      			</div>
    			</div>
  			</div>
	</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
  	<script>
	const label = document.querySelector('.selectCate');
	const options = document.querySelectorAll('.dropdown-item');	
	
	const handleSelect = function(item) {
	  label.innerHTML = item.textContent;
	  label.parentNode.classList.remove('active');
	}
	
	
	options.forEach(function(option){
	  option.addEventListener('click', function(){handleSelect(option)})
	})
	
	
	for(const option of options) {
		option.addEventListener('click', function() {
			document.getElementsByName('pwdQ')[0].value = label.innerText;
		})
	}
	
	
	// 2023.05.12 회원가입 구현 시 추가 : 닉네임 중복 체크 
	document.getElementById('uNickName').addEventListener('change', function() {
		const uNickResult = document.getElementById('checkNickName'); 
			$.ajax({
				url : '${contextPath}/checkNick.me',
				data : {nickName : this.value.trim()},
				success : data => {
					if(data == 'yes') {
						uNickResult.innerHTML = '&nbsp;사용 가능한 닉네임입니다.'
						uNickResult.style.color = 'blue';
					} else if(data =='no') {
						uNickResult.innerHTML = '&nbsp;해당 닉네임을 사용할 수 없습니다.'
						uNickResult.style.color = 'red';
					}
				}, 
				error : data => {
					console.log(data);
				}
			});
		
	})
	
	document.getElementById('changePwd').addEventListener('click', ()=>{
		location.href="${contextPath}/updatePwdPage.me";
	})
	
	document.getElementById('deleteMyInfo').addEventListener('click', ()=>{
		modal();
	})
	
	function validateForm(){
		const nickStatus = document.getElementById('checkNickName').innerHTML;
		if(nickStatus == '&nbsp;해당 닉네임을 사용할 수 없습니다.'){
			alert("닉네임을 확인해주세요.")
			return false;
		}
		return true;
	}
	
	
	
	const deletModal = document.getElementById('deleteMyInfo');
	deletModal.addEventListener('click', ()=>{
		$('#modalChoice').modal('show');
	})
	
	
	
  	</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  </body>
</html>