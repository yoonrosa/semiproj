<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임 가입하기</title>
<style>
   #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: #ffaa00;; font-weight: bold;}
   #menu-market{color: dimgray; font-weight: bold;}
   .group-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }

.aligncenterhae{text-align:center;}
.paddingt20{padding-top:20px;}
.tdtwwo{width:800px; height:70px; font-size:20px; font-weight:bold; padding-left:100px; text-align: left;}
.tdtwwwoo{width:800px; height:70px; font-size:20px; font-weight:bold; padding-left:20px; text-align: left;}
.groupPic{width:200px; height:200px; background-color:lightgray; margin:auto;}
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
</style>

</head>

<body>
<%@include file = "../common/top.jsp" %>
<br><br><br>

<div class="aligncenterhae">
<h1>모임 가입하기</h1>
</div>
<br><br><br>

<div class="aligncenterhae" style="height:1400px; width:1000px; border:2px solid #ffab00; margin-left:auto; margin-right:auto; border-radius:2em; padding:90px; padding-top:120px; padding-bottom:50px;">

	<table>
		<tr>
			<td rowspan ="3" style="padding-left:50px;">
				<div class="groupPic" style="border-radius:2em;"> 
					<img src="${ contextPath }/resources/uploadFiles/${groupPic.renameName}"  style="width:250px; height:250px; border:5px solid #ffab00;">
<!-- 					<img src="resources/assets/marvel.jpg" style="width:250px; height:250px; border:5px solid #ffab00;"> -->
				</div>
			</td>
			<td class="tdtwwo paddingt20" style="font-size:25px;">
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-film" viewBox="0 0 16 16">
 						 <path d="M0 1a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v14a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V1zm4 0v6h8V1H4zm8 8H4v6h8V9zM1 1v2h2V1H1zm2 3H1v2h2V4zM1 7v2h2V7H1zm2 3H1v2h2v-2zm-2 3v2h2v-2H1zM15 1h-2v2h2V1zm-2 3v2h2V4h-2zm2 3h-2v2h2V7zm-2 3v2h2v-2h-2zm2 3h-2v2h2v-2z"/>
					</svg> ${groupInfo.category}
				</div>
			</td>
		</tr>
		<tr>
			<td class="tdtwwo paddingt20">${groupInfo.membershipName}</td>
		</tr>
		<tr>
			<td class="tdtwwo paddingt20" >
				<div>${groupInfo.membershipContent}</div>
				<div style="font-size:15px; font-weight:normal; padding-top:15px;">멤버 : <span>${groupInfo.capacity }명</span></div>
			</td>
		</tr>
	
	</table>
	
	<br><br><hr><br><br>
	
	<table>
		<tr>
			<td colspan="4" class="tdtwwwoo" style="height:70px; text-align:left;"> 개설자 정보</td>
		</tr>
		
		<tr style="text-align:left;">
			<td class="tdtwwwoo" style="height:50px; weight:10px; font-size:20px">이름</td>
			<td><input class="form-control me-2" aria-label="Search" placeholder="이름 입력" style="width:170px; border: 1px solid gray;"></td>
			<td class="tdtwwwoo" style="padding-left:8px; height:50px; weight:10px; font-size:20px">연락처</td>
			<td><input class="form-control me-2" aria-label="Search" placeholder="연락처 입력" style="width:170px; border: 1px solid gray;"></td>
		</tr>
	</table>
	
	<br><br>
	
	<table class="aligncenterhae" style="text-align:center; width:800px;" >
	
		<tr>
			<td class="tdtwwo" style="text-align:left; padding-left:20px;">신청하게 된 계기</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
					<textarea class="form-control" rows="10" name="boardContent" style="resize: none;"></textarea>
				</div>
			</td>
		</tr>
		<tr>
			<td class="tdtwwo" style="text-align: left;padding-left:20px;">모임에 대한 기대사항</td>
		</tr>
		<tr>
			<td>
				<div class="input-group">
					<textarea class="form-control" rows="10" name="boardContent" style="resize: none;"></textarea>
				</div>
			</td>
		</tr>		
	</table>
	
	<br><br><br><br>
	<button class="button" style="50px;"><b>가입하기</button>
	<button class="button" style="50px;"><b>취소하기</button>
	
</div>	

<br>
<%@include file = "../common/footer.jsp" %>
</body>
</html>