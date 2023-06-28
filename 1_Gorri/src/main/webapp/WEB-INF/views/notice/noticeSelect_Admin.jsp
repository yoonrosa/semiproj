<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<title>Insert title here</title>
<style>
	
	/* 제일 바깥쪽 여백 범위 위한 div */
	.div{
		width : 80%;  min-width: 800px;
		margin-left: auto; margin-right: auto;
		text-align: center;} /* 가운데정렬 */
		
	.center-div{
		display: flex; 
		justify-content: center;
		align-items : top;
		margin-top: 20px;}
		
		
	/* 관리자 메뉴랑 관리자 게시판 넓이 비율.. */
	.admin-menu{width: 15%; margin-right: 30px;}
	.admin-board{width: 900px;}
	
	#profile-img{width: 100px; height: 100px;
		border: 3px solid #ffaa00; 
		border-radius: 50%;
		object-fit: cover;
		object-position: center;
		overflow: hidden;
		 margin-bottom: 5px;
		}
	.admin-id{font-weight: bold;}
	
	
	/* 왼쪽 관리자 메뉴관련 */
    .non-click{
	    background-color: rgba(250, 170, 0, 0.3);
	    cursor: pointer;
		padding: 16px;
		width: 100%;
		border: none;
		text-align: left;
		font-size: 16px;
		transition: 0.4s;
		}
    .non-click:hover{
        background-color: rgba(250, 170, 0, 0.5);
        font-weight: bold;
   		}
	.click { /* 클릭해서 선택된 메뉴창 관련 */
		background-color: rgba(250, 170, 0, 0.9);
		font-weight: bold;
		}
		
	
	
	.div1{margin: auto; width: 750px; margin-top: 20px;}
	li{text-align: left;}
	table{border-collapse: collapse; text-align: center;}
	table tr{height: 40px; border-bottom: 2px solid lightgray;}
	.tr-hover:hover{background: rgba(0, 0, 0, 0.05);}
	.top{background-color: rgba(250, 170, 0, 0.3);}
	.sel{width: 80px;}
	.no{width: 80px;}
	.date{width: 200px;}
	.nick{width: 150px;}
	.grade{width: 100px;}
	.yn{width: 80px;}	
	
	
	.button{margin-left: 600px;}
	.kick{
		margin-left: 600px;
		width: 100px; height: 45px;
		font-size: 15px;
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
	.kick:hover {
		background-color: #ffaa00;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		color: #fff;
		transform: translateY(-7px);
		}
	
	.admin-board { 
		  transform: scale(1.3);
	}
	
	
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<br><br>
	<br><br><br><h3 style="text-align:center"><b>공지사항</b></h3>
	<hr style="border:solid 10px black; margin:auto; width:20%; border-width:2px;"> <!-- 모임명 중앙 선 -->
	<br><br><br><br><br>
	
	<div class="div"> <!-- 제일 바깥쪽 여백 범위 위한 div -->
		<div class="center-div">
			
			
			<br>
			<!-- 게시글 관리 -->
			<div class="admin-board">
			 	<div class="div1">
					
					<table>
						<tr class="top" >
							<th class="no">번호</th>
							<th class="date">제목</th>
							<th class="grade">작성자</th>
							<th class="date">작성일자</th>
							<th class="nick">조회수</th>
							<th class="yn">삭제</th>
						</tr>
						<tr class="tr-hover" onclick="detailBoard()">
							<td>1</td>
							<td>필독 공지사항입니다.</td>
							<td>관리자</td>
							<td>2023-05-12</td>
							<td>15615</td>
							<td><input type="radio"></td>
						</tr>
						<tr class="tr-hover" onclick="detailBoardAdmin()">
							<td>1</td>
							<td>필독 공지사항입니다.</td>
							<td>관리자</td>
							<td>2023-05-12</td>
							<td>15615</td>
							<td><input type="radio"></td>
						</tr>
						<tr class="tr-hover">
							<td>1</td>
							<td>필독 공지사항입니다.</td>
							<td>관리자</td>
							<td>2023-05-12</td>
							<td>15615</td>
							<td><input type="radio"></td>
						</tr>
						<tr class="tr-hover">
							<td>1</td>
							<td>필독 공지사항입니다.</td>
							<td>관리자</td>
							<td>2023-05-12</td>
							<td>15615</td>
							<td><input type="radio"></td>
						</tr>
						<tr class="tr-hover">
							<td>1</td>
							<td>필독 공지사항입니다.</td>
							<td>관리자</td>
							<td>2023-05-12</td>
							<td>15615</td>
							<td><input type="radio"></td>
						</tr>
						<tr class="tr-hover">
							<td>1</td>
							<td>필독 공지사항입니다.</td>
							<td>관리자</td>
							<td>2023-05-12</td>
							<td>15615</td>
							<td><input type="radio"></td>
						</tr>
						<tr class="tr-hover">
							<td>1</td>
							<td>필독 공지사항입니다.</td>
							<td>관리자</td>
							<td>2023-05-12</td>
							<td>15615</td>
							<td><input type="radio"></td>
						</tr>
						<tr class="tr-hover">
							<td>1</td>
							<td>필독 공지사항입니다.</td>
							<td>관리자</td>
							<td>2023-05-12</td>
							<td>15615</td>
							<td><input type="radio"></td>
						</tr>
						<tr class="tr-hover">
							<td>1</td>
							<td>필독 공지사항입니다.</td>
							<td>관리자</td>
							<td>2023-05-12</td>
							<td>15615</td>
							<td><input type="radio"></td>
						</tr>
					</table>
					<br>
					<div style="float:right"><button class="kick" onclick="insertBoard()">글 등록</button><button class="kick">삭제</button></div>
				
					<br><br><br><br><br><%@include file="../common/searchNotice.jsp" %>
				</div>
			</div>
			
	
		</div>
	</div>
	<br><br><br><br><br><br>

	

	<%@ include file="../common/footer.jsp" %>


</body>
<script>
	insertBoard = () => {
		window.location.href = 'boardWrite.jsp'
	}
	
	detailBoard = () => { //회원이 상세글 조회 
		window.location.href = 'detailBoardNotice.jsp'
	}
	
	detailBoardAdmin = () => { //관리자가 상세글 조회
		window.location.href = 'detailBoardNotice_Admin.jsp'
	}
	
	
	
</script>
</html>