<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	    @font-face {
	    font-family: 'omyu_pretty';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
	}
	
	h2{
		font-family: 'omyu_pretty';
			font-size: 27px;
	}
	
   #menu-minihome{color: dimgray; font-weight: bold;}
   #menu-hobby{color: dimgray; font-weight: bold;}
   #menu-group{color: dimgray; font-weight: bold;}
   #menu-market{color: #ffaa00; font-weight: bold;}
   .market-border-bottom{border-bottom: 4px solid #ffaa00;}
   #menu-market:hover, #menu-group:hover, #menu-hobby:hover, #menu-minihome:hover{color: rgba(250, 170, 0, 0.8); }
	
</style>
</head>
<body class="bg-light">
	<%@include file = "../common/top.jsp" %>
	<div class="container">
		<main>
			<div class="py-5 text-center">
				<h2>문의 게시판</h2>
			</div>
			<tr>
				<td>작성자 : ${ i.buyerId } 작성일자 : ${ i.inquirePostDate }</td>
				<br><br>
				<td>문의내용:</td>
				<td>${ i.inquireContent }</td>	
			</tr>
			<form action="${ contextPath }/ReplySubmit.market?productNo=${i.productNo}&inquireNo=${ i.inquireNo }" method="post">
			  <br><div class="input-group mb-3">
			    <input type="text" name="comment" class="form-control" placeholder="comment here" aria-label="comment here" aria-describedby="button-addon2">
			    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Submit</button>
			  </div>
			</form>
	<br>
			<div>
				<table style="width:1500px">
					<tr class="top">
						<th class="no">번호</th>
						<th class="writer">작성자</th>
						<th class="title">댓글내용</th>
						<th class="date">작성일자</th>
					</tr>
					
					<c:forEach items="${ irList }" var="l">
					<tr>
						<td>${ l.replyNo }</td>
						<td>${ l.replyWriter }</td>
						<td>${ l.replyContent }</td>
						<td>${ l.replyCreateDate }</td>
					</tr>
					</c:forEach>			
					
				</table>
			</div>
		</main>

		<footer class="my-5 pt-5 text-muted text-center text-small"></footer>
	</div>
</body>
</html>