<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404Error</title>
</head>
<body>
	<div align="center">
		<h2>
			죄송합니다. 
			<br>
			요청하신 페이지를 찾을 수 없습니다.
		</h2>
		<img src="${contextPath }/resources/gotrip-master/assets/img/main/error404.png" alt="404에러 이미지" height="900px" width="1500px">
		<div>
			<p>
				방문하시려는 페이지의 주소가 잘못 입력되었거나,
				<br>
				페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다. 
			</p>
			<p>
				입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.
			</p>
			<p>
				감사합니다.
			</p>
		</div>
		
	</div>
</body>
</html>