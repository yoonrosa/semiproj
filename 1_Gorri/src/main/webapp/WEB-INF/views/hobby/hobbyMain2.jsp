<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
  	
</style>

</head>  
<body>
	<%@ include file="../common/top.jsp" %>
	<br><br><br>
	
	<!-- 검색창 -->
	<%@ include file="../common/searchHobby.jsp" %>
	
	
	<br>
	<div class="category">
		<table>
			<tr>
				<td class="margin"></td>
				<td class="categorys"><i class="fa-solid fa-paintbrush"></i><br><a class="category-name">예술</a></td>
				<td class="categorys"><i class="fa-solid fa-baseball"></i><br><a class="category-name">운동</a></td>
				<td class="categorys"><i class="fa-solid fa-utensils"></i><br><a class="category-name">음식</a></td>
				<td class="categorys"><i class="fa-solid fa-suitcase-rolling"></i><br><a class="category-name">여행</a></td>
				<td class="categorys"><i class="fa-solid fa-pencil"></i><br><a class="category-name">창작</a></td>
				<td class="categorys"><i class="fa-solid fa-graduation-cap"></i><br><a class="category-name">자기계발</a></td>
				<td class="margin"></td>
			</tr>
		</table>
	</div>
  	<br>
	<br><br>
		<!-- 미니홈 이미지 썸네일 부분 -->
		<div class="bottom"> 
			<div class="myhome-menu" id="result">
				
					<c:forEach items="${ hList }" var="hli">
						<div class="thum" onclick="location.href='${contextPath}/miniBoardContent.mi'">
							<img src="${ contextPath }/resources/assets/${hli.RENAMENAME }" class="thumb-img">
							<em>${ hli.BOARD_TITLE }<br>${ hli.USERS_ID }<br>${ fn:split(hli.POSTDATE, ' ')[0] }</em>
						</div>
					</c:forEach>

				
			</div>
			
		</div>
		<br>
	

	<%@ include file="../common/footer.jsp" %>
	
<script>
  	window.onload =()=>{ 
  		const tr = document.querySelector('tr');
  		const tds = tr.querySelectorAll('td');  
  		
  		for(const td of tds){
  			td.addEventListener('click', function(){ // 각 카테고리 클릭하면..
//   				console.log(this.children[2].innerText);
  				var category = this.children[2].innerText;
  				                  
  				$.ajax({
  					url : "hobbyCate.hb", // 여기로 
  					data : {"category" : category},
  					success : data =>{
  						console.log(data);
//   						$(#result).html(data); // 성공할 시에 body부분에 html을 적용시키겠다.??
  								
						const result = document.getElementById('result');
						result.innerHTML=''; // 우선 div안에 태그 다 지워주기...
						
						data.forEach(post => {
				            const thumDiv = document.createElement('div');
				            thumDiv.classList.add('thum');
				            thumDiv.onclick = function () {
				              location.href = '${contextPath}/miniBoardContent.mi';
				            };

				            const img = document.createElement('img');
				            img.src = '${ contextPath }/resources/assets/' + (post.RENAMENAME || '');
// 				            img.src = '${ contextPath }/resources/assets/' + (post.ORIGINALNAME || '');
				            img.classList.add('thumb-img');

				            const em = document.createElement('em');
				            em.innerText = post.BOARD_TITLE +'\n' + post.USERS_ID +'\n' + post.POSTDATE.split(' ')[0];

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
	}
  	
  	
	// 옵션 클릭시 클릭한 옵션을 넘김
	options.forEach(function(option){
	  option.addEventListener('click', function(){
		  
		  handleSelect(this);
		  document.getElementById('searchCate').value=this.innerText;
		  console.log(document.getElementById('searchCate').value);
		 })
	})
	
	document.getElementById('groupSearch').addEventListener('click', ()=>{
		const searchCate = document.getElementById('searchCate').value;
		const searchWord = document.getElementById('searchWord').value;
		location.href="${contextPath}/searchHobby.hb?searchCate=" + searchCategory + "&searchWord=" + searchWord;
	})
	
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>