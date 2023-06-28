<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
   #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: dimgray; font-weight: bold;}
   #menu-market{color: #ffaa00; font-weight: bold;}
   .market-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }

/* 테두리 */
.border-line{
	border : 2px solid #ffaa00; width : 1200px; 
	margin-top: 100px;
	margin-left:auto; margin-right:auto;
	border-radius: 30px;
}

/* 나눔선 */
.mid-line{
		border : 1px solid gray; width: 70%;
		margin-left:auto; margin-right:auto; margin-top: 20px; margin-bottom: 20px;}


/* 사진추가 */
.addpic{border: 1px solid #ffaa00; border-radius: 5px; background-color: white; height: 40px; color: #ffaa00;}
.addpic:hover{background-color: #ffaa00; color: white;}

/* SUBMIT, BACK 버튼 */
.l-mar{margin-left: 75px;}
.b-mar{margin-bottom: 50px;}
.btn-team{background-color: #ffaa00; color: white; border-radius: 10px; border: none; font-size: 20px;}


/*입력 폼 */
.info_input{padding-left:270px; margin-bottom: 15px;
}
.info_input2{padding-left:270px; margin-bottom: 15px;
}
.info{ display: block; box-sizing: border-box;  width: 690px;height: 40px; padding: 0 10px; border: 1px solid #e5e5e5; 
     border-radius: 12px; background-color: white; font-size: 15px; color: black; 
 } 
#content{height: 200px; width: 690px; resize: none;
}
.padding-t{padding-top: 4px;}

.plusattm{margin-left:270px; margin-bottom:10px;}
/*버튼*/
.button {
  width: 140px;
  height: 45px;
  font-family: 'Roboto', sans-serif;
  font-size: 15px;
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
  }

.button:hover {
  background-color: #ffaa00;
  box-shadow: 0px 15px 20px rgba(0, 0, 0, 0.1);
  color: #fff;
  transform: translateY(-7px);
}


</style>
</head>
<body>

	<!-- 탑 -->
	<%@ include file="../common/top.jsp" %>
	
	<!-- 테두리 -->
	<div class="border-line">
		<div class="py-5 text-center">
			<h2>상품 수정</h2>
		</div>
		
		<div class="mid-line"></div>
		<br><br>
			<form class="needs-validation" action="${contextPath}/updateMyProduct.market" encType="multipart/form-data" method="POST"  id="attmForm">
					<input type="hidden" name="productId" value="${ p.productNo }">  
					<div class="info_input">
						<label for="boardTitle" class="form-label">제목</label>
						<input type="text" id="title" class="info" name="productName" placeholder="제목을 입력해주세요." value="${ p.productName }">
					</div>
					<div class="info_input">
						<div style="display: inline-flex; width: 100%;">
							<input type="text" class="info" placeholder="금액 |" name="productPrice" style="width: 545px;" value="${ p.productPrice }">
						<select class="info" style="width: 125px; margin-left: 20px" name="productCategory">
						    <option value="category" ${p.productCategory eq 'category' ? 'selected' : ''}>카테고리</option>
						    <option value="예술" ${p.productCategory eq '예술' ? 'selected' : ''}>예술</option>
						    <option value="운동" ${p.productCategory eq '운동' ? 'selected' : ''}>운동</option>
						    <option value="음식" ${p.productCategory eq '음식' ? 'selected' : ''}>음식</option>
						    <option value="여행" ${p.productCategory eq '여행' ? 'selected' : ''}>여행</option>
						    <option value="창작" ${p.productCategory eq '창작' ? 'selected' : ''}>창작</option>
						    <option value="자기계발" ${p.productCategory eq '자기계발' ? 'selected' : ''}>자기계발</option>
						</select>
						</div>
					</div>
					<div class="info_input">
						<label class="form-label">내용</label>
						<textarea id="content" class="info" name="productContent" placeholder="내용을 입력해주세요." >${ p.productContent }</textarea>
					</div>
<!-- 					<button type="button" class="plusattm" id="addFile"> + 파일추가</button> -->
<!-- 					<div id="fileArea"> -->
<!-- 						<div class="info_input2"> -->
<!-- 							<input type="file" id="attm" class="info padding-t" name="file"> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<br><br><br>
					 <div style="text-align: center;">
						  <button class="button" style="top-margin:50px;" ><b>수정</b></button>
						  &nbsp;&nbsp;&nbsp;&nbsp;
						  <button class="button" style="top-margin:50px;" type="button" onclick="javascript:history.back();"><b>취소</b></button>
					</div>
					
 					<br><br><br>
			</form>
		</div>
	
	<!-- 푸터 -->
	<%@ include file="../common/footer.jsp" %>
	
	<script>

		
// 		window.onload = () =>{
// 				  const fileArea = document.querySelector('#fileArea');
// 				  const addFileButton = document.getElementById('addFile');
// 				  let fileCount = 1; // 현재 추가된 파일 입력란 개수
				
// 				  addFileButton.addEventListener('click', () => {
// 				    if (fileCount <= 2) { // 최대 3개까지 추가
// 				      const newDiv = document.createElement('div');
// 				      newDiv.classList.add('info_input2');
// 				      newDiv.innerHTML = '<input type="file" id="attm" class="info padding-t" name="file">';
				
// 				      fileArea.append(newDiv);
// 				      fileCount++; // 파일 입력란 개수 증가
// 				    }
// 				  });
			
			
			document.getElementById('submitAttm').addEventListener('click', () => {
				window.location.href='noticeSelect_Admin.jsp'
			})
			
			
			
			
		}
		
		
		
	
	</script>
</body>
</html>