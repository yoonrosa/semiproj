<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
   <!-- Required meta tags -->
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css"> <!-- 폰트 아이콘 사용할수있게 -->

   <!-- Bootstrap CSS -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

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
		margin-left:auto; margin-right:auto;
		border-radius: 30px;
	}
	

	/* 썸네일 부분 */
	.bottom{width: 100%; 
		display: flex; 
		justify-content: center;
		align-items : center;
		
		}
	.myhome-menu{
		width: 1030px;
		display: flex; 
		flex-wrap: wrap;
		margin-left: 0 auto; margin-right: 0 auto;
		}
	
	.thum{
		position: relative; dicplay: block; width: 200px; height: 200px; 
		margin-left: 3px; margin-right: 3px; margin-bottom: 6px; overflow : hidden}
	.thumb-img{width:200px; height:200px; margin-bottom: 4px;}
	.thum:hover .thumb-img{transform: scale(1.2, 1.2);}
	
	em{ /* 마우스 올렸을때 나오는 글자부분...*/
		width: 100%; height: 100%;
		display:none; position:absolute;
		left:0; top:0px;
		background: rgba(0, 0, 0, .5); color: #eee;
		text-align: center; padding-top: 45%; font-weight: bold;
		}
	.thum:hover em{display: block;}
	
	/*등록 게시글 없을때*/
   .no-content, .no-login{margin: 0 auto; text-align: center;}
   .no-content-icon, .no-login-icon{font-size: 80px; color:#ffaa00; margin-top: 80px; margin-bottom: 30px;}
   .no-content-text{margin-bottom: 100px;}
   .no-login-text{margin-bottom: 30px;}
	
</style>
 <script src="https://code.jquery.com/jquery-3.6.4.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	<br>
	

   <!-- Option 2: Separate Popper and Bootstrap JS -->
   <!--
   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
   -->
   
   
   <div class="border-line"> <!-- 겉에 주황색 테두리 -->

		<c:if test="${ empty loginUser }">
			<div class="no-login">
				<div class="no-login-icon"><i class="bi bi-emoji-wink-fill"></i></div>
				<div class="no-login-text">회원만 이용 가능합니다.</div>
				<div class="no-login-btn-width">
					<div><button class="no-login-btn" onclick="location.href='${contextPath}/main.do';"><b>메인으로</b></button></div>
					<div><button class="no-login-btn" onclick="location.href='${contextPath}/login.me';"><b>로그인</b></button></div>
				</div>
			</div>
		</c:if>
		
		<!-- 미니홈 이미지 썸네일 부분 -->
		<c:if test="${ !empty loginUser }">
	 		<%@ include file="minihome-nav2.jsp" %> <!-- 프로필사진, 닉넴, 자기소개글, 메뉴버튼 -->
			<div class="bottom"> 
				<div class="myhome-menu">
					<c:if test="${ listCount == 0 }">
						<div class="no-content">
							<div class="no-content-icon"><i class="bi bi-emoji-wink-fill"></i></div>
							<div class="no-content-text">등록한 게시글이 없습니다.</div>
						</div>
					</c:if>
					<c:if test="${ listCount != 0 }">
						<c:forEach items="${ bList }" var="b">
							<c:forEach items="${ aList }" var="a">
								<c:if test="${ b.boardNo eq a.boardNo }">
									<c:if test="${ a.attmLevel eq 0 }">
										<div class="thum">
											<img src="${contextPath}/resources/uploadFiles/${ a.renameName }" class="thumb-img">
											<em>${ b.boardTitle }<br>${ fn:split(b.postdate, '')[0] }</em>
											<input type="hidden" name="bNo" value="${b.boardNo }">
											<input type="hidden" name="bId" value="${b.usersId }">
										
										</div>
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:if>
				</div>
			</div>
		</c:if>
		<br>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	

<script>
window.onload = () =>{
	const thums = document.getElementsByClassName('thum');
	for(const thum of thums){
		thum.addEventListener('click', function(){
			const boardNo = this.querySelector('input[name="bNo"]').value;
			const boardId = this.querySelector('input[name="bId"]').value;
			location.href="${contextPath}/miniBoardContent.mi?bNo=" + boardNo + "&bId=" + boardId;
		})
	}
	
}
</script>
</body>
</html>
