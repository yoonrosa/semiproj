<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1"> -->
	<title>Bootstrap demo</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link href="css/style.css" rel="stylesheet">
	<style>
		.bg{background-color: #FFAB00;}
		.navbar{height: 50px;}
		.image{height: 250px;}
		.mar{margin-left: 100px; margin-right: 100px;}
		.bo{border-top: 1px solid black; border-bottom: 1px solid black;}
		.a{font-weight: bold;}
		
		@font-face {
		    font-family: 'omyu_pretty';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
		}
		
		.omyu{
			font-family: 'omyu_pretty';
 			font-size: 25px;
		}
		
		.border-bottom-color{width :150px; text-align: center; height:40px; vertical-align: middle;}
		.menu-empty{width : 200px}
		
		
	</style>
<script src="../js/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" type="text/javascript"></script>
</head>
<body>
<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
<header>
<div class="navbar bg shadow-sm omyu">
   <div class="container">
	     <c:if test="${ empty loginUser }">
		     <nav class="d-inline-flex mt-md-0 ms-md-auto">
		       <a class="me-3 py-2 text-white text-decoration-none" href="${ contextPath }/login.me">로그인</a>
		       <a class="py-2 text-white text-decoration-none" href="${ contextPath }/join.me">회원가입</a>
		     </nav>
		  </c:if>
	  	<c:if test="${ !empty loginUser }">   
				  	
	     <nav class="d-inline-flex mt-md-0 ms-md-auto">
	     	   <a class="me-3 py-2 text-white text-decoration-none" style="color:lightgrey" disabled >${ loginUser.userId }님</a>
		       <a class="me-3 py-2 text-white text-decoration-none" href="${ contextPath }/logout.me">로그아웃</a>
		       <a class="py-2 text-white text-decoration-none" href="${ contextPath }/updateMyInfo.me">내정보수정</a>
		       <c:if test="${ loginUser.isAdmin eq 'Y' }">
		       &nbsp; &nbsp; <a class="py-2 text-white text-decoration-none" href='${ contextPath }/adminMember.me'>관리자페이지</a>
		       </c:if>
	     </nav>
		</c:if>
   </div>
</div>

<div class="text-center">
	<a href="${ contextPath }/main.do">
		<img src="resources/assets/gorriLogo.png" class="rounded" alt="...">
	</a>
</div>

<div class="nav-scroller py-1 mb-2 mar omyu">
    <nav class="nav d-flex justify-content-around bo">
      <div class="menu-empty"> </div>
      <c:if test="${ !empty loginUser }">
         <div class="minihome-border-bottom border-bottom-color"><a class="p-2 text-decoration-none a" id="menu-minihome" href="${ contextPath }/miniMain.mi">미니홈</a></div>
      </c:if>
      <c:if test="${ empty loginUser }">
         <div class="border-bottom minihome-border-bottom border-bottom-color"><a class="p-2 text-decoration-none a" id="menu-minihome" onclick="alert("로그인을 먼저 해주세요")" href="${ contextPath }/login.me" >미니홈</a></div>
      </c:if>   
      <div class="hobby-border-bottom border-bottom-color"><a class="p-2 text-decoration-none a" id="menu-hobby" href="${ contextPath }/hobbyMain.hb">취미</a></div>
      <div class="group-border-bottom border-bottom-color"><a class="p-2 text-decoration-none a" id="menu-group" href="${ contextPath }/groupMain.gr">모임</a></div>
      <div class="market-border-bottom border-bottom-color"><a class="p-2 text-decoration-none a" id="menu-market" href="${ contextPath }/MainPage.market">마켓</a></div>
      <div class="menu-empty"> </div>
    </nav>
</div>
</header>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

</body>
</html>