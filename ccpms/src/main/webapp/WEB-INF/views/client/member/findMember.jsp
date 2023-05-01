<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
        <!-- Support Company Start-->
        <div class="support-company-area servic-padding fix">
            <div class="container">
                <form action="${contextPath }/member/login" method="get">
                	<div>
                		<h5>아이디 찾기</h5>
							<div class="mt-10">
								<p>아이디 <span>*</span></p>
								<input type="text" id="memberId" name="memberId" value="${memberDTO.memberId }"  readonly class="single-input">
							</div>	<br>
							
							<div align="right">
								<input type="submit" class="genric-btn success radius" value="로그인하기">
							</div>
							
					</div>
				</form>
            </div>
        </div>
        <!-- Support Company End-->

</body>
</html>