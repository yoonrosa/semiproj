<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<title>Insert title here</title>
<style>
	
		
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
	
	
	/* 닉네임, 간단소개 태그 부분 */
	.mid-width{width: 80%; margin-bottom: 20px;}
	.mid-info{
		display: flex; 
		justify-content: center;
		align-items : center;
		margin-bottom: 10px;	
		}
	#id{ /*닉네임*/
		text-align: center; font-weight: bold;
		display: flex; 
		justify-content: center;
		align-items : center;
		margin-right: 5px;
		}
	#edit-icon{width: 15px; height: 15px; cursor: pointer; transition: all 0.3s ease 0s;} /*프로필 수정 아이콘*/
	#edit-icon:hover{
		color: #ffaa00; background: white;
		cursor: pointer; 
		transform: translateY(-7px);
		}
	
	/* 마이홈 메뉴관련 - 게시글, 모임, 구매내역 */
	.minihome{
		display: flex; 
		justify-content: center;
		align-items : center;
		}
	.minihome-btn-width{width: 80%;
		display: flex; 
		justify-content: center;
		align-items : center;
		}
	.empty{width: 10%; text-align: right;}
	
	.footer{
		display: flex; 
		justify-content: center;
		align-items : center;
		margin-top: 10px; margin-bottom: 30px;
		padding-top: 20px;
		border-top: 1px solid lightgray;
		}
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
	
	.select{background: black; color: white;} /* 현재 선택된 버튼 -> 현재 선택된페이지는 버튼색깔 다르게 해줘야 함요!!*/ 
	
	
	/* 글쓰기 버튼 */
	.bi-pencil-square{font-size: 20px;  transition: all 0.3s ease 0s;}
	.bi-pencil-square:hover{
		color: #ffaa00; background: white;
		cursor: pointer; 
		transform: translateY(-7px);}
	
	
	/* 중간 줄*/
	.mid-line{
		border : 1px solid gray; width: 90%;
		margin-left:auto; margin-right:auto; margin-top: 20px; margin-bottom: 20px;}


	/* 프로필 수정 창 */
	.modal-body{margin-left:auto; margin-right:auto;}
	.edit{margin: 0 auto; text-align: center;}
	textarea{resize: none; width: 400px; height: 100px;} /* resize: none;이 여기선 왜 적용 안됨??*/
	#edit-img{width: 130px; height:130px; /* 프로필 이미지 */
		margin-left:auto; margin-right:auto;;
		border: 1px solid #ffaa00;
		border-radius: 50%;
		background-repeat: no-repeat;
    	background-position: center;
    	background-size : 130px, 130px;
    	
    	margin-bottom: 10px;
		}
	.input-file-button{ /* 파일입력창 못생겨서 만든 가짜 입력버튼..*/
		border-radius: 15px;
		background: #ffaa00; color: black;  cursor: pointer; font-size: 14px;
		padding-left: 10px; padding-right: 10px; margin-bottom: 10px;
		}
	.input-file-button:hover{background: black; color: #ffaa00; font-size: 14px;}	
	#input-file{display: none;} /* 파일 버튼 안보이게.. */
	.modal-footer{text-align: center;}
	.modal-footer> .button{font-weight: bold;}

	 #previewImg{
	 	height: 100%; max-width: 100%;  border-radius: 50%; margin-bottom: 20px; 
	 	object-fit: cover;}
	 	
	 	    .textCount, .textTotal{color : gray;}
    .text-limit{text-align: right;}
</style>
</head>
<body>

	<!-- 프로필사진 관련 -->
	<div class="top-profile-img"> 
		<div id="profile-back"></div>
		<div id="profile-white"></div>
		<div id="profile">
			
			<c:if test="${ empty profile}">
				<img id="profile-img" src="${ contextPath }/resources/assets/no-img.png">
			</c:if>
			<c:if test="${ !empty profile }">
				<img id="profile-img" src="${ contextPath }/resources/uploadFiles/${profile.renameName}">
			</c:if>
			
		</div>
	</div>
	
	
	<!-- 프로필 정보 관련 -->
	<div class="mid">
	
		<!-- id, 자기소개 -->
		<div class="minihome">
			<div class="mid-width">
				<div class="mid-info">
					<div id="id">${ m.userId }</div>
					
				</div>
				<div> <!-- 칸 안늘어나게 하기위해서 크기 미리 정해놔야 할듯 -->
					<div id="my-Intro">${ m.myIntro }</div>
				</div> 
			</div>
		</div>

		
		<!-- 게세글, 모임, 구매내역 버튼 --> <!-- 선택된 버튼은 클래스에 select넣어야 선택된 상태일때 색 바뀜 -->
		<div class="minihome">
			<div class="minihome-btn-width">
				<div class="empty"></div>
				<div><button class="button"><b>게시글</b></button></div>
				<div class="empty"></div>
			</div>
		</div>
	</div>
	
	
	<div class="mid-line"></div>	
	
	
	
	
 
 
 
<script> 
	
	 	document.getElementById('myIntro').addEventListener('click',()=>{ // 자기소개글 부분
	 		// 클릭하면 내용 비워주기
	 		document.getElementById('myIntro').value = '';
	 		
	 		// 글자수 세주기
	 		document.getElementById("myIntro").addEventListener('keyup', function(){
				let content = $(this).val();

				$('.textCount').text(content.length+'자');
				
				if(content.length > 80){
					$(this).val($(this).val().substring(0,80));
					
				}
			})
	 	
	 		document.getElementById('submit-btn').addEventListener('click', ()=>{
	 			const myIntro = document.getElementById('myIntro').value; // 수정 창에 입력한 내용...-> 디비에 저장하고 현재창 값 변경해야함
// 	 			console.log(myIntro);
	 			
	 			$.ajax({
	 	 			url: "${contextPath}/updateIntro.mi",
	 	 			data : {"myIntro" : myIntro},
	 	 			success: data => {
	 	 				console.log(data);
	 	 				document.getElementById('my-Intro').innerText = myIntro;
	 	 				},
	 	 			error: data=>{
	 	 				console.log(data);
	 	 			}
	 	 		})
	 		})
	 		document.getElementById("cancel-bnt").addEventListener('click', ()=>{
	 			document.getElementById('myIntro').value = '${loginUser.myIntro}';
	 		})
	 	})
	 	
	 	$(document).ready(function(){
			//파일첨부 이벤트
			$('.form-con').on('change', function(){
				if(window.FileReader){
					var filename = $(this)[0].files[0].name;
					
				} else {
					var filename = $(this).val().split('/').pop().split('\\').pop();
				}
				readImage($(this)[0]); //미리보기
				
				document.getElementById('submit-btn').addEventListener('click', ()=>{
					var formData = new FormData();
					formData.append('file', $('input[type=file]')[0].files[0]);
					formData.append('filename', filename);
// 					console.log(filename);
					
					$.ajax({
						url: "insertProfileImg.mi",
						type: 'post',
						enctype : 'multipart/form-data',
						data: formData,
						processData: false,
						contentType: false,
		 	 			success: data => {
							const imgPath = data[0] + "\\" +data[1];
		 	 				
		 	 				// 이미지 변경되게 해야함....
		 	 				$("#profile-img").attr("src", "${contextPath}/resources/uploadFiles/" + data[1]);
		 	 				
		 	 				},
		 	 			error: data=>{
		 	 				console.log(34);
		 	 			}
					})
				 })
			});
		});

		function readImage(input) {
			if(input.files && input.files[0]) {
				const reader = new FileReader();
				reader.onload = function(e){
					const previewImage = document.getElementById("previewImg");
					previewImage.src = e.target.result;
				}
				// reader가 이미지 읽도록 하기
				reader.readAsDataURL(input.files[0]);
	       }
		}
	
		
	 
 </script>
	
	
</body>
</html>