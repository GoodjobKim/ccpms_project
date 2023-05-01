<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500Error</title>
</head>
<body>
	<div align="center">
		<h2>
			죄송합니다. 
			<br>
			요청하신 작업을 수행하지 못했습니다.
		</h2>
		<img src="${contextPath }/resources/gotrip-master/assets/img/main/500.png" alt="500에러 이미지" height="900px" width="1500px">
		
		<div>
			<p>
				일시적인 현상일 수 있으니 잠시 후 다시 시도해 주세요.
				<br>
				(오류코드 : -500) 
			</p>
			<p>
				감사합니다.
			</p>
		</div>
		
	</div>
</body>
</html>