<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- ================ contact section start ================= -->
	<section class="contact-section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2 class="contact-title">게시글 삭제</h2>
				</div>
				<div class="col-lg-8">
					<form action="${contextPath }/contact/contactRemove" method="post" class="form-contact contact_form" >
						<input type="hidden" name="boardId" value="${boardDTO.boardId }">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<p>작성자 <span>*</span></p>
									<input class="form-control valid" name="memberId" id="memberId" type="text" value="${boardDTO.memberId }" readonly>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<p>작성일 <span>*</span></p>
									<fmt:formatDate value="${boardDTO.enrollDt }" pattern="yyyy-MM-dd"/>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<p>제목</p>
									<input class="form-control valid" name="subject" id="subject" type="text" value="${boardDTO.subject }" readonly>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<p>비밀번호 <span>*</span></p>
									<c:choose>
										<c:when test="${sessionScope.role eq 'admin'}">
										
										</c:when>
										<c:otherwise>
											<input class="form-control valid" name="passwd" id="passwd" type="password">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="form-group mt-3" align="right">
							<button type="submit" class="button button-contactForm boxed-btn">삭제하기</button>
						</div>
						<div class="form-group mt-3" align="left">
							<input type="button" class="genric-btn default-border" onclick="location.href='${contextPath}/contact/contactNotice'" value="목록보기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ contact section end ================= -->
</body>
</html>