<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
	
<title>Gorri</title>
<style>
   #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: #ffaa00;; font-weight: bold;}
   #menu-market{color: dimgray; font-weight: bold;}
   .group-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }

	
	/* 주황 테두리 부분 */
	.border-line{
		border : 2px solid #ffaa00; width : 60%; 
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
	.title-date{padding-left: 15px; font-size: 13px;} /* 작성날짜 */
	
	
 	/* 중간 줄*/ 
 	.mid-line{ 
 		border : 1px solid gray; width: 90%; 
 		margin-left:auto; margin-right:auto; margin-top: 20px; margin-bottom: 20px;} 
		

	/* 게시글 출력되는 부분 */
	.bottom{display: flex; justify-content: center;}
	.bottom-width{width: 80%;}
	.bottom-img{text-align: center;}
	.imgg{width: 90%;}
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
	.bottom-reply{display: flex; justify-content: center;}
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
 	.re-all{text-align: left; text-decoration: none; color: black; width:90%;} 
	
	.reply{
		width: 100%;
		display: flex; 
		justify-content: left;
		align-items : top; font-size: 14px;} /* 댓글부분 너비랑 글씨 크기 */
	.re-hover:hover{background: rgba(255, 170, 0, 0.1);}
	.re-profile-img2{
		border-radius: 50%;			/* 댓글 프사 원형이미지로 */
		width: 40px; height: 40px;	/* 댓글 프사 이미지 크기 */
		object-fit: cover;			/* 댓글 프사 이미지 비율 맞춰서 꽉 차게*/
		object-position: center;	/* 프사 이미지 중간에 맞춰서 큰부분은 잘라냄요 */
		margin-right: 10px;
	}
	#re-profile-img{ /* 댓글 프사이미지 관련 */
		border-radius: 50%;			/* 댓글 프사 원형이미지로 */
		width: 40px; height: 40px;	/* 댓글 프사 이미지 크기 */
		object-fit: cover;			/* 댓글 프사 이미지 비율 맞춰서 꽉 차게*/
		object-position: center;	/* 프사 이미지 중간에 맞춰서 큰부분은 잘라냄요 */
		margin-right: 10px;}
	.re-id{width:100px; margin-top: 5px;} /* 아이디 표시되는 부분 - 아이디 글자 제한 수에 맞춰서 칸 조절하기 */
	.re-re{width: 55%; height:45px; margin-top: 5px;}
	.re-date{width: 100px; text-align: right; margin-top: 5px;}
	.re-btn{width: 30px; text-align: center; margin-top: 5px;} /* ... 버튼 */


	/* 댓글 입력창 */
	.re-input{border-top: 1px solid rgba(255, 170, 0, 0.2); margin-top: 15px; padding-top: 15px;}
	.re-text{width: 100%; height: 45px; margin-right: 5px; padding-top: 5px;} /* 댓글 입력창 */
	.re-submit{text-align: right; width: 100px;  padding-top: 5px;} 
	.submit-btn{height: 30px; border-radius: 4px; border: 1px solid black;} /* 댓글 등록 버튼 */
	.submit-btn:hover{background: rgba(255, 170, 0, 0.5); font-weight: bold;}


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
	
	.modal-backdrop {
   		display: none !important;
	}

	/* 댓글 삭제*/
	.fade-out {
  animation: fadeOut 1s forwards;
}

@keyframes fadeOut {
  from {
    opacity: 1;
  }
  to {
    opacity: 0;
  }
}

/* .allReply { left : 0 auto;} */
	
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<%@include file="../common/top.jsp" %>
	<br><br>
	<div class="border-line"> <!-- 겉에 주황색 테두리 -->
   
   		<!-- 프로필사진 관련 -->
		<div class="top-profile-img"> 
			<div id="profile-back"></div>
			<div id="profile-white"></div>
			<div id="profile">
				<!-- 게시글 작성자의 프로필 사진이 없으면 기본 사진으로 설정 // 미니홈 이후 수정  -->
				<c:if test="${ !empty pAttm }">
				<img id="profile-img" src="${ contextPath }/resources/uploadFiles/${pAttm.renameName}">
				</c:if>
				<c:if test="${ empty pAttm }">
				<img id="profile-img" src="https://botsitivity.org/static/media/noprofile.c3f94521.png">
				</c:if>
			</div>
		</div>
		
		
		<!-- 게시글제목, 버튼, 작성일 -->
		<div class="mid"> 
			<div class="div-title">
				<div class="prev-btn titile-btn"><i class="bi bi-chevron-left" id="goBack"></i></div> <!-- 이전으로 가는 설정 넣어야함 -->
				<div class="title">
					<div class="title-name">${ list.title }</div>
					<div class="title-date">${ list.modifyDate }  | 작성자 <a href="${contextPath}/miniMainN.mi?userId=${ list.usersId }" style="color:black">${ list.usersId }</a></div>
				</div>
				<c:if test="${ list.usersId eq loginUser.userId}">
				<div class="drop-btn titile-btn dropdown">
					<button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"></button>
					<ul class="dropdown-menu">
						<li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><i class="bi bi-trash3-fill dropdown-menu-icon"></i>게시글 삭제</button></li>
						<li><button class="dropdown-item" type="button" data-bs-toggle="modal" onclick="updateWrite()"><i class="bi bi-pencil-fill dropdown-menu-icon"></i>게시글 수정</button></li>
					</ul>
				</div>
				</c:if>
			</div>
		</div>
		
		
		<div class="mid-line"></div>	
	
		
		<!-- 게시글 내용 관련 -->
		<div class="bottom">
			<div class="bottom-width">
				<div class="bottom-img">
					 <c:if test="${ !empty gAttm.renameName }">
						 <img class="imgg" src="${ contextPath }/resources/uploadFiles/${gAttm.renameName}"> 
					 </c:if>
					 <c:if test="${ empty gAttm.renameName }">  <!-- 새로운 파일이 없으면  -->
					 	<c:if test="${fn:contains(originFile, 'png') or fn:contains(originFile, 'jpg')}">
				            <c:set var="fileNames" value="${fn:split(originFile, ',')}" />
	   			 			<c:set var="filename" value="${fileNames[0]}" />
				            <img class="imgg" src="${filename}">
			        	</c:if>
					 </c:if>
					
				</div>
				<div class="bottom-text">
					${ list.content }
				</div>
				<div class="bottom-icon">
					<div class="bottom-icon-like">
						<a><i class="bi bi-arrow-tough-heart-fill"></i></a>
					</div>
					<div>
						<button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></button>
							<ul class="dropdown-menu">
								<li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><i class="bi bi-trash3-fill dropdown-menu-icon"></i>게시글 삭제</button></li>
								<li><button class="dropdown-item" type="button" data-bs-toggle="modal" onclick="updateBoard()"><i class="bi bi-pencil-fill dropdown-menu-icon"></i>게시글 수정</button></li>
							</ul>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="mid-line"></div>
		
		<!-- 입력된 댓글 -->
		<div class="bottom-reply">
			<div class="bottom-reply-width">
				<div class="reply-info" id="replyScope"> <!-- 댓글개수, 댓글전체보기 -->
					<div class="re">댓글</div>
					<div class="re" id="rCount">${ rCount }</div>
					<div class="re-all"><a href="#" class="re-all"></a></div>
				</div>
				<!-- 댓글 등록 시 프로필 사진  -->
				<div class="reply">
						<div class="re-img"><img class="re-profile-img2" src="${contextPath}/resources/assets/no-img.png"></div>
						 <!-- 로그인한 사용자 프로필 주소로 변경하기.. -->
						<div class="re-text"><input class="re-text" type="text" id="commentText" placeholder="내용을 입력하세요."></div>
						<div class="re-submit"><button type="submit" class="submit-btn" id="replySubmit">댓글등록</button></div>
				</div><hr id="hr" style="background-color: orange;">
				<!-- 등록된 댓글 조회  -->
				<div id="empty">
					<c:forEach items="${replyList }" var="r">
						<input type="hidden" value="r.replyWriter" name="replyWriter">
						<div class="reply re-hover" class="allReply"> 
<%-- 							<c:if test="${ !empty pAttm}"> --%>
<%-- 								<div class="re-img"><img class="re-profile-img2" src="${ pAttm.renameName }"></div> --%>
<%-- 							</c:if> --%>
<%-- 							<c:if test="${ empty pAttm }"> --%>
								<div class="re-img"><img class="re-profile-img2" src="${contextPath}/resources/assets/no-img.png"></div>
<%-- 							</c:if> --%>
							<div class="re-id"><span>${ r.replyWriter }</span></div>
							<div class="re-re" id="commentText-${r.replyNo }"><span>${ r.replyContent }</span></div>
							<div class="re-date"><span>${r.replyModifyDate}</span></div>
							<!-- 본인이 작성한 게시글만 수정/삭제 가능 -->
							<c:if test="${r.replyWriter eq loginUser.userId}">
							<div class="re-btn dropdown">
								<button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></button>
								<ul class="dropdown-menu">
									<li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal2" onclick="deleteReply(${r.replyNo})"><i class="bi bi-trash3-fill dropdown-menu-icon"></i>댓글 삭제</button></li>
									<li><button class="dropdown-item" type="button" data-bs-toggle="modal" onclick="updateReply(${r.replyNo})"><i class="bi bi-pencil-fill dropdown-menu-icon"></i>댓글 수정</button></li>
								</ul>
							</div>
							</c:if>
						</div>
					</c:forEach>
				
					<div><span id="span"></span></div> 
				</div>
				</div>
			</div>
		</div>
		
	
	<br>
	</div> <!--  댓글 창 끝  -->
	
	<br><br><br><br><br>
	
	<%@include file="../common/footer.jsp" %>
	
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
	      <div class="modal-footer">
	        <button type="button" class="btn btn-n" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-y" id="deleteBoard">삭제하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 댓글 삭제 확인 알림창 -->
	<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel2">댓글 삭제하기</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<i class="bi bi-emoji-frown-fill"></i><br>
		       	삭제 된 댓글은 복구 할 수 없습니다.<br>
		        정말 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-n" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-y" id="deleteReply2">삭제하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<script>

	//게시글 수정 
	const updateBoard = () => {
		console.log('asdf');
		location.href = '${contextPath}/updateBoard.gr?boardNo=' + ${list.boardNo} + '&page=' + ${page};
	}
	//게시글 수정-삭제 본인 것만 보이도록
	 const writer = "${list.usersId}";
	 console.log(writer);
  	 const loginUser = "${loginUser.userId}";

  	 console.log(loginUser);
  	const dropBtn = document.querySelector(".drop-btn");
	  if (writer === loginUser) {
	    
	    dropBtn.style.display = "block";
	  } else {
		  dropBtn.style.display = "none";
	  }
	
	
	
	// 2. 각 댓글 요소의 작성자 정보와 비교하여 가시성 설정
	const commentElements = document.getElementsByClassName('comment'); // 댓글 요소들의 클래스를 'comment'로 가정
	for (let i = 0; i < commentElements.length; i++) {
	  const commentElement = commentElements[i];
	  const authorElement = commentElement.getElementsByClassName('author')[0]; // 작성자 정보가 포함된 요소를 선택

	  // 작성자 정보와 로그인한 사용자의 정보 비교
	  const authorId = authorElement.dataset.authorId; // 작성자 아이디가 저장된 데이터 속성을 가져옴
	  if (authorId === loggedInUserId) {
	    // 본인이 작성한 댓글인 경우 보이도록 설정
	    commentElement.style.display = 'block';
	  } else {
	    // 다른 사용자가 작성한 댓글인 경우 감추도록 설정
	    commentElement.style.display = 'none';
	  }
	}

	
	
    //모달 -> 게시글 삭제
	document.getElementById('deleteBoard').addEventListener('click', () => {
		location.href = '${contextPath}/deleteBoard.gr?boardNo=' + ${list.boardNo} + '&page=' + ${page} + '&groupNo=' + ${list.groupNo} ;
	})
		
	//이전으로 
	document.getElementById('goBack').addEventListener('click', ()=>{
		window.location.href = '${contextPath}/selectGroupView.gr?membershipNo=' + ${list.groupNo};
	})
	
	const authors = Array.from(document.getElementsByClassName('re-id')).map(element => element.innerText);
	
    console.log('adsfasfd' + document.getElementsByClassName('re-id'))
//     console.log(authors);
	//게시글 로딩되자마자 댓글 개수 + 댓글 사진
	   $.ajax({
			url:'${contextPath}/selectReplyCount.gr',
			data: {
				boardNo:${list.boardNo}
			}
			,success: (data) => {
				//댓글 개수 
				const rCount = document.getElementById('rCount');
				rCount.innerText = data;
				//등록 버튼 부분 이미지 경로 넣기 
				const imagePath = "https://botsitivity.org/static/media/noprofile.c3f94521.png"
// 				const imagePath = '${contextPath}/resources/uploadFiles/${pAttm.renameName}'
				const profile = document.getElementById('re-profile-img');
				profile.setAttribute('src', imagePath);
				//페이지 로드되자마자 사진 보이기 
				const profiles = document.getElementsByClassName('re-profile-img2');
				for(const profile2 of profiles) {
					profile2.setAttribute('src', imagePath);
				}
				
			}
			,error: (data) => {
				console.log(data);
			}
		}) 
	
	//값이 들어오지 않으면 클릭 막기 
	const cont = document.getElementById('commentText')
	cont.addEventListener('keyup', function(){
      if (this.value.trim() == '') { //키가 입력 된 이후 입력창이 비어있을 때 버튼 비활성화
         document.getElementById('replySubmit').disabled = true;
      } else { //키가 입력 된 이후 입력창이 채워져 있을 때 버튼 활성화 
         document.getElementById('replySubmit').disabled = false;
      }
  		})
	
	//댓글 등록 
	document.getElementById('replySubmit').addEventListener('click', ()=> {
		const commentText = document.getElementById('commentText').value.trim(); // 입력된 댓글 내용 가져오기
        if (commentText === '') {
          alert('댓글을 입력해주세요.'); // 댓글 입력값이 비어있을 경우 알림 메시지 표시
          return; // 함수 종료
        }
		const loginUser = '${loginUser.userId}';
		$.ajax({
			url: '${contextPath}/insertReply.gr',
			data: {replyContent:document.getElementById('commentText').value
				   ,replyWriter:'${loginUser.userId}'
				   ,boardNo:${list.boardNo}
				   },
				   success: data => {
					   // 댓글 등록 직후 개수 증가 
					   $.ajax({
							url:'${contextPath}/selectReplyCount.gr',
							data: {
								boardNo:${list.boardNo}
							}
							,success: (data) => {
								const rCount = document.getElementById('rCount');
								console.log(rCount.innerText)
								rCount.innerText = data;
							}
							,error: (data) => {
								console.log(data);
							}
						}) 
					   
					  const empty = document.getElementById('empty');
					  empty.innerHTML = '';
					  
					  for(const reply of data) { //댓글 개수만큼 for문 돌리기 
						  //받아온 데이터를 변수에 담기 
						  const writer = reply.replyWriter;
						  const content = reply.replyContent;
						  const date = reply.replyModifyDate;
						  const replyNo = reply.replyNo;
						  const insertReply = document.createElement('div');
						  const span = document.getElementById('span');
						  const loginUser = '${loginUser.userId}';
						  
							  insertReply.innerHTML =
								  '<div class="reply re-hover allReply">' +
								  '<div class="re-img"><img class="re-profile-img2" src="${contextPath}/resources/assets/no-img.png"></div>' +
								  '<div class="re-id"><span>' + writer + '</span></div>' +
								  '<div class="re-re" id="commentText-' + replyNo + '"><span>' + content + '</span></div>' +
								  '<div class="re-date"><span>' + date + '</span></div>' +
								  (writer === loginUser ?
								    '<div class="re-btn dropdown">' +
								    '<button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></button>' +
								    '<ul class="dropdown-menu">' +
								    '<li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal2" onclick="deleteReply(' + replyNo + ')"><i class="bi bi-trash3-fill dropdown-menu-icon"></i>댓글 삭제</button></li>' +
								    '<li><button class="dropdown-item" type="button" data-bs-toggle="modal" onclick="updateReply(' + replyNo + ')"><i class="bi bi-pencil-fill dropdown-menu-icon"></i>댓글 수정</button></li>' +
								    '</ul></div>' : '') +
								  '</div>';
								  empty.append(insertReply)
						  }
						  
						  document.getElementById('commentText').value = '';
					  },
// 				   },
				   error: data => {
					   console.log(data);
				   }
			})
	})
	
	//댓글 삭제
	const deleteReply = (replyNo) => {
		document.getElementById('deleteReply2').addEventListener('click', function() {
			$('#exampleModal2').modal('hide');
// 			document.getElementsByClassName('modal-backdrop').style.display = 'none';
			//클릭하면 모달이 없어지고 
			//등록 되었던 댓글도 삭제 된다 
			console.log(replyNo);
			 $.ajax({
					url:'${contextPath}/deleteReply.gr',
					data: {
						replyNo:replyNo
					}
					,success: (data) => {
						const commentTextElement = document.getElementById('commentText-' + replyNo);
						const parentElement = commentTextElement.parentNode;
						
						parentElement.classList.add('fade-out');
						parentElement.removeChild(commentTextElement);
						const siblings = parentElement.children;
						for (let i = 0; i < siblings.length; i++) {
						  const sibling = siblings[i];
						  sibling.style.marginTop = '-50px'; 
						}						
					}
					,error: (data) => {
						console.log(data);
					}
				}) 
		})
		
		
		
		
		
	}
	
	
	 //--------------댓글 수정
	  const updateReply = (replyNo) => {
	  // 댓글 수정 버튼 클릭 시 댓글 내용을 가져와서 입력란으로 변경
	  //1. 해당 replyNo의 텍스트에 접근한다.
	  const commentTextElement = document.getElementById('commentText-' + replyNo);
	  const commentText = commentTextElement.innerText;
	  console.log('commentText' + commentText)
	  //2. input태그를 만든 뒤 commentText의 내용을 넣는다.
	  const commentInputField = document.createElement('input');
	  commentInputField.type = 'text';
	  commentInputField.value = commentText;
	  //새롭게 입력한 값을 updatedContent로 저장한 후, replyNo - 변경 된 내용을 saveEditedComment에 넣는다.
	  const saveButton = document.createElement('button');
	  saveButton.textContent = '저장';
	  saveButton.onclick = function() {
	    const updatedContent = commentInputField.value;
	    saveEditedComment(replyNo, updatedContent);
	  };
	
	  // 댓글 내용을 입력 필드로 변경
	  commentTextElement.innerHTML = '';
	  commentTextElement.appendChild(commentInputField);
	  commentTextElement.appendChild(saveButton);
	};
	
	//전달 받은 replyNo와 변경 된 내용을 가지고 ajax에 전달한다. 
	const saveEditedComment = (replyNo, updatedContent) => {
	  // 수정된 댓글 내용을 서버로 전송하여 업데이트
	  $.ajax({
	    url: '${contextPath}/updateReply.gr',
	    data: {
	      replyNo: replyNo,
	      replyContent: updatedContent
	    },
	    success: (data) => {
	      //변경 내용 content에 담기 
		  const content = updatedContent;
	      // 해당 댓글의 뷰 요소에 접근하고 내용을 content로 변경 
	      const commentElement = document.getElementById('commentText-' + replyNo);
	      commentElement.innerText = content;
	    },
	    error: (error) => {
	      console.log(error);
	      // 에러 처리 로직 구현
	    }
	  });
	};
	
	//댓글 수정-삭제 본인 것만 보이도록 
	const reIdElement = document.querySelector('.re-id');
	const reIdText = reIdElement.innerText;
	console.log(reIdText);
	const dropDown = document.getElementsByClassName('bi-bi-three-dots-vercital');
	for(const dropDowns of dropDown) {
			for(const reIds of reIdText) {
				if(reIds === loginUser) {
					dropDown.style.display = 'block'
				} else {
					dropDown.style=display = 'none'
				}
			}
		}

	
	
</script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>

</html>