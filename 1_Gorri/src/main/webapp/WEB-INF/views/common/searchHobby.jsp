<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<div style="text-align:center">
		<div class="btn-group nav-scroller py-1 mb-2">
		 
		  	<button type="button" class="btn btn-white dropdown-toggle selectCate" data-bs-toggle="dropdown" aria-expanded="false"  style="border:1px solid lightgrey;">
		   		전체
		  	</button> &nbsp;
		  	<ul class="dropdown-menu">
				<li class="cateSel"><a class="dropdown-item">전체</a></li>
				<li><a class="dropdown-item cateSel">내용</a></li>
				<li><a class="dropdown-item cateSel">제목</a></li>
			</ul>

			<form class="d-flex" role="search" action="${contextPath }/searchHobby.hb">
				<input type="hidden" name="searchCate" id="searchCate" value="전체">
		        <input class="form-control me-2" placeholder="Search" name="searchWord" style="width:350px; border: 1px solid lightgrey;" id="searchWord">
		        <button class="btn btn-outline-success" type="submit" style="background-color:gray; color:white; border:black" id="hobbySearch" >Search</button>
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
	  option.addEventListener('click', function(){
		  
		  handleSelect(this);
		  document.getElementById('searchCate').value=this.innerText;
		  console.log(document.getElementById('searchCate').value);
		 })
	})
	
	document.getElementById('hobbySearch').addEventListener('click', ()=>{
		const searchCate = document.getElementById('searchCate').value;
		const searchWord = document.getElementById('searchWord').value;
		location.href="${contextPath}/searchHobby.hb?searchCate=" + searchCate + "&searchWord=" + searchWord;
	})
	</script>

</body>
	
</body>
</html>