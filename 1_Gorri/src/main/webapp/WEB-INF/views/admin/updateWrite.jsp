<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: dimgray; font-weight: bold;}
   #menu-market{color: dimgray; font-weight: bold;}
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
			<form class="needs-validation" action="${ contextPath }/insertBoard.hb" method="POST" encType="multipart/form-data" id="attmForm">
				<div class="row g-3">
					<div class="col-12">
						<label for="boardTitle" class="form-label">제목</label>
						<input type="text" class="form-control" id="boardTitle" name="boardTitle">
					</div>

					<div class="col-12">
						<label class="form-label">내용</label>
						<div class="input-group">
				        	<textarea class="form-control" rows="10" name="boardContent" style="resize: none;"></textarea>
				        </div>
					</div>
					
					<button type="button" class="w-25 addpic" id="addFile">+ 사진추가</button>
					<div id="fileArea">
						<div class="mb-3">
							<input type="file" class="form-control form-control-lg" name="file" accept="image/*">
						</div>
					</div>
					
					<br><br><br>
					
					<button class="w-25 btn-team d-inline-block l-mar b-mar" type="button" id="submitAttm">수정</button>
					<div class="d-inline-block w-25"></div>
					<button class="w-25 btn btn-dark btn-lg d-inline-block b-mar" type="button" onclick="javascript:history.back();">취소</button>
					
					<br><br><br>
				</div>
			</form>
		</div>
	</div>
	
	<!-- 푸터 -->
	<%@ include file="../common/footer.jsp" %>
</body>
<script>
	document.getElementById('submitAttm').addEventListener('click', () => {
		window.location.href = 'noticeSelect_Admin.jsp'
	})
</script>
</html>