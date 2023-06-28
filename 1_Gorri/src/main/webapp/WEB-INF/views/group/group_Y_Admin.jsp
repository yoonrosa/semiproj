<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: #ffaa00;; font-weight: bold;}
   #menu-market{color: dimgray; font-weight: bold;}
   .group-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }

	table{border-collapse: collapse; text-align: center;}
	tr{height: 40px; border-bottom: 1px solid lightgray;}
	.top{background-color:  rgba(250, 170, 0, 0.3);}
	.no{width: 80px;}
	.title{width: 500px;}
	.writer{width: 100px;}
	.date{width: 150px;}
	.count{width: 80px;}


   body {background:white;}
   #wrap {width:1000px; height:900px; margin:0 auto; color:gray; text-align:center;}
   #side {float: left; margin-right:200px; width:300px; height:600px; line-height:600px; background:pink; border-radius: 2em;}
   #tung {float:left; width:100px; height:600px; line-height:600px; background:white; } 
   #contents {float: left; width: 600px; height:600px; line-height:600px; background:lightgray; border-radius: 2em;}
   
   
   #left{ width:400px; height:600px;  margin:auto; background-color:pink;}
   #right{ width:500px; height:600px; margin-left:500px; background-color:gray; }
 	#center{ width:100px; height:600px; margin:auto;}
/* 	.container {margin-right:400px;} */
	
/* 	<!-- 버튼 css --> */
	
	.button {
	  width: 140px;
	  height: 45px;
	  font-family: 'Roboto', sans-serif;
	  font-size: 11px;
	  text-transform: uppercase;
	  letter-spacing: 2.5px;
	  font-weight: 500;
	  color: #000;
	  background-color: #fff;
	  border-radius: 45px;
	  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
	  transition: all 0.3s ease 0s;
	  cursor: pointer;
	  outline: none;
	  }
	
	.button:hover {
	  background-color: #FFAB00;
	  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
	  color: #fff;
	  transform: translateY(-7px);
	}

</style>
</head>

<body>
<%@include file="../common/top.jsp" %>
<br><br><br><h3 style="text-align:center"><b>모임명</b></h3>
<hr style="border:solid 10px black; margin:auto; width:30%; border-width:2px;"> <!-- 모임명 중앙 선 -->
<br><h6 style="text-align:center">모임 한 줄 소개 여기에 표시</h6>
<br><br>

	<table width="60%" style="margin-top:200px; margin:auto; text-align:center; "> <!--테이블 전체 크기와 중앙 정렬 -->
	    <tr>
        	<td>
        		<div style="border:3px solid #FFAA00; width:350px; height:600px; border-radius:2em;" > <!-- 1번째 블럭 -->
	        		<div style="border:5px solid #FFAA00; border-radius:8em;  margin:auto; margin-top:30px; width:210px; height:210px; overflow:hidden">
	        			<img src="resources/assets/face.png" style="210px; height:210px;"></div> <!-- 사진 블럭 -->
	        			<br>
	        		<div>
	        			<p>
	        			멤버(15)
	        				<div id="like"; style="margin:0 auto; width:25px; height:25px;"><img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer; display:block;">
	        				<p id="count">230</p>
	        				</div> <!-- 좋아요 버튼 -->
	        			</p> 
	        		</div>
	        		
	        		<br><p img src="">카테고리 표시</p> <!-- 설정한 카테고리에 맞는 카테고리와 아이콘 보임 -->
	        		<div style="border-radius:2em; margin:0 auto; width:290px; height:100px; border:1px solid #FFAA00; padding:15px;">여기는 행복한 모임입니다! 맛집도 가고 친목도 다지는 그런 모임 다들 들어오세요!</div> <!-- 모임 소개 글 --> 
       	 			<br>
       	 			<a href="${ contextPath }/groupUpdate.gr?membershipNo=125"><button class="button"><b>모임 수정</button></a>
					<a href="${ contextPath }/groupAdmin.gr?membershipNo=125"><button class="button"><b>회원 관리</button></a>
       	 		</div> <!-- 1번째 블럭 끝  -->
       	 	</td> <!-- 1번째 블럭 끝 -->
       	 
	        <td><div style="background-color:white; width:100px; height:600px;"></div></td> <!-- 2번째 블럭  -->
	        <td> <!-- 3번째 블럭 -->
	        	<div style=" border:3px solid #FFAA00; position:relative; width:500px; height:600px; border-radius: 2em;">
	        		<h4 style="text-align:center;"><br>모임 일정 확인</h4><hr style="width:80%; margin:auto"></p>
	        		<div style="transform:scale(0.6); position:absolute; margin:0 auto;"><a href="calendar.jsp" style="color:inherit; text-decoration: none;"><%@include file="calendar2.jsp" %></a></div>
	        			<button class="button" id="calUI" style="margin-top:450px;"><b>일정 보기</button>
	        	</div>
	        	
	        </td>
	        </div>
	    </tr>
	</table> <!-- 모임 소개, 달력 블럭 끝  -->
	
	<br><br><br>
	<table style="margin:0 auto;">
	<tr class="top">
		<th class="no">번호</th>
		<th class="title">제목</th>
		<th class="writer">작성자</th>
		<th class="date">작성일자</th>
		<th class="count">조회수</th>
	</tr>
	<tr style="border-bottom: 2px solid lightgray;">
		<td>1</td>
		<td>제목1</td>
		<td>작성자1</td>
		<td>2023.00.00</td>
		<td>1</td>
	</tr>
	<tr style="border-bottom: 2px solid lightgray;">
		<td>2</td>
		<td>제목2</td>
		<td>작성자2</td>
		<td>2023.00.00</td>
		<td>2</td>
	</tr>
	<tr style="border-bottom: 2px solid lightgray;">
		<td>3</td>
		<td>제목3</td>
		<td>작성자3</td>
		<td>2023.00.00</td>
		<td>3</td>
	</tr>
	<tr style="border-bottom: 2px solid lightgray;">
		<td>4</td>
		<td>제목4</td>
		<td>작성자4</td>
		<td>2023.00.00</td>
		<td>4</td>
	</tr>
	<tr style="border-bottom: 2px solid lightgray;">
		<td>5</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr style="border-bottom: 2px solid lightgray;">
		<td>6</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr style="border-bottom: 2px solid lightgray;">
		<td>7</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr style="border-bottom: 2px solid lightgray;">
		<td>8</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr style="border-bottom: 2px solid lightgray;">
		<td>9</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr style="border-bottom: 2px solid lightgray;">
		<td>10</td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
</table>
	<br><br><br><br><br><br>
	<%@include file="../common/footer.jsp" %>

	<script>
		let count = parseInt(document.getElementById('count').innerHTML); //현재 좋아요 숫자 
		
		const like = document.getElementById('like'); //좋아요 아이콘 (버튼 기능)
		let number = 0; //새롭게 누르게 될 좋아요 숫자 
		let result = 0;
		like.addEventListener('click', function() {
			console.log(count);
			number++; //클릭 할 때마다 증가 
			console.log(number%2); // 1 0 1 0 -> 1이면 증가 0이면 감소 
			if(number%2 == 1) {
				result = count+1
				console.log(result);
				} else {
				result = count
				console.log(result);
			}
			document.getElementById('count').innerHTML = result;	
		})
	</script>
	
	<script>
		document.getElementById("calUI").addEventListener("click", function() {
			  window.location.href = "${contextPath}/calendar.gr";
			});
	</script>
	
	
</body>
</html>