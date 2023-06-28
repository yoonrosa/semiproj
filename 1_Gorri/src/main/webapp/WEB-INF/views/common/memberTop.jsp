<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
	<div class="div">
		<a href="${ contextPath }/main.do">
			<img src="resources/assets/gorriLogo.png" class="card-title text-center" style="width:440px; height:280px;">
		</a>
	</div>
</body>
</html>