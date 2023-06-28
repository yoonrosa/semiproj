<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 개설하기</title>
<style>
   #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: #ffaa00;; font-weight: bold;}
   #menu-market{color: dimgray; font-weight: bold;}
   .group-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }

.aligncenterhae{text-align:center;}

.tdtwwo{width:155px; height:100px; font-size:20px; font-weight:bold; padding-left:30px}
#groupPic{
	width:200px;
	height:200px;
	background-color:white;
	margin:auto;
	border-radius:2em;
 	border:1px solid #ffab00
}

.wrap {
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.button {
  width: 140px;
  height: 45px;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
  text-transform: uppercase;
  letter-spacing: 2.5px;
  font-weight: 500;
  color: #fff;
  background-color: black;
  border: none;
  border-radius: 45px;
  box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease 0s;
  cursor: pointer;
  outline: none;
  }

.button:hover {
  background-color: #ffab00;
  box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
  color: #fff;
  transform: translateY(-7px);
}

#groupReprePic{
	display:none;
}
#insertGroupPic{
	padding-top:70px;
	font-weight:bold;
	text-align:center;
	font-size:15px;
	height:200px;
	width:200px;
	display:inline-block;
}

#insertGroupPic:hover{
	color:#ffab00;
}

	@font-face {
	    font-family: 'omyu_pretty';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
	}
	
	h1{
		font-family: 'omyu_pretty';
			font-size: 27px;
	}


</style>
</head>

<body>
<%@include file = "../common/top.jsp" %>
<br><br><br>

<div class="aligncenterhae">
<h1>모임 개설하기</h1>
</div>
<br><br><br>

<div class="aligncenterhae" style="height:800px; width:1000px; border:2px solid #ffab00; margin-left:auto; margin-right:auto; border-radius:2em; padding:80px;">
	<!-- 모임이름, 카테고리 -->
	<form action="${ contextPath }/insertGroup.gr" method="post" enctype="multipart/form-data" onsubmit="return checkInput()">
		<table style="text-align:left;">
			<tr>
				<td rowspan="2" style="padding-left:150px;">
					<div id="groupPic">
						<span id="insertGroupPic">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-plus" viewBox="0 0 16 16">
  								<path d="M8 6.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V11a.5.5 0 0 1-1 0V9.5H6a.5.5 0 0 1 0-1h1.5V7a.5.5 0 0 1 .5-.5z"/>
								<path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5L14 4.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5h-2z"/>
							</svg><br><br>
							모임 대표 이미지 첨부<br>[필수 사항]
						</span>
						<img id="preview">		
						<input type="file" accept="image/*" class="form-control form-control-lg" name="file" id="groupReprePic" onchange="setThumbnail(event);">
					</div>
				</td>
				<td class="tdtwwo">모임 이름</td>
				<td><input name="membershipName" class="form-control me-2" style="width:200px; border: 1px solid gray;" required></td>
			</tr>
			
			<tr>
				<td class="tdtwwo">카테고리</td>
				<td>
					<button type="button" class="btn btn-danger dropdown-toggle selectCate" data-bs-toggle="dropdown" aria-expanded="false"  style="background-color:white; border:1px solid gray; color:black;">
	   				 -------
	  				</button> &nbsp;
	  				<ul class="dropdown-menu">
	    				<li><a class="dropdown-item cateSel">예술</a></li>
	    				<li><a class="dropdown-item cateSel">운동</a></li>
	    				<li><a class="dropdown-item cateSel">음식</a></li>
	    				<li><a class="dropdown-item cateSel">여행</a></li>
	    				<li><a class="dropdown-item cateSel">창작</a></li>
	    				<li><a class="dropdown-item cateSel">자기계발</a></li>
	  				</ul>
	  				<input type="hidden" id="category" name="category" value="" required>
	  			</td>
			</tr>
		</table>
		
		<br><hr>
		
		<div align="center">
			<table>
				<tr>
					<td colspan="4" class="tdtwwo" style="height:70px; text-align:left;"> 개설자 정보</td>
				</tr>
				
				<tr style="text-align:left;">
					<td class="tdtwwo" style="height:50px; width:100px; font-size:20px">아이디</td>
					<td>
						<input name="hostId" class="form-control me-2" value="${ loginUser.userId }" style="width:170px; border: 1px solid gray;" readonly required>
					</td>
					<td class="tdtwwo" style="padding-left:8px; height:50px; width:100px; font-size:20px">연락처</td>
					<td>
						<input name="hostPhone" class="form-control me-2" placeholder="연락처 입력" style="width:170px; border: 1px solid gray;" value="${ loginUser.phone }" required>
					</td>
				</tr>
				<tr >
					<td colspan="6" class="tdtwwo" style="height:30px; padding-top:20px;">모임 한줄 소개</td>
				</tr>
				<tr>
					<td colspan="4" style="padding-left:30px; padding-right:10px; padding-top:10px;">
						<input name="membershipContent" class="form-control me-2" placeholder="모임 한줄 소개" style="width:100%; border: 1px solid lightgrey;" maxlength="100" required>
					</td>
				</tr>
			</table>
		</div>
		<br><br>
		<button type="submit" class="button" style="50px;"><b>개설하기</button>
	</form>
</div>	

<br>
<%@include file = "../common/footer.jsp" %>
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
		  document.getElementById('category').value=this.innerText;
		  console.log(document.getElementById('category').value);
		 })
	})
	
	const imgDiv = document.getElementById('groupPic');
	imgDiv.addEventListener('click', ()=>{
		document.getElementById('groupReprePic').click();
	})

	function setThumbnail(event){
			for(const image of event.target.files){
				const reader = new FileReader();
				reader.onload = function(event){
					document.getElementById('insertGroupPic').style.display='none';
					const img = document.getElementById("preview");
					img.src = event.target.result;
					img.setAttribute("style", "width:200px; height:200px;background-color:white; margin:auto;border-radius:2em; border:3px solid #ffab00");				
					
				}
				reader.readAsDataURL(image);
			}
			console.log(document.getElementById('groupReprePic').value);
	}		
	
		
	function checkInput(){
		if(document.getElementById('category').value==""){
			console.log(123);
			alert("카테고리 선택은 필수입니다.");
			label.click();
			return false;
		}
		
		if(document.getElementById('groupReprePic').value==""){
			alert('그룹 대표 사진 설정은 필수입니다.');
			document.getElementById('groupReprePic').click();
			return false;
		}
		
		return true;
	}
	
</script>
</body>
</html>