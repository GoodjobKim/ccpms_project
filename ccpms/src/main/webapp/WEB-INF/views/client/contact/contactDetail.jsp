<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
	
	<c:if test="${sessionScope.memberId != boardDTO.memberId && sessionScope.adminId == null}">
	    <script>
	        alert("비밀 게시글 입니다.");
	        location.href = "${contextPath}/contact/contactNotice";
	    </script>
	</c:if>
	

	<section class="blog_area single-post-area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="blog-author">
						<div class="media align-items-center">
							<div class="media-body">
								<h2>작성자 : &ensp; ${boardDTO.memberId }</h2>
							</div>
						</div>
					</div>
					<div class="single-post">
						<div class="blog_details">
							<h2>제목 : &ensp; ${boardDTO.subject }</h2>
							<hr>
							<p class="excert">${boardDTO.content }</p>
						</div>
					</div>
					<div align="right">
						<input type="button" value="문의사항 수정" class="genric-btn default-border" onclick="location.href='${contextPath}/contact/contactModify?boardId=${boardDTO.boardId }'">
						<input type="button" value="문의사항 삭제" class="genric-btn default-border" onclick="location.href='${contextPath}/contact/contactRemove?boardId=${boardDTO.boardId }'">
						<input type="button" class="genric-btn default-border" onclick="location.href='${contextPath}/contact/contactNotice'" value="목록보기">
					</div>
					<div class="comments-area">
						<h4>${allReplyCnt }Comment</h4>
						<div class="comment-list">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="desc">
										<c:choose>
											<c:when test="${empty replyList }">
												<p class="comment">
													등록된 댓글이 없습니다. 첫 댓글을 달아보세요!
												</p>
											</c:when>
											<c:otherwise>
												<c:forEach var="replyDTO" items="${replyList }" varStatus="i">
													<p class="comment">
														${replyDTO.content }
													</p>
													<div class="d-flex justify-content-between" align="right">
														<div class="d-flex align-items-center">
															<h5>
									                             ${replyDTO.adminId }
									                             ${replyDTO.memberId }
															</h5>
															<p class="date"><fmt:formatDate value="${replyDTO.enrollDt }" pattern="yyyy-MM-dd HH:mm:ss" /></p>
														</div>
														<div class="reply-btn">
															<c:choose>
																<c:when test="${sessionScope.role eq 'client' && replyDTO.adminId eq 'ccpmsadmin' }">
																	<a href="#" class="btn-reply text-uppercase">수정불가</a>
																</c:when>
																<c:otherwise>
																	<a href="${contextPath}/contact/replyModify?replyId=${replyDTO.replyId }" class="btn-reply text-uppercase">수정</a>
																</c:otherwise>
															</c:choose>
														</div>
														<div class="reply-btn">
															<c:choose>
																<c:when test="${sessionScope.role eq 'client' && replyDTO.adminId eq 'ccpmsadmin' }">
																	<a href="#" class="btn-reply text-uppercase">삭제불가</a>
																</c:when>
																<c:otherwise>
																	<a href="${contextPath}/contact/replyRemove?replyId=${replyDTO.replyId }" class="btn-reply text-uppercase">삭제</a>
																</c:otherwise>
															</c:choose>
														</div>
													</div>
													<br>
												</c:forEach>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="comment-form">
						<h4>댓글작성</h4>
						<form class="form-contact comment_form" action="${contextPath }/contact/addReply" method="post">
							<input type="hidden" name="boardId" value="${boardDTO.boardId }">
							<div class="row">
								<div class="col-sm-6">
									<div class="form-group">
										<c:choose>
			                                <c:when test="${sessionScope.role eq 'admin' }">
			                                	<input class="form-control" name="adminId" id="adminId" type="text" value="${adminId }">
			                               	</c:when>
			                               	<c:otherwise>
			                               		<input class="form-control" name="memberId" id="memberId" type="text" value="${memberId }">
			                               	</c:otherwise>
		                               	</c:choose>
									</div>
								</div>
								<div class="col-12">
									<div class="form-group">
										<textarea class="form-control w-100" name="content" id="content" cols="30" rows="9" placeholder="Write Comment"></textarea>
									</div>
								</div>
							</div>
							<div class="form-group">
								<button type="submit" class="button button-contactForm btn_1 boxed-btn">댓글 등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>