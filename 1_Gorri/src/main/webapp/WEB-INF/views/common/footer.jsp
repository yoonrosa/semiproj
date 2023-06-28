<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/243bcd4d8b.js" crossorigin="anonymous"></script> <!-- 폰트아이콘 -->
<title>Insert title here</title>
<style>

	.outttt{
		width: 100%; height: 160px;  background: rgba(255, 170, 0, 0.7); 
		display: flex; 
		justify-content: center; /* div 가로 중양정렬 - 바깥쪽 div에 넣으면 안쪽 div가 중앙정렬됨 */
		align-items : center;} /* div 세로 중앙정렬  - 바깥쪽 div에 넣기 */
	.innnn{width: 400px; text-align: center; color: white;
		display: flex; 
		justify-content: center;
		align-items : center;}
	.center{width: 30%;}
	.logo{width: 200px;} /* 로고 크기 */
	.icon{width: 30px;}
	.text{width: 55px;}
	a{color: white; text-decoration: none;}
	a:hover{color: gray;}
	
</style>
</head>
<body>
	<br><br><br>
	<div class="outttt">
		<div class="innnn">&copy; 2023 Company, Inc</div>
		<div class="innnn center"><img class="logo" src="${contextPath }/resources/assets/logo-bw.png"></div>
		<div class="innnn">
			<div class="text"><a href="#" class="font-color">Home</a></div>
			<div class="icon"><a href="#" class="font-color"><i class="fa-brands fa-twitter"></i></a></div>
			<div class="icon"><a href="#" class="font-color"><i class="fa-brands fa-facebook"></i></a></div>
			<div class="icon"><a href="#" class="font-color"><i class="fa-brands fa-instagram"></i></a></div>
			<div class="text"><a href="#" class="font-color">About</a></div>
		</div>
	</div>
</body>
</html>