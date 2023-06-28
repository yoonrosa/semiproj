<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 수정하기</title>

<style>
   #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: #ffaa00;; font-weight: bold;}
   #menu-market{color: dimgray; font-weight: bold;}
   .group-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }



.aligncenterhae{text-align:center;}

.tdtwwo{width:155px; height:100px; font-size:20px; font-weight:bold; padding-left:30px}

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

.gThumnail{
/*  		position:absolute; */
/* 		transform:translate(-50%, -50%); */
		max-width:100%; 
		max-height:100%;
		-webkit-clip-path: inherit;
    	clip-path: inherit;
    	width:200px; height:200px;
    	margin:auto;
    	object-fit: cover;
    	border-radius:2em;
    	border:3px solid #ffab00
	}
	
#updateGroupPic{display:none;}

</style>

</head>

<body>
<%@include file = "../common/top.jsp" %>
<br><br><br>

<div class="aligncenterhae">
<h1>모임 수정하기</h1>
</div>
<br><br><br>

<div class="aligncenterhae" style="height:800px; width:1000px; border:2px solid #ffab00; margin-left:auto; margin-right:auto; border-radius:2em; padding:90px;">
	<!-- 모임이름, 카테고리 -->
	<form action="${ contextPath }/updateGroup.gr" method="post" enctype="multipart/form-data">
		<input type="hidden" name="membershipNo" value="${ membershipNo }">
		<input type="hidden" name="page" value=${ page }>	
		<table style="text-align:left;">
			<tr>
				<td rowspan="2">
					<div id="groupPicDiv" style="border-radius:2em;"> 
						<img src="${ contextPath }/resources/uploadFiles/${groupPic.renameName}"  style="width:250px; height:250px; border:5px solid #ffab00;" id="groupReprePic">
					</div>
					
					<!-- updatefile 이름 담을 input과 삭제할 파일 rename 담을 input -->
					<input type="file" accept="image/*" class="form-control form-control-lg" name="file" id="updateGroupPic" onchange="setThumbnail(event);">
					<input type="hidden" name="deletePic" id="deletePic" value="notUpdate">						
					
					<!-- 새 파일이 들어왔을때 들어갈 div -->
					<div class="groupPic" id="newPic" style="border-radius:2em;">					
					</div>
				</td>
				<td class="tdtwwo">모임 이름</td>
				<td><input name="membershipName" class="form-control me-2" style="width:200px; border: 1px solid gray;" value = "${ groupInfo.membershipName }" readonly></td>
			</tr>
			
			<tr>
				<td class="tdtwwo">카테고리</td>
				<td class="tdtwwo" style="font-size:25px; padding-left:10px;">${ groupInfo.category }</td>
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
						<input name="hostId" class="form-control me-2" value="${ groupInfo.hostId }" style="width:170px; border: 1px solid gray;" readonly required>
					</td>
					<td class="tdtwwo" style="padding-left:8px; height:50px; width:100px; font-size:20px">연락처</td>
					<td>
						<input name="hostPhone" class="form-control me-2" placeholder="연락처 입력" style="width:170px; border: 1px solid gray;" value="${ groupInfo.hostPhone }" required>
					</td>
				</tr>
				<tr >
					<td colspan="6" class="tdtwwo" style="height:30px; padding-top:20px;">모임 한줄 소개</td>
				</tr>
				<tr>
					<td colspan="4" style="padding-left:30px; padding-right:10px; padding-top:10px;">
						<input name="membershipContent" maxlength="100" class="form-control me-2" value="${ groupInfo.membershipContent }" style="width:100%; border: 1px solid lightgrey;" required>
					</td>
				</tr>
			</table>
		</div>
		<br><br>
		<button type="submit" class="button" style="50px;"><b>수정하기</button>
	</form>
</div>	

<br>
<%@include file = "../common/footer.jsp" %>

<script>


	window.onload=()=>{		
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
		
	}
	
	const groupPic = document.getElementById('groupReprePic')
    const imgDiv = document.getElementsByClassName('groupPic')[0];

	groupPic.addEventListener('click',()=>{
		document.getElementById('updateGroupPic').click();
	})
	
	function setThumbnail(event){
		for(const image of event.target.files){
			const reader = new FileReader();
			reader.onload = function(event){
				document.getElementById('deletePic').value="${groupPic.renameName}";
				groupPic.src = event.target.result;
			}
			reader.readAsDataURL(image);
		}
}	

</script>
</body>
</html>