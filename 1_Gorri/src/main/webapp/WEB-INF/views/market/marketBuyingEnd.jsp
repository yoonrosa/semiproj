<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>
<style>
   #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: dimgray; font-weight: bold;}
   #menu-market{color: #ffaa00; font-weight: bold;}
   .market-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }

	/* 제일 겉에 마켓 상세 범위 */
	.div{
		width : 70%;  min-width: 800px;
		margin-left: auto; margin-right: auto;
		text-align: center;} /* 가운데정렬 */
	.center-div{margin-left: auto; margin-right: auto; width : 95%; text-align: center;}
	.shop-title{font-size: 30px; font-weight: bold;}
	.shop-icon{text-align: center; font-size: 60px; color: #ffaa00;}
	.shop-text{margin-top: 20px; margin-bottom: 50px; font-weight: bold;}
	
	/* 구매버튼 관련 설정*/
	.button{
		width: 100px; height: 45px;
		font-family: ;
		font-size: 11px;
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
	.button:hover{
		background-color: #ffaa00;
		box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
		color: #fff;
		transform: translateY(-7px);
		}
	
	/* 중간 줄*/ 
 	.line{ 
 		border : 1px solid gray; width: 30%; 
 		margin-left:auto; margin-right:auto; margin-top: 10px; margin-bottom: 50px;}
	

</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<br>
	<div class="div"> <!-- 제일 바깥쪽 여백 범위 위한 div -->
		<div class="center-div">
			<div class="shop-title">주문완료</div>
			<div class="line"></div>
			<div class="shop-icon"><i class="bi bi-box2-heart-fill"></i></div>
			<div class="shop-text">주문이 완료되었습니다.</div>
			<div class="class-btn">
				<button class="button" onclick="location.href='${contextPath}/miniBuy.mi'"><b>구매내역</b></button>
				<button class="button" onclick="location.href='${contextPath}/MainPage.market'">마켓메인</button>
			</div>
		</div>
	</div>
	<br><br><br>
	
	<%@ include file="marketFooter.jsp" %>
</body>
</html>