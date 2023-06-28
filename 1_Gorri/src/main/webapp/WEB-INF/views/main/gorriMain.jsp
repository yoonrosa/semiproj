<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	.mar1{margin-left: 180px; margin-right: 180px;}
	.bo1{border-bottom: 1px solid black;}
	.tpd{padding-top: 100px;}
	.mar2{margin-left: 230px; margin-right: 230px;}
	.divgap{gap: 50px 10px;}
	.bor{border: 1px solid black;}
	.title{font-weight: bold; display: inline-block; width: 200px;}
	.groupSelect:hover{
		color:#ffab00;
		}
	

.img-fluid{width:100%; height:100%; object-fit: cover;}  
   .img-fluid-div{width : 100%; height: 226.51px; position: relative; overflow : hidden; border-top-left-radius: 5px; border-top-right-radius: 4px;}
   
   .out111{
      width: 100%; 
      display: flex; 
      justify-content: center;
      align-items : center;}
   .out2222{width: 1300px;
      display: flex; 
      flex-wrap: wrap;
      margin-left: 0 auto; margin-right: 0 auto;}
   .div-img22222{
      display: flex;
      flex-wrap: wrap;
      margin-left: 0 auto; margin-right: 0 auto;
      padding-right: 12px; padding-left: 12px;}
   .nav-div{margin-left: 0 auto; margin-right: 0 auto;}
   .navnav{padding-top: 100px; width: 1300px; border-bottom: 1px solid black; margin-bottom: 10px;}
   
   .hb-img-div2222{width: 245px; height: 245px; position: relative; overflow : hidden; margin: 5px;}
   .img22222{width:100%; height:100%; object-fit: cover;}
	
	@font-face {
    font-family: 'GoryeongStrawberry';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/GoryeongStrawberry.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
	}
	
	h3{
	font-family: 'GoryeongStrawberry';
	}
	   #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: dimgray; font-weight: bold;}
   #menu-market{color: dimgray; font-weight: bold;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }
   
   
</style>
</head>
<body>
	<!-- 탑 -->
	<jsp:include page="../common/top.jsp"/>
	
	<!-- 슬라이드 -->
	<div id="myCarousel" class="carousel slide mar" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
			<a href="${ contextPath }/hobbyMain.hb"><img src="resources/uploadFiles/main2.png" class="d-block w-100" alt="..." ></a>
				<div class="container">
					<div class="carousel-caption text-start"></div>
				</div>
			</div>
			<div class="carousel-item">
			<a href="${ contextPath }/groupMain.gr"><img src="resources/uploadFiles/main1.png" class="d-block w-100" alt="..." ></a>
				<div class="container">
					<div class="carousel-caption"></div>
				</div>
			</div>
			<div class="carousel-item" >
			<a href="${ contextPath }/MainPage.market"><img src="resources/uploadFiles/main3.png" class="d-block w-100" alt="..." ></a>
				<div class="container">
					<div class="carousel-caption text-end">
					</div>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
	
	
	   <!-- 취미 -->
   <div class="out111">
      <div  class="out2222">
         <div>
            <nav class="navnav">
                   <h3 class="fw-light">다른 사람의 취미를 둘러보세요~</h3>
              </nav>
         </div>
         <div>
            <div class="div-img22222">
               <c:forEach items="${ bList }" var="b" begin="1" end="10">
                  <div class="hb-img-div2222">
                  <c:forEach items="${ hList }" var="h">
                     <a href="${ contextPath }/miniBoardContent.mi?bNo=${b.boardNo}&bId=${b.usersId}">
                     <c:if test="${ b.boardNo eq h.boardNo }">
                     	<img src="${ contextPath }/resources/uploadFiles/${ h.renameName }" class="img22222">
                     	</c:if>
                     </a>
                  </c:forEach>
                  </div>
               </c:forEach>
            </div>
         </div>
      </div>
   </div>
	
	<!-- 모임 -->
   <div>
      <div class="nav-scroller py-1 mb-2 mar1">
         <nav class="nav d-flex justify-left bo1 tpd">
                <h3 class="fw-light">모임에 참가해 취미를 함께 즐겨보세요~</h3>
           </nav>
      </div>
   
      <div class="album py-1 bg-white mar1">
         <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
               <c:forEach begin="1" end="6" items="${ gList }" var="g">
                  <div class="col">
                     <div class="card shadow-sm">
                        <div class="img-fluid-div">
                           <c:forEach items="${ aList }" var="a">
                              <c:if test="${ g.membershipNo eq a.boardNo }">
                                 <a href="${ contextPath }/selectGroupView.gr?membershipNo=${g.membershipNo}"><img src="${ contextPath }/resources/uploadFiles/${a.renameName}" class="img-fluid"></a>
                              </c:if>   
                           </c:forEach>
                        </div>
                        
                        <div class="card-body">
                           <div class="sub-title">
                              <p class="title groupSelect">
                                 ${ g.membershipName }
                                 <input type="hidden" value="${g.membershipNo}">
                              </p>
                              <small class="d-inline-block">회원 인원 : ${ g.capacity }</small>
                              <div class="d-flex justify-content-between align-items-center">
                                 <small class="text-muted">${ g.membershipContent }</small>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </c:forEach>
            </div>
         </div>
      </div>
   </div>
   
   
	<!-- 푸터 -->
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	 window.onload=()=>{
		 const groupNames = document.getElementsByClassName('groupSelect');
		 console.log(groupNames);
		 for(groupName of groupNames){
			 groupName.addEventListener('click',function(){
				 const membershipNo = this.querySelector('input').value;
				 console.log(this);
				 console.log(membershipNo);
				 location.href="${contextPath}/selectGroupView.gr?membershipNo=" + membershipNo;
			 })
		 }
		 
	 }
	
	</script>
</body>
</html>