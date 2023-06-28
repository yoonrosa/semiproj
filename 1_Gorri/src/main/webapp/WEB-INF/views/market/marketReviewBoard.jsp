<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품${ p.productName }의 리뷰 게시판</title>
<style>
/* 	td:hover{cursor: pointer;} */
</style>
</head>
<body>

	<%@include file = "../common/top.jsp" %>
	
	<div class="container py-4">
		<div class="bd-example-snippet bd-code-snippet">
			<div class="p-5 mb-4 bg-light rounded-3">
				<div class="container-fluid py-5">
					<h1 class="display-5 fw-bold">상품${ p.productName }의 리뷰 게시판</h1>
				</div>
			</div>
			<div class="bd-example">
				<table class="table table-hover">
					<thead>
						<tr>
							<th width="80px">글 번호</th>
							<th>내용</th>
							<th width="130px">작성자</th>
							<th width="130px">작성일자</th>
	          			</tr>
	          		</thead>
	         		<tbody> 
	          			<c:forEach items="${ list }" var="b">
	          				<tr>
	          					<td>${ b.reviewNo }</td>
	          					<td>${ b.reviewContent }</td>
	          					<td>${ b.buyerId }</td>
	          					<td>${ b.reviewPostDate }</td>
	          				</tr>
	          			</c:forEach>
	          		</tbody>
	        	</table>
	       	</div>
		</div>
		</div>
	<%@include file = "marketFooter.jsp" %>
	
	
</body>
</html>