<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->
<title>Insert title here</title>
<style>
	   #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: dimgray; font-weight: bold;}
   #menu-market{color: dimgray; font-weight: bold;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }
	/* 버튼 css */
	.button {
	  margin-top : -30px;
	  margin-left: 600px;
	  width: 140px;
	  height: 45px;
	  font-family: 'Roboto', sans-serif;
	  font-size: 15px;
	  text-transform: uppercase;
	  letter-spacing: 2.5px;
	  font-weight: 500;
	  color: #000;
	  background-color: #fff;
	  border: white;
	  border-radius: 45px;
	  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	  transition: all 0.3s ease 0s;
	  cursor: pointer;
	  outline: none;
	  }
	
	.button:hover {
	  background-color: #FFAB00;
	  color: #fff;
	  transform: translateY(-7px);
	}

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
		
	
	
	.div1{margin: auto; width: 750px;}
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


</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<br>
	
	<div class="div"> <!-- 제일 바깥쪽 여백 범위 위한 div -->
		<div class="center-div">
			<div class="admin-menu">
			 	<div>
					<img id="profile-img" src="resources/assets/face.png">
				</div>
				<div class="admin-id">관리자아이디</div><br>
				<div>					
					<button class="non-click" onclick="location.href='${ contextPath }/adminMember.me'"><i class="bi bi-person-fill"></i> 회원관리</button>
					<button class="non-click" onclick="location.href='${ contextPath }/adminContent.ad'"><i class="bi bi-pencil-square"></i> 게시글 관리</button>
					<button class="non-click" onclick="location.href='${ contextPath }/adminMoim.gr'"><i class="bi bi-people-fill"></i> 모임 관리</button>
					<button class="non-click" onclick="location.href='${ contextPath }/adminMarket.ad'"><i class="bi bi-cart-fill"></i> 마켓 관리</button>
				</div>
			</div>
			<div class="admin-board">
			 	<div class="div1">
					<br><br>
					<!-- 알림 -->			 	
				
					<!-- Last 5 order -->
					<ul>
						<li style="text-align:left">Last 5 order</li>
					</ul>
					<table style="height:20px;">
						<tr class="top">
							<th class="date">일자</th>
							<th style="width:150px;">주문자</th>
							<th style="width:150px;">가격(키링)</th>
						</tr>
						<c:forEach items="${ payList }" var="pa">
							<tr class="tr-hover">
								<td>${	pa.payDate }</td>
								<td>${	pa.buyerId }</td>
								<td>${	pa.paymentAmount }</td>
							</tr>
						</c:forEach>	
					</table><br><br>		 	
								 	
								 	
					<!-- 등록 상품 테이블 -->			 	
					<ul>
						<li style="text-align:left">최근 등록 상품</li>
					</ul>
					<table style="width:750px">
						<tr class="top">
							<th class="date">일자</th>
							<th class="category">카테고리</th>
							<th class="content">제목</th>
							<th class="sel">판매자</th>
							<th class="yn">삭제</th>
						</tr>
						
						<c:forEach items="${ pList }" var="p">
							<tr class="tr-hover">
								<td>${ p.productPostDate }</td>
								<td>${ p.productCategory }</td>
								<td>${ p.productName }</td>
								<td>${ p.productSellerId }</td>
								<td>
									<input type="hidden" value="${ p.productNo }">
									<button class="deleteProduct">삭제</button>
								</td>
								
							</tr>
						</c:forEach>
					</table>
					</div>
			 	
			 	
			 	
			 	
			 	
			</div>
		</div>
	</div>
	<br><br><br>
	<script>
		const buttons = document.getElementsByClassName('deleteProduct');
		for(const button of buttons){
			button.addEventListener('click', function(){
				let productNo = this.parentElement.querySelector('input').value;
				location.href="${contextPath}/deleteProduct.ad?productNo=" + productNo;
			})
		}
	
	</script>


	<%@ include file="../common/footer.jsp" %>

</body>
</html>