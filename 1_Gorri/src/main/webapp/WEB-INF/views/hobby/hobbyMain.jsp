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
   #menu-hobby{color: #ffaa00; font-weight: bold;}
   #menu-group{color: dimgray; font-weight: bold;}
   #menu-market{color: dimgray; font-weight: bold;}
   .hobby-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }
	

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
		text-align: center; padding-top: 35%; font-weight: bold;
		}
	.thum:hover em{display: block;}
	
	
	/* 검색창 */
	.selectCate{
		width:100%;
	    text-align:left;
	    border-color:lightgrey;
	    }
	    
	.selectCate::after{
	    display:none;
		}
	.write{font-size: 25px; margin-left: 30px;}
	.empty{margin-left: 60px;}
	.icon{color: black;}
	.icon:hover{color: #ffaa00;}
	
	table{
		margin:0 auto; text-align: center; width: 90%;
		border-top: 1.5px solid darkgray; border-bottom: 1.5px solid darkgray;
		}
	
	.category{margin-left:100px; margin-right: 100px;}
	.categorys{width: 70px; cursor: pointer;  padding-top: 25px; padding-bottom: 20px;}
  	.category-name{font-size: 13px; text-decoration: none; color: black;} /* 카테고리 항목 글자크기 */
  	.fa-solid{font-size: 25px;} /* 아이콘 크기 */
  	.categorys:hover{color: #ffaa00;}	
  	.categorys:hover .category-name{color: #ffaa00;}
	
	/* 페이지 버튼*/
	#pageTable{
		width:300px;
		margin-top:100px;
		margin-left: auto;
		margin-right:auto;
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
	
	
</style>

</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<br>
	<br>
	<br>
	
	<!-- 검색창 -->
	<%@ include file="../common/searchHobby.jsp" %>
	<br>
	<div class="category">
		<table>
			<tr id="ca">
				<td class="margin"></td>
				<td class="categorys category-imgs"><i class="fa-solid fa-paintbrush"></i><br><a class="category-name">예술</a></td>
				<td class="categorys category-imgs"><i class="fa-solid fa-baseball"></i><br><a class="category-name">운동</a></td>
				<td class="categorys category-imgs"><i class="fa-solid fa-utensils"></i><br><a class="category-name">음식</a></td>
				<td class="categorys category-imgs"><i class="fa-solid fa-suitcase-rolling"></i><br><a class="category-name">여행</a></td>
				<td class="categorys category-imgs"><i class="fa-solid fa-pencil"></i><br><a class="category-name">창작</a></td>
				<td class="categorys category-imgs"><i class="fa-solid fa-graduation-cap"></i><br><a class="category-name">자기계발</a></td>
				<td class="margin"></td>
			</tr>
		</table>
	</div>
  	
	<br><br>
	
			<!-- 미니홈 이미지 썸네일 부분 -->
	<div>
		<div class="bottom"> 
			<div class="myhome-menu" id="result">
				<c:forEach items="${ bList }" var="b">
					<c:forEach items="${ aList }" var="a">
						<c:if test="${ b.boardNo eq a.boardNo }">
							<div class="thum">
								<c:if test="${fn:containsIgnoreCase(a.renameName, 'jpg') or fn:containsIgnoreCase(a.renameName, 'png') or fn:containsIgnoreCase(a.renameName, 'jpeg') }">
<%-- 									${ a.renameName } --%>
									<img src="${ contextPath }/resources/uploadFiles/${ a.renameName }" class="thumb-img">
									<em>${ b.boardTitle }</em>
									<label class="bNo">${ b.boardNo }</label>
									<label class="bId">${ b.usersId }</label>
								</c:if>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
		
		</div>
		<br>

	<%@ include file="../common/footer.jsp" %>
	
<script>
	window.onload =()=>{ 
  		const ca = document.getElementById('ca');
  		const categoryImgs = document.getElementsByClassName('category-imgs');  
  		
  		for(const categoryImg of categoryImgs){
  			categoryImg.addEventListener('click', function(){ // 각 카테고리 클릭하면..
//   				console.log(categoryImg);
  				console.log(this.children[2].innerText);
  				var category = this.children[2].innerText;
  				                  
  				$.ajax({
  					url : "hobbyCate.hb", // 여기로 
  					data : {"category" : category},
  					success : data =>{
  						console.log(data);
//   						$(#result).html(data); // 성공할 시에 body부분에 html을 적용시키겠다.??
  								
						const result = document.getElementById('result');
						result.innerHTML=""; // 우선 div안에 태그 다 지워주기...
						
						data.forEach(post => {
				            const thumDiv = document.createElement('div');
				            thumDiv.classList.add('thum');
				            thumDiv.onclick = function () {
				              location.href = '${contextPath}/miniBoardContent.mi?bNo=' + post.boardNo + "&bId=" + post.usersId;
				            };

				            const img = document.createElement('img');
				            img.src = '${ contextPath }/resources/uploadFiles/' + post.renameName;
				            img.classList.add('thumb-img');

				            
// 				            const formattedDate = moment(post.POSTDATE).format('YYYY-MM-DD');
				            
				            const em = document.createElement('em');
				            em.innerText = post.boardTitle +'\n' + post.usersId +'\n' + post.postdate;

				            thumDiv.appendChild(img);
				            thumDiv.appendChild(em);
				            result.appendChild(thumDiv);
				          });
				        },
  					error : data=>{
  						console.log(data);
  					}
  				})
  			});
  		}
  		
  		const thums = document.getElementsByClassName('thum');
		for(const thum of thums){
			thum.addEventListener('click', function(){
				const boardNo = this.querySelector('.bNo').innerText;
				const boardId = this.querySelector('.bId').innerText;
				location.href="${contextPath}/miniBoardContent.mi?bNo=" + boardNo + "&bId=" + boardId;
			})
		}
	}
  	
  	
	// 옵션 클릭시 클릭한 옵션을 넘김
// 	options.forEach(function(option){
// 	  option.addEventListener('click', function(){
		  
// 		  handleSelect(this);
// 		  document.getElementById('searchCate').value=this.innerText;
// 		  console.log(document.getElementById('searchCate').value);
// 		 })
// 	})
	
// 	document.getElementById('groupSearch').addEventListener('click', ()=>{
// 		const searchCate = document.getElementById('searchCate').value;
// 		const searchWord = document.getElementById('searchWord').value;
// 		location.href="${contextPath}/searchHobby.hb?searchCate=" + searchCategory + "&searchWord=" + searchWord;
// 	})

	
</script>


</body>
</html>