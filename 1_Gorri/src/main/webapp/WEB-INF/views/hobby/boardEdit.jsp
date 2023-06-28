<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

/* 테두리 */
.border-line{
	border : 2px solid #ffaa00; width : 1200px; 
	margin-top: 100px;
	margin-left:auto; margin-right:auto;
	border-radius: 30px;
}

/* 나눔선 */
.mid-line{
		border : 1px solid gray; width: 90%;
		margin-left:auto; margin-right:auto; margin-top: 20px; margin-bottom: 20px;}


/* 사진추가 */
.addpic{border: 1px solid #ffaa00; border-radius: 5px; background-color: white; height: 40px; color: #ffaa00;}
.addpic:hover{background-color: #ffaa00; color: white;}

/* SUBMIT, BACK 버튼 */
.l-mar{margin-left: 75px;}
.b-mar{margin-bottom: 50px;}
.btn-team{background-color: #ffaa00; color: white; border-radius: 10px; border: none; font-size: 20px;}

.board-line:{border: 1px solid black;}

/* 사진 삭제 */
.spacebar{margin-left: 20px;}
.droptable{padding-top: 5px; padding-bottom: 10px;}
.drop{width: 100px; height: 35px; border-radius: 5px; border: none; background-color: #ffaa00; color: white;}

/*게시글 수정 폰트*/
@font-face {
    font-family: 'omyu_pretty';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
}

h2{
	font-family: 'omyu_pretty';
		font-size: 27px;
}

omyu{
	font-family: 'omyu_pretty';
		font-size: 27px;
}

</style>
</head>
<body>

	<!-- 탑 -->
	<%@ include file="../common/top.jsp" %>
	
	<!-- 테두리 -->
	<div class="border-line">
	
		<!-- 게시글 수정 -->
		<div class="py-5 text-center">
			<h2>게시글 수정</h2>
		</div>
		
		<div class="mid-line"></div>
		<!-- 본문 -->
		<div style="margin-left: 300px; margin-right: 300px;">
			<form class="needs-validation" action="${ contextPath }/boardUpdate.hb" method="POST" encType="multipart/form-data" id="attmForm">
				<input type="hidden" name="boardNo" value="${ b.boardNo }">
				<input type="hidden" name="usersId" value="${ b.usersId }">
				<input type="hidden" name="page" value="${ page }">
				<div class="row g-3">
					<div class="col-12">
						<label for="boardTitle" class="form-label">제목</label>
						<input type="text" class="form-control" id="boardTitle" name="boardTitle" maxlength="10" value="${ b.boardTitle }">
					</div>
					
					<div class="col-12" style="border: 1px solid lightgray; border-radius: 5px; width: 250px; margin-left: 8px; padding-top: 10px;">
						<label class="form-label">카테고리 : </label>
						<select id="category" name="category">
							<option value="예술" ${ b.category eq '예술' ? 'selected' : 'unselected' }>예술</option>
							<option value="운동" ${ b.category eq '운동' ? 'selected' : 'unselected' }>운동</option>
							<option value="음식" ${ b.category eq '음식' ? 'selected' : 'unselected' }>음식</option>
							<option value="여행" ${ b.category eq '여행' ? 'selected' : 'unselected' }>여행</option>
							<option value="창작" ${ b.category eq '창작' ? 'selected' : 'unselected' }>창작</option>
							<option value="자기계발" ${ b.category eq '자기계발' ? 'selected' : 'unselected' }>자기계발</option>
						</select>
					</div>
					
					<div style="width: 96px;"></div>
					
					<div class="col-12" style="border: 1px solid lightgray; border-radius: 5px; width: 250px; margin-right: 0%; padding-top: 10px;">
						<label class="form-label">공개여부 : </label>
						<label class="form-label">공개</label><input type="radio" name="isPublic" value="Y" id="Y" ${ b.isPublic == 'Y' ? 'checked' : 'unchecked' }>
						<label class="form-label">비공개</label><input type="radio" name="isPublic" value="N" id="N" ${ b.isPublic == 'N' ? 'checked' : 'unchecked' }>
					</div>
					
					<div class="col-12 ">
						<label class="form-label">내용</label>
						<div class="input-group">
				        	<textarea class="form-control" rows="10" name="boardContent" style="resize: none;">${b.boardContent }</textarea>
				        </div>
					</div>
					
					<br><br>
					
					<!-- 사진 삭제 -->
					<div>
						<c:forEach items="${ list }" var="a">
							<img src="${ contextPath }/resources/uploadFiles/${a.renameName }" style="width: 400px; height: 150px;" class="d-block">
							<div class="droptable">
								<span class="d-inline-block spacebar">${ a.originalName }</span>
								<div class="d-inline-block" style="width: 20px;"></div>
								<button type="button" class="drop d-inline-block deleteAttm" id="delete-${ a.renameName }/${ a.attmLevel }">삭제하기</button>
								<input type="hidden" name="deleteAttm" value="none" class="pic">
							</div>
						</c:forEach>
					</div>
					
					<!-- 사진 추가 -->
					<button type="button" class="w-25 addpic omyu" id="addFile" style="margin-left: 7px;">+ 사진추가</button>
					<div id="fileArea">
						<div class="mb-3">
							<input type="file" class="form-control form-control-lg files" name="file" accept="image/*">
						</div>
					</div>
					
					<br><br><br>
					
					<button class="w-25 btn-team d-inline-block l-mar b-mar omyu" type="button" id="submitAttm" onclick="upload()">수정</button>
					<div class="d-inline-block w-25"></div>
					<button class="w-25 btn btn-dark btn-lg d-inline-block b-mar omyu" type="button" onclick="javascript:history.back();">취소</button>
					
					<br><br><br>
				</div>
			</form>
		</div>
	</div>
	
	<script>
		window.onload = () =>{
			const fileArea = document.querySelector("#fileArea");
			document.getElementById('addFile').addEventListener('click', ()=>{
				const newDiv = document.createElement('div');
				newDiv.classList.add("mb-3");
				newDiv.innerHTML = '<input type="file" class="form-control form-control-lg" name="file" accept="image/*">';
				
				fileArea.append(newDiv);
			})
			
			const btns = document.getElementsByClassName('deleteAttm');
			for(const btn of btns){
				btn.addEventListener('click', function(){
					const next = this.nextElementSibling;
					if(btn.innerText == "삭제하기"){
						btn.style.background = "black";
						btn.innerText = "삭제취소";
						next.value = btn.id.split('-')[1];
						
						console.log(next);
					} else if(btn.innerText == "삭제취소"){
						btn.style.background = '#ffaa00';
						btn.innerText = "삭제하기";
						next.value = 'none';
						
						console.log(next);
					}
				})
			}
		}
		
		function upload(){
			const fileArr = document.getElementsByClassName("files");
			const form = document.getElementById('attmForm');
			const pics = document.getElementsByClassName('pic');
			var allTrue = false;
			for(const i in pics){
				if(pics[i].value == "none"){
					allTrue = true;
					break;
				}
			}
			
			for(const ff of fileArr){
				const fa = ff.files[0];
				if(!fa && !allTrue){
					alert('이미지를 첨부해주세요.');
				} else {
					document.getElementById('submitAttm').addEventListener('click', function(){
						form.submit();
					})
				}
			}
		}
	</script>
	
	<!-- 푸터 -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>