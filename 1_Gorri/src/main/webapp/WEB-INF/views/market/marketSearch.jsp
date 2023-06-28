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
	.selectCate{
	    	width:100%;
	    	text-align:left;
	    	border-color:lightgrey;
	    	
	    }
	    
	.selectCate::after{
	    display:none;
	}

</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

</head>
<body>
<br><br><br>
<div style="text-align:center">
<div class="btn-group nav-scroller py-1 mb-2">
  <button type="button" class="btn btn-white dropdown-toggle selectCate" data-bs-toggle="dropdown" aria-expanded="false"  style="border:1px solid lightgrey;">전체</button> &nbsp;
  	<ul class="dropdown-menu">
		<li class="cateSel"><a class="dropdown-item ">전체</a></li>
		<li><a class="dropdown-item cateSel ">판매자</a></li>
		<li><a class="dropdown-item cateSel ">제목</a></li>
	</ul>
  <form class="d-flex searchMarket" role="search">
        <input class="form-control me-2" id="searchBoard" type="search" placeholder="Search" aria-label="Search" style="width:350px; border: 1px solid lightgrey;">
        <button class="btn btn-outline-success" type="button" style="background-color:gray; color:white; border:black" id="marketSearch">Search</button>
  </form>
  
  
 
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script>
const label = document.querySelector('.selectCate');
const options = document.querySelectorAll('.dropdown-item');
// 클릭한 옵션의 텍스트를 라벨 안에 넣음
const handleSelect = function(item) {
  label.innerHTML = item.textContent;
  label.parentNode.classList.remove('active');
}
// 옵션 클릭시 클릭한 옵션을 넘김
options.forEach(function(option){
  option.addEventListener('click', function()//{handleSelect(option)})
})

//그 값에 따라 다른 곳으로 제출이 됨.
document.getElementById('marketSearch').addEventListener('click', ()=>{
		console.log(label);
		console.log(options);
		const searchCategory = label.innerText;
		const searcher = document.getElementById('searchBoard').value;
		console.log(searcher);
		console.log(searchCategory);
		switch (searchCategory) {
		case "전체":
			location.href="${contextPath}/MainPage.market?all=" + searcher;
			break;
		case "판매자":
			location.href="${contextPath}/MainPage.market?seller=" + searcher;
			break;
		case "제목":
			location.href="${contextPath}/MainPage.market?search=" + searcher;
			break;
		default:
			console.log("똑바로입력해라");
			break;
		}
	})






</script>

</body>
	
</body>
</html>