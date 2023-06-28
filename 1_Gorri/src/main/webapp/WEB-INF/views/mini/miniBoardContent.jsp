<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<title>Gorri</title>
<style>
	   #menu-minihome{color: #ffaa00; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: dimgray; font-weight: bold;}
   #menu-market{color: dimgray; font-weight: bold;}
   .minihome-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }
	
	/* 주황 테두리 부분 */
	.border-line{
		border : 2px solid #ffaa00; width : 1200px;
		margin-top: 100px;
		margin-left: auto; margin-right: auto;
		border-radius: 30px;
	}
	
	/* top - 프로필 사진 동그라미 부분*/
	.top-profile-img{
		position:relative;
		display: flex; 
		justify-content: center;
		margin-top: -75px;
		margin-bottom: 150px;}
	#profile-back{ /* 맨뒤에 주황*/
		width: 150px; height: 75px;
		background: #ffaa00;
		border-radius: 75px 75px 0 0;
		position: absolute;
		}
	#profile-white{ /* 가운데 흰색 */
		width: 146px; height:146px;
		background: white;
		border-radius: 50%;
		position: absolute;
		margin-top: 1.5px;
		}
	#profile{width: 130px; height: 130px;
		position: absolute;
		margin-top: 8.5px;
		}
	#profile-img{width: 100%; height: 100%; 
		border-radius: 50%;
		object-fit: cover;
		object-position: center;
	}
	
	/* <버튼, 게시글 제목, 작성일, ...버튼 부분 */
	.mid{display: flex; justify-content: center;}
	.div-title{
		width: 80%;
		display: flex; 
		justify-content: center;
		align-items : center;} 
	
	.titile-btn{width: 20px; height: 20px; font-size: 18px;} /* <, ... 크기 */
	.titile-btn:hover{color: gray; cursor: pointer;}  /* 버튼에 마우스 올렸을때 */
	.title{width: 80%; text-align: center;}
	.title-name{padding-left: 10px; font-weight: bold; font-size: 18px; } /* 게시글 제목 */
	.title-date{padding-left: 15px; font-size: 15px;} /* 작성날짜 */
	
	
 	/* 중간 줄*/ 
 	.mid-line{ 
 		border : 1px solid gray; width: 90%; 
 		margin-left:auto; margin-right:auto; margin-top: 20px; margin-bottom: 20px;} 
		

	/* 게시글 출력되는 부분 */
	.bottom{display: flex; justify-content: center;}
	.bottom-width{width: 80%;}
	.bottom-img{text-align: center; width: 100%; height: 500px; position: relative; overflow : hidden;}
	.imgg{width: 100%; height: 100%; object-fit: cover;}
	.bottom-text{  /* 게시글 내용 - 사용자가 입력한 내용 등록되게 */
		text-align: justify; /* 양쪽정렬 */
		white-space: pre-line; /* 엔터 인식 */
		margin-bottom: 10px;}
	.bottom-icon{
		display: flex; 
		justify-content: center;
		align-items : center;}
	.bottom-icon-like{width: 90%; text-align: right; font-size: 20px;}
	.bottom-icon-more{width: 30px; text-align: center; font-size: 20px;}

	/* 댓글부분 */
	#bottom-reply{display: flex; justify-content: center;}
	.bottom-reply-width{width: 80%;}
	.reply-info{
		display: flex; 
		justify-content: center;
		align-items : center;
		font-size: 14px; font-weight: bold;
		border-bottom: 1px solid rgba(255, 170, 0, 0.2);
		padding-bottom: 10px;
		margin-bottom: 10px;}
	.re{width: 35px;}
	.re-all{text-align: right; text-decoration: none; color: black; width:90%;} /* 댓글 전체보기 */
	
	.reply{
		width: 100%;
		display: flex; 
		justify-content: center;
		align-items : top; font-size: 14px;} /* 댓글부분 너비랑 글씨 크기 */
	.re-hover:hover{background: rgba(255, 170, 0, 0.1);}
	.re-profile-img{ /* 댓글 프사이미지 관련 */
		border-radius: 50%;			/* 댓글 프사 원형이미지로 */
		width: 40px; height: 40px;	/* 댓글 프사 이미지 크기 */
		object-fit: cover;			/* 댓글 프사 이미지 비율 맞춰서 꽉 차게*/
		object-position: center;	/* 프사 이미지 중간에 맞춰서 큰부분은 잘라냄요 */
		margin-right: 10px;}
	.re-id{width:100px; margin-top: 5px;} /* 아이디 표시되는 부분 - 아이디 글자 제한 수에 맞춰서 칸 조절하기 */
	.re-re{width: 55%; margin-top: 5px;}
	.re-date{width: 100px; text-align: right; margin-top: 5px;}
	.re-btn{width: 30px; text-align: center; margin-top: 5px;} /* ... 버튼 */


	/* 댓글 입력창 */
	.re-input{border-top: 1px solid rgba(255, 170, 0, 0.2); margin-top: 15px; padding-top: 15px;}
	.re-text{width: 100%; height: 30px; margin-right: 5px;} /* 댓글 입력창 */
	.re-submit{text-align: right; width: 100px;  padding-top: 5px;} 
	.submit-btn{height: 30px; border-radius: 4px; border: 1px solid black;} /* 댓글 등록 버튼 */
	.submit-btn:hover{background: rgba(255, 170, 0, 0.5); font-weight: bold;}
	#inputReplyContent{  height: 40px;
    padding: 0 10px;
    border: 1px solid #e5e5e5;
    border-radius: 12px;}
	


	/*---------------------------------------------------------------------------------------------------------------*/

	/* 모임-드롭다운 메뉴 관련 */
 	.drop-btn{background: none; color: gray; border: none; width: 10px;} /* ... 아이콘*/ 
	.drop-btn:hover{color: black;} /* ... 아이콘에 마우스 올렸을때*/
	.dropdown-menu{text-align: center; background: white; border: 1px solid lightray;} /* 드롭다운 메뉴창 */
	.dropdown-item{color: black; margin-top: 2px; margin-bottom: 2px;} /* 메뉴창 모임탈퇴 글씨 */
	.dropdown-item:hover{background: rgba(255, 170, 0, 0.3); color: dimgray;} /* 메뉴창 항목에 마우스 올렸을때 */
	.dropdown-menu-icon{font-size: 10px; margin-right: 12px;} /* 메뉴창 글씨 옆에 있는 아이콘*/
	
	
	/* 탈퇴 확인 */
	.modal-body{text-align: center;}
	.bi-emoji-frown-fill{font-size: 60px; color: #fa0;}
	.btn-n{background: lightgray; color: white;}
	.btn-n:hover{background: darkgray; color: black;}
	.btn-y{background: rgba(255, 170, 0, 0.5); color: white;}
	.btn-y:hover{background: rgba(255, 170, 0); color: black;}

	/*버튼*/
	.button {
	  width: 100px; height: 45px;
	  font-family: ;
	  font-size: 13px;
	  letter-spacing: 2.5px;
	  font-weight: 500;
	  color: #000;
	  background-color: #fff;
	  border: none;
	  border-radius: 45px;
	  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	  transition: all 0.3s ease 0s;
	  cursor: pointer;
	  outline: none;
	  margin: 5px;
	  }
	.button:hover {
		background-color: #ffaa00;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		color: #fff;
		transform: translateY(-7px);
		}
		
	.footer{
		display: flex; 
		justify-content: center;
		align-items : center;
		margin-top: 10px; margin-bottom: 30px;
		padding-top: 20px;
		border-top: 1px solid lightgray;
		}
	.footer{text-align: center;}
	.footer> .button{font-weight: bold;}
	
	#upRelyContent{width: 450px; height: 100px; margin-bottom: 10px; margin-top: 10px; vertical-align: text-top;}
	
	.userId{color: black;}
	.userId:hover{cursor: pointer;}
	
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<br>
	<div class="border-line"> <!-- 겉에 주황색 테두리 -->

   		<!-- 프로필사진 관련 -->
		<div class="top-profile-img"> 
			<div id="profile-back"></div>
			<div id="profile-white"></div>
			<c:if test="">
			</c:if>
			<div id="profile">
				<img id="profile-img" src="${ contextPath }/resources/uploadFiles/${profile.renameName}">
			</div>
		</div>
		
		
	<form class="needs-validation" method="POST" id="detail">
		<!-- 게시글제목, 버튼, 작성일 -->
		<div class="mid"> 
			<div class="div-title">
				<div class="prev-btn titile-btn"><i class="bi bi-chevron-left" onclick="location.href='javascript:history.back()'"></i></div> <!-- 이전으로 가는 설정 넣어야함 -->
				<div class="title" id="boardTop">
					<input type="hidden" name="boardNo" value="${b.boardNo }">
					<input type="hidden" name="usersId" value="${b.usersId }">
					<input type="hidden" name="page" value="${page }">
					<div class="title-name">${ b.boardTitle }</div>
					
					<c:if test="${loginUser.userId eq b.usersId }">
						<div class="title-date"><a class="userId" onclick="location.href='${contextPath}/miniMain.mi'">${ b.usersId }</a></div>
					</c:if>
					
					<c:if test="${!(loginUser.userId eq b.usersId) }">
						<div class="title-date"><a class="userId" onclick="location.href='${contextPath}/miniMainN.mi?userId=${b.usersId }'">${ b.usersId }</a></div>
					</c:if>
					
					
					<div class="title-date">${ b.modifydate }</div>
				</div>
				<div class="drop-btn titile-btn dropdown">
					<button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></button>
					<ul class="dropdown-menu">
						<li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1" <c:if test="${ !(b.usersId eq loginUser.userId) }">disabled</c:if>><i class="bi bi-trash3-fill dropdown-menu-icon"></i>게시글 삭제</button></li>
						<li><button class="dropdown-item" type="button" id="update"<c:if test="${ !(b.usersId eq loginUser.userId) }">disabled</c:if>><i class="bi bi-pencil-fill dropdown-menu-icon" ></i>게시글 수정</button></li>
					</ul>
				</div>
			</div>
		</div>
		
		
		<div class="mid-line"></div>
		
		
		<!-- 게시글 내용 관련 -->
		<br>
		<div class="bottom">
			<div class="bottom-width">
				<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
					<div class="carousel-inner">
						<c:forEach items="${list }" var="a">
							<div class="carousel-item active">
								<c:if test="${fn:containsIgnoreCase(a.renameName, 'jpg') or fn:containsIgnoreCase(a.renameName, 'png') or fn:containsIgnoreCase(a.renameName, 'jpeg') }">
									<div class="bottom-img">
										<img src="${contextPath}/resources/uploadFiles/${a.renameName}" class="d-block imgg">
									</div>
								</c:if>
							</div>
						</c:forEach>
					</div>
					
					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
				<div class="bottom-text">
					${ b.boardContent }
				</div>
			</div>
		</div>
	</form>
		<div class="mid-line"></div>
		
		
		<!-- 입력된 댓글 -->
		<div id="bottom-reply">
			<div class="bottom-reply-width">
<!-- 				<div class="reply-info"> 댓글개수, 댓글전체보기 -->
<!-- 					<div class="re">댓글</div> -->
<!-- 					<div class="re">00개</div> -->
<!-- 				</div> -->
				<div id="replyBody">
					<c:forEach items="${ rList }" var="r">
						<div class="reply re-hover replies"> <!-- 달린 댓글들 - 댓글을 하나 달면 div 하나씩 추가되야함요... -->
							<input type="hidden" name="replyNo" value="${r.replyNo }">
							<input type="hidden" name="replyWriter" value="${r.replyWriter }">
							<input type="hidden" name="replyBoardNo" value="${r.boardNo }">
							<div class="re-img"><img class="re-profile-img" src="${contextPath}/resources/assets/gorri-removebg.png"></div>
							<div class="re-id">${ r.replyWriter }</div>
							<div class="re-re">${ r.replyContent }</div>
							<div class="re-date">${ r.replyModifyDate }</div>
							<div class="re-btn dropdown">
								<c:if test="${ r.replyWriter eq loginUser.userId }">
									<button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></button>
									<ul class="dropdown-menu">
										<li><button class="dropdown-item deleteReply" type="button"><i class="bi bi-trash3-fill dropdown-menu-icon"></i>댓글 삭제</button></li>
										<li><button class="dropdown-item updateReply" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal2"><i class="bi bi-pencil-fill dropdown-menu-icon"></i>댓글 수정</button></li>
									</ul>
								</c:if>
							</div>
						</div>
					</c:forEach>
				</div>
				<div>
					<div class="reply re-input">
						<div class="re-img"><img class="re-profile-img" src="${contextPath}/resources/assets/gorri-removebg.png"></div> <!-- 로그인한 사용자 프로필 주소로 변경하기.. -->
						<div class="re-text"><input id="inputReplyContent" class="re-text" type="text" placeholder="내용을 입력하세요."></div>
						<div class="re-submit"><button type="button" id="replySubmit" class="submit-btn" <c:if test="${ empty loginUser }">disabled</c:if>>댓글등록</button></div>
					</div>
				</div>
			</div>
		</div>

	
	<br>
	
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<!-- 삭제확인 알림창 -->
	<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">게시글 삭제하기</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	     	 <i class="bi bi-emoji-frown-fill"></i><br>
	       	삭제 된 게시글은 복구 할 수 없습니다.<br>
	        정말 삭제하시겠습니까?
	      </div>
	      <div class="footer">
	        <button type="button" class="button btn-n" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="button btn-y" id="deleteBoard">삭제하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<form id="updateForm" method="post">
	<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">댓글 수정하기</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<input type="hidden" name="bNo" id="refBoardNo">
	      	<input type="hidden" name="bId" id="refBoardWriter">
	      	<input type="hidden" name="upReNo" id="upRelyNo">
	      	<input type="hidden" name="upReWriter" id="upRelyWriter">
	     	<input type="text" name="upReContent" id="upRelyContent" ><br>
	      </div>
	      <div class="footer">
	        <button type="button" class="button btn-n" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="button btn-y" id="updateReplyContent">댓글수정</button>
	      </div>
	    </div>
	  </div>
	</div>
	</form>
	
	<script>
		window.onload = () =>{
			const updBtn = document.getElementById('update');
			const detail = document.getElementById('detail');
				updBtn.addEventListener('click', function(){
					location.href="${contextPath}/boardEdit.hb?boardNo=${b.boardNo}"
			})
			
			const deleteBtn = document.getElementById('deleteBoard');
			deleteBtn.addEventListener('click', function(){
				detail.action = '${contextPath}/deleteBoard.hb';
				detail.submit();
			})
			
			const replySubmit = document.getElementById('replySubmit');
			replySubmit.addEventListener('click', ()=>{
				
				const commentText = document.getElementById('inputReplyContent').value.trim(); // 입력된 댓글 내용 가져오기
		        if (commentText === '') {
		          alert('댓글을 입력해주세요.'); // 댓글 입력값이 비어있을 경우 알림 메시지 표시
		          return; // 함수 종료
		        }
				
				const replyLength = document.getElementById('inputReplyContent').value;
				const boardNo = boardTop.querySelector('input[name="boardNo"]').value;
				const userId = boardTop.querySelector('input[name="usersId"]').value;
				if(replyLength.length >= 100){
					alert('댓글의 길이가 100자를 넘겼습니다.');
				}else{
					$.ajax({
						url: '${contextPath}/insertReply.hb',
						dataType: 'json',
						data:{
							replyContent:document.getElementById("inputReplyContent").value,
							replyWriter:'${loginUser.userId}',
							boardNo:${b.boardNo}
						},
						success: data =>{
							console.log(data);
							const replyBody = document.getElementById('replyBody');
							replyBody.innerHTML = '';
							
							for(const r of data){
								const reDiv = document.createElement('div');
								reDiv.classList.add('reply', 're-hover', 'replies');
								
								const reImg = document.createElement('div');
								reImg.classList.add('re-img');
								reImg.innerHTML = '<img class="re-profile-img" src="${contextPath}/resources/assets/gorri-removebg.png">';
								
								const reId = document.createElement('div');
								reId.classList.add('re-id');
								reId.innerText = r.replyWriter;
								
								const reCont = document.createElement('div');
								reCont.classList.add('re-re');
								reCont.innerText = r.replyContent;
								
								const reDate = document.createElement('div');
								reDate.classList.add('re-date');
								reDate.innerText = r.replyModifyDate;
								
								
								const reBtn = document.createElement('div');
								reBtn.classList.add('re-btn', 'dropdown');
								reBtn.innerHTML = '<c:if test="${ r.replyWriter eq loginUser.userId }"><button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></button>';
								reBtn.innerHTML = '<ul class="dropdown-menu"><li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><i class="bi bi-trash3-fill dropdown-menu-icon"></i>댓글 삭제</button></li><li><button class="dropdown-item" type="button" data-bs-toggle="modal" id="updateReply"><i class="bi bi-pencil-fill dropdown-menu-icon"></i>댓글 수정</button></li></ul></c:if>';
								
								reDiv.append(reImg);
								reDiv.append(reId);
								reDiv.append(reCont);
								reDiv.append(reDate);
								reDiv.append(reBtn);
								
								replyBody.append(reDiv);
							}
							document.getElementById('inputReplyContent').value = '';
							location.href="${contextPath}/miniBoardContent.mi?bNo=" + boardNo + "&bId=" + userId;
						},
						error: data =>{
							console.log(data);
						}
					});
				}
			});
			
			const delReplyBtns = document.getElementsByClassName('deleteReply');
			for(const delReplyBtn of delReplyBtns){
				delReplyBtn.addEventListener('click', function(){
					const delReWriter = delReplyBtn.closest('.reply').querySelector('input[name="replyWriter"]').value;
					const delReNo = delReplyBtn.closest('.reply').querySelector('input[name="replyNo"]').value;
					const boardNo = boardTop.querySelector('input[name="boardNo"]').value;
					const userId = boardTop.querySelector('input[name="usersId"]').value;
					
					location.href="${contextPath}/deleteReply.hb?replyNo=" + delReNo + "&replyWriter=" + delReWriter + "&bNo=" + boardNo + "&bId=" + userId;
				});
			}
			
			const upReplyBtns = document.getElementsByClassName('updateReply');
			const boardTop = document.getElementById('boardTop');
			for(const upReplyBtn of upReplyBtns){
				upReplyBtn.addEventListener('click', function(){
					const upReNo = upReplyBtn.closest('.reply').querySelector('input[name="replyNo"]').value;
					const upReWriter = upReplyBtn.closest('.reply').querySelector('input[name="replyWriter"]').value;
					const upReContent = upReplyBtn.closest('.reply').querySelector('.re-re').innerText;
					const boardNo = boardTop.querySelector('input[name="boardNo"]').value;
					const userId = boardTop.querySelector('input[name="usersId"]').value;
					
					
					document.getElementById('upRelyNo').value = upReNo;
					document.getElementById('upRelyWriter').value = upReWriter;
					document.getElementById('upRelyContent').value = upReContent;
					document.getElementById('refBoardNo').value = boardNo;
					document.getElementById('refBoardWriter').value = userId;
					
				})
			}
			
			const updateReForm = document.getElementById('updateForm');
			document.getElementById('updateReplyContent').addEventListener('click', function(){
				updateReForm.action = '${contextPath}/updateReply.hb';
				updateReForm.submit();
			});
		}
	
	</script>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>