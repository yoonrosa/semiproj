<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
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

	.gTitle{text-align:center; text-decoration:underline;}
/* 	.groupCARD{width:350px; margin-left:auto; margin-right:auto; margin-top:20px; margin-bottom:20px;} */
/* 	.groupName{font-size: 30px; font-weight:bold;} */
/* 	.groupInt{heigt:100px;} */
	
	
	
	.groupTable2{
		border-collapse:separate;
		border-spacing:0;
		margin: 20px;
		width:700px;
	}
	
	.groupPic{
		width:250px;
		height:250px;
		position:relative;
		overflow:hidden;
		-webkit-clip-path: padding-box;
    	clip-path: padding-box;
	}
	.groupTitle{
		height:40px;
		font-size:30px;
		font-weight:bold;
		text-align:left;
		padding-left:30px;
		padding-top:15px;
		
	
	}
	.groupIntro{
		height:35px;
		font-size:20px;
		font-weight:bold;
		text-align:left;
		padding-left:30px;
		padding-top:20px;
		padding-right:20px;
		
	}
	
	.groupButtons{
		height:50px;
		font-size:10px;
		text-align:left;
		padding-top:20px;
		padding-left:20px;
	}
	
	.gThumnail{
		position:absolute;
		transform:translate(-50%, -50%);
		max-width:100%; 
		max-height:100%;
		-webkit-clip-path: inherit;
    	clip-path: inherit;
    	width: 100%;
   		height: 100%;
    	object-fit: cover;
    	border-top-left-radius:2em;
    	border-bottom-left-radius:2em;    	
	}

	a.groupLink{
		text-decoration: none; /* 밑줄 없애기 */
  		color: black;
	}
	a.groupLink:hover{
		color:#ffab00
	}
	
	#pageTable{
		width:300px;
		margin-top:100px;
		margin-left:300px;
		margin-right:300px;
		border: none;
	}
	.paging{
		text-decoration:none;
		font-size:25px;
		font-weight:bold;
		color:grey;
	}
	
	.paging:hover{
		text-decoration:none;
		font-size:25px;
		font-weight:bold;
		color:#ffab00;
	}
	.selectPage{
		text-decoration:none;
		font-size:25px;
		font-weight:bold;
		color:black;
	}
	.selectPage:hover{
		text-decoration:none;
		font-size:25px;
		font-weight:bold;
		color:black;
		cursor:default;
	}
	
	.groupCard{
		height:800px;
		width:500px;
	}
	
	.enterGroup{
	  width: 140px;
	  height: 45px;
	  font-family: 'Roboto', sans-serif;
	  font-size: 13px;
	  text-transform: uppercase;
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
	  margin-right:25px;
  }

	.enterGroup:hover{
	  background-color: #ffab00;
	  box-shadow: lightgray;
	  color: #fff;
	  transform: translateY(-7px);
}
</style>
</head>
<body>

<%@include file = "../common/top.jsp" %>
		<br><br>
		<br>
		
		
		
	<!-- 모임 검색창 + 모임 개설 버튼 -->
		<%@include file = "../common/searchGroup.jsp" %>
        <br>
        <c:if test="${ !empty loginUser }">
        <div class="gTitle">
		<a href="${ contextPath }/groupMaking.gr"><button class="btn btn-outline-success" type="button" style="background-color:#ffab00; color:white; border:1px solid #ffab00">모임 개설</button></a>
		</div><br>
		</c:if>
		
		<c:if test="${ empty loginUser }">
		<div class="gTitle">
		<button id="noLogin" class="btn btn-outline-success" type="button" style="background-color:#ffab00; color:white; border:1px solid #ffab00">모임 개설</button>
		</div><br>
		</c:if>
		
		<script>
			document.getElementById("noLogin").addEventListener('click', ()=>{
				alert('로그인이 필요한 페이지 입니다.')
				location.href="${contextPath}/login.me";
			})
		</script>

<%@include file = "../common/categoryGroup.jsp" %>

<!-- 모임 목록 입니다.  -->
<div align="center" style="margin:30px; margin-left:auto; margin-right:auto;">
   	
   	
   	<c:forEach items="${ gList }" var="g">
		<c:if test="${ category eq g.category}">   	
		   	<table class="groupTable2"  style="border:2px solid #ffab00; border-radius:2em;" >
						<tr>
							<td class="groupPic" rowspan ="3">
								<c:forEach items="${ gAttm }" var="a">							
									<c:if test="${ g.membershipNo eq a.boardNo }">									
										<img src="${ contextPath }/resources/uploadFiles/${a.renameName}"  class="gThumnail">
									</c:if>	
								</c:forEach>	
							</td>
							<td class="groupTitle"><a href="${contextPath}/selectGroupView.gr?membershipNo=${g.membershipNo }&page=${page}" class="groupLink">${ g.membershipName }</a></td>
						</tr>				
						<tr>
							<td class="groupIntro">${ g.membershipContent }</td>
						</tr>
						<tr>
							<td style="text-align:left; padding-left:30px; height:80px; paddding-bottom:20px;">
								<img src="resources/assets/heart.png" style="width:25px; height:25px; cursor:pointer;"> 
								<span>${ g.capacity }</span>							
							</td>
							<td>
								<button class="enterGroup"><b>입장하기</b></button>
								<input type="hidden" value="${ g.membershipNo }">
							</td>
						</tr>
			</table> 
	   	</c:if>
   	</c:forEach>
   	
   		
   				<table align="center" id="pageTable">
   					<tr>
   						<!-- 앞으로 가기 -->
   						<c:url var="goBack" value="${ loc }">
	            				<c:param name="page" value="${ pi.currentPage-1 }"/>
	            				<c:param name="category" value="${ category }"/>
	            		</c:url>	
   						<td>
   							<c:if test="${ pi.currentPage > 1 }">
   								<a class="paging" href="${ goBack }">&laquo;</a>
   							</c:if>
   							<c:if test="${ pi.currentPage <= 1 }">
   								<a class="paging" style="color:lightgrey; cursor:default;" >&laquo;</a>
   							</c:if>	
   						</td>
   						<!-- 페이지 -->
   						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
   							<c:url var="goNum" value="${ loc }">
	           					<c:param name="page" value="${ p }"/>
	           					<c:param name="category" value="${ category }"/>
	           				</c:url>
	           				
	           				<c:if test="${ pi.currentPage eq p }">
	           				<td>
	           					<a class="selectPage">${ p }</a>
	           				</td>
	           				</c:if>
	           				<c:if test="${ !( pi.currentPage eq p ) }">
	           				<td>
	           					<a class="paging" href="${goNum}">${ p }</a>
	           				</td>
	           				</c:if>
   						
   						</c:forEach>
   						<!-- 뒤로가기 -->
   						<c:url var="goNext" value="${ loc }">
   								<c:param name="category" value="${ category }"/>
	            				<c:param name="page" value="${ pi.currentPage+1 }"/>
	            		</c:url>	
   						<td>
   							<c:if test="${ pi.currentPage < pi.endPage }">
   								<a class="paging" href="${ goNext }">&raquo;</a>
   							</c:if>
   							<c:if test="${ pi.currentPage >= pi.endPage }">
   								<a class="paging" style="color:lightgrey; cursor:default;">&raquo;</a>
   							</c:if>
   						</td>
   					</tr>
   				</table>
   				
	</div>
<%@include file = "../common/footer.jsp" %>
<script>
	window.onload=()=>{
		
		const cateName = document.getElementsByClassName('categorys');
		
		for(cn of cateName){
			cn.addEventListener('click',function(){
				const category = this.querySelector('.category-name').innerText;
				console.log(category);
				location.href="${contextPath}/selectCate.gr?category=" + category;
			})
		
		
					
		}
		
		
		
	}
	
	const buttons = document.getElementsByClassName('enterGroup');
	for(const button of buttons){
		button.addEventListener('click', function(){
			const membershipNo = this.parentElement.querySelector('input').value;
			location.href="${contextPath}/selectGroupView.gr?membershipNo=" + membershipNo + "&page="+${pi.currentPage} ;
		})
	}

</script>
</body>
</html>