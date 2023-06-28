<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<!-- 탑 -->
	<%@ include file="../common/top.jsp" %>
	
	<!-- 테두리 -->
	<div class="border-line">
		<div class="py-5 text-center">
			<h2>게시글 수정</h2>
		</div>
		
		<div class="mid-line"></div>
		
		<div style="margin-left: 300px; margin-right: 300px;">
			<form class="needs-validation" action="${ contextPath }/updateGroupBoard.gr" method="POST" encType="multipart/form-data" id="attmForm">
				<input type="hidden" name="groupNo" value="${bList.groupNo }">
				<input type="hidden" name="boardNo" value="${ bList.boardNo }">
				<input type="hidden" name="page" value="${ page }">
				<input type="hidden" name="originFile" value="${contextPath }/resources/uploadFiles/${gAttm.renameName}">
				<div class="row g-3">
					<div class="col-12">
						<label for="boardTitle" class="form-label" >제목</label>
						<input type="text" class="form-control" id="boardTitle" name="title" value="${bList.title}">
					</div>

					<div class="col-12">
						<label class="form-label">내용</label>
						<div class="input-group">
				        	<textarea class="form-control" rows="10" name="content" style="resize: none;" >${bList.content}</textarea>
				        </div>
					</div>
					
					<!-- 기존 사진  -->
					<br><br><br>
					<div id="delFile">
						<h5>
							<a href="${contextPath }/resources/uploadFiles/${gAttm.renameName}" style="color:blue;"id="origin" download="${ gAttm.originalName}">${gAttm.originalName }</a>
							<input type="hidden" name="originFile" value="none" id="delBoardFile">
							
<%-- 							<c:if test="${ !empty gAttm }"> --%>
								<button type="button" id="delAttm" >삭제</button>
<%-- 							</c:if>	 --%>
						</h5>
						
					</div>
					
					<div id="fileArea">
						<div class="mb-3">
						<!-- 수정 시 새로운 파일 추가 -->
							<input type="file" id="inputFile" class="form-control form-control-lg" name="file" accept="image/*">
						</div>
					</div>
					
					<br><br><br>
					
					<button class="w-25 btn-team d-inline-block l-mar b-mar" >작성</button>
					<div class="d-inline-block w-25"></div>
					<button class="w-25 btn btn-dark btn-lg d-inline-block b-mar" type="button" onclick="javascript:history.back();">취소</button>
					
					<br><br><br>
				</div>
			</form>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@ include file="../common/footer.jsp" %>
	
	<script>
	
	//사진이 없을 때 삭제 버튼 없앰 
	const delAttmButton = document.getElementById('delAttm');
	const originalName = '${gAttm.originalName}';
	if (!originalName) {
	  delAttmButton.style.display = 'none'; // 삭제 버튼 숨기기
	}

	//기존 파일이 있다면 파일 추가 막음 
		const origin = document.getElementById('origin');
		const inputFile = document.getElementById('inputFile');
		
		
		inputFile.addEventListener('click', function(event) {
			const val = document.getElementById('delBoardFile').value
			console.log(val)
			if(!(val.equals("none"))){
				console.log(1234);
				event.preventDefault(); // 입력 막기
			    alert('기존 파일을 삭제해주세요.');
			}
			
		});
		
		
		//삭제 버튼 클릭 시 파일명/삭제 사라지기 
		document.getElementById('delAttm').addEventListener('click', function() {
			document.getElementById('delBoardFile').value='${gAttm.renameName}'
			document.getElementById('delFile').style.display = 'none';
			console.log(document.getElementById('delBoardFile').value);
		})
		
	</script>
</body>
</html>