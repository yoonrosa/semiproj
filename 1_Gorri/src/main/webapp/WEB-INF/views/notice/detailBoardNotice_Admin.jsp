<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
	
<title>Gorri</title>
<style>
	
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
	.re-all{text-align: right; text-decoration: none; color: black; width:90%;} /* 댓글 전체보기 */
	
	.reply{
		width: 100%;
		display: flex; 
		justify-content: center;
		align-items : top; font-size: 14px;} /* 댓글부분 너비랑 글씨 크기 */
	.re-hover:hover{background: rgba(255, 170, 0, 0.1);}
	#re-profile-img{ /* 댓글 프사이미지 관련 */
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
	.re-text{width: 100%; height: 30px; margin-right: 5px; padding-top: 5px;} /* 댓글 입력창 */
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

	
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	
	<div class="border-line"> <!-- 겉에 주황색 테두리 -->
   
   		<!-- 프로필사진 관련 -->
		<div class="top-profile-img"> 
			<div id="profile-back"></div>
			<div id="profile-white"></div>
			<div id="profile">
				<img id="profile-img" src="https://botsitivity.org/static/media/noprofile.c3f94521.png">
			</div>
		</div>
		
		
		<!-- 게시글제목, 버튼, 작성일 -->
		<div class="mid"> 
			<div class="div-title">
				<div class="prev-btn titile-btn"><i class="bi bi-chevron-left"></i></div> <!-- 이전으로 가는 설정 넣어야함 -->
				<div class="title">
					<div class="title-name">게시글 제목이 여기에 나와요~</div>
					<div class="title-date">2023-04-30 게시 날짜</div>
				</div>
				<div class="drop-btn titile-btn dropdown">
					<button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></button>
					<ul class="dropdown-menu">
						<li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><i class="bi bi-trash3-fill dropdown-menu-icon"></i>게시글 삭제</button></li>
						<li><button class="dropdown-item" type="button" data-bs-toggle="modal" onclick="updateWrite()"><i class="bi bi-pencil-fill dropdown-menu-icon"></i>게시글 수정</button></li>
					</ul>
				</div>
			</div>
		</div>
		
		
		<div class="mid-line"></div>	
	
		
		<!-- 게시글 내용 관련 -->
		<div class="bottom">
			<div class="bottom-width">
				<div class="bottom-img">
					<img class="imgg" src="assets/gorri-removebg.png">
				</div>
				<div class="bottom-text">
					게시글 내용은 여기에 표시~~
					꽃이 거친 쓸쓸한 것이다. 피가 같이, 얼마나 뭇 힘차게 우리 것은 눈이 아니한 있는가? 이는 얼마나 봄바람을 우리의 같지 힘있다. 인도하겠다는 가치를 그들의 거선의 쓸쓸하랴? 든 불어 피가 피부가 인생을 긴지라 봄바람이다. 그들은 이는 어디 인생에 이상의 커다란 이상 찾아다녀도, 스며들어 이것이다. 갑 보배를 거친 꾸며 자신과 끓는다. 인간에 이상 인류의 관현악이며, 것이다. 인간이 인생에 천지는 커다란 사라지지 칼이다.
					
					여기에 글이랑 사진 순서랑 입력한대로 나오게 할 수 있나요???
				</div>
				<div class="bottom-icon">
					<div class="bottom-icon-like">
						<a><i class="bi bi-arrow-through-heart-fill"></i></a>
					</div>
					<div class="bottom-icon-more">
						<button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></button>
						<ul class="dropdown-menu">
							<li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><i class="bi bi-trash3-fill dropdown-menu-icon"></i>게시글 삭제</button></li>
							<li><button class="dropdown-item" type="button" data-bs-toggle="modal" onclick="updateWrite()"><i class="bi bi-pencil-fill dropdown-menu-icon"></i>게시글 수정</button></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		
		<div class="mid-line"></div>
		
		
		<!-- 입력된 댓글 -->
		<div class="bottom-reply">
			<div class="bottom-reply-width">
				<div class="reply-info"> <!-- 댓글개수, 댓글전체보기 -->
					<div class="re">댓글</div>
					<div class="re">00개</div>
					<div class="re-all"><a href="#" class="re-all">댓글 전체보기<i class="bi bi-chevron-compact-right"></i></a></div>
				</div>
				<div class="reply re-hover"> <!-- 달린 댓글들 - 댓글을 하나 달면 div 하나씩 추가되야함요... -->
					<div class="re-img"><img id="re-profile-img" src="assets/gorri-removebg.png"></div>
					<div class="re-id">wantyou0421</div>
					<div class="re-re">댓글 내용이 여기에 입력됩니다~~~</div>
					<div class="re-date">2023-04-23</div>
					<div class="re-btn dropdown">
						<button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></button>
						<ul class="dropdown-menu">
							<li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><i class="bi bi-trash3-fill dropdown-menu-icon"></i>댓글 삭제</button></li>
							<li><button class="dropdown-item" type="button" data-bs-toggle="modal" onclick="location.href='#';"><i class="bi bi-pencil-fill dropdown-menu-icon"></i>댓글 수정</button></li>
						</ul>
					</div>
				</div>
				<div class="reply re-hover"> <!-- 달린 댓글들 -->
					<div class="re-img"><img id="re-profile-img" src="assets/gorri-removebg.png"></div>
					<div class="re-id">wantyou0421</div>
					<div class="re-re">댓글 내용이 여기에 입력됩니다~~~댓글이 길게 입력되면 어떻게 입력될까요~? 이렇게 보입니다. 글씨크기 줄여야되나 아님 그냥 이대로도 괜찮나????</div>
					<div class="re-date">2023-04-23</div>
					<div class="re-btn dropdown">
						<button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></button>
						<ul class="dropdown-menu">
							<li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><i class="bi bi-trash3-fill dropdown-menu-icon"></i>댓글 삭제</button></li>
							<li><button class="dropdown-item" type="button" data-bs-toggle="modal" onclick="location.href='#';"><i class="bi bi-pencil-fill dropdown-menu-icon"></i>댓글 수정</button></li>
						</ul>
					</div>
				</div>
				<div class="reply re-hover"> <!-- 달린 댓글들 -->
					<div class="re-img"><img id="re-profile-img" src="assets/gorri-removebg.png"></div>
					<div class="re-id">wantyou0421</div>
					<div class="re-re">다시 짧은 댓글 좋아용!  왜 첫번쨰랑 두번째 간격이 더 넚은 느낌이지;;</div>
					<div class="re-date">2023-04-23</div>
					<div class="re-btn dropdown">
						<button class="drop-btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></button>
						<ul class="dropdown-menu">
							<li><button class="dropdown-item" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal1"><i class="bi bi-trash3-fill dropdown-menu-icon"></i>댓글 삭제</button></li>
							<li><button class="dropdown-item" type="button" data-bs-toggle="modal" onclick="updateWrite()"><i class="bi bi-pencil-fill dropdown-menu-icon"></i>댓글 수정</button></li>
						</ul>
					</div>
				</div>
				<div>
					<div class="reply re-input">
						<div class="re-img"><img id="re-profile-img" src="assets/gorri-removebg.png"></div> <!-- 로그인한 사용자 프로필 주소로 변경하기.. -->
						<div class="re-text"><input class="re-text" type="text" placeholder="내용을 입력하세요."></div>
						<div class="re-submit"><button type="submit" class="submit-btn">댓글등록</button></div>
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
	      <div class="modal-footer">
	        <button type="button" class="btn btn-n" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-y">삭제하기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<script>

	updateWrite = () => {
		window.location.href = 'updateWrite.jsp';
	}
	
</script>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>

</html>