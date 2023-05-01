<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.memberId }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	$().ready(function(){
		$("#onePageViewCnt").val("${onePageViewCnt}");
		$("#searchKeyword").val("${searchKeyword}");
	});
	
	function getBoardList(){
		var url = "${contextPath}/contact/contactNotice"
			url += "?searchKeyword=" + $("#searchKeyword").val();
			url += "&searchWord=" + $("#searchWord").val();
			url += "&onePageViewCnt=" + $("#onePageViewCnt").val();
			
		location.href = url;
	}
	
</script>
</head>
<body>
    <section class="blog_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                        <div class="progress-table-wrap">
							<div class="progress-table">
								<div class="table-head" align="right">
									<div class="percentage">
										<select id="onePageViewCnt" onchange="getBoardList()">
											<option value="5">5개씩 보기</option>
											<option value="7">7개씩 보기</option>
											<option value="10">10개씩 보기</option>
										</select>
									</div>
								</div>
								<div class="table-head">
									<div class="serial">번호</div>
									<div class="percentage">제목</div>
									<div class="serial">작성자</div>
									<div class="visit">작성일</div>
									<div class="serial">조회수</div>
								</div>
								<c:choose>
									<c:when test="${empty boardList }">
										<tr align="center">
											<td colspan="4">게시글이 존재하지 않습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="BoardDTO" items="${boardList }" varStatus="i">
											<div class="table-row" align="center">
												<div class="serial">
													<c:set var="startBoardIdx" value="${startBoardIdx = startBoardIdx + 1 }" />
													${BoardDTO.boardId }
												</div>
												<div class="percentage">
													<h5><a href="${contextPath }/contact/contactDetail?boardId=${BoardDTO.boardId}">${BoardDTO.subject }</a></h5>
												</div>
												<div class="serial">
													${BoardDTO.memberId }
												</div>
												<div class="visit">
													<fmt:formatDate value="${BoardDTO.enrollDt }" pattern="yyyy-MM-dd" />
												</div>
												<div class="serial">
													<h4>${BoardDTO.readCnt }</h4>
												</div>
											</div>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
							<div align="left">
								<input type="button" onclick="location.href='${contextPath}/contact/addBoard'" class="genric-btn success radius" value="글쓰기">
							</div>
						</div>
                        <nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                            	<c:if test="${startPage > 10 }">
                            		<li class="page-item">
                            			<a href="${contextPath }/contact/contactNotice?currentPageNumber=${startPage - 10}&onePageViewCnt=${onePageViewCnt}&searchKeyword=${searchKeyword }&searchWord=${searchWord}" class="page-link" aria-label="Previous">
                            				<i class="ti-angle-left"></i>이전
                            			</a>
                            		</li>
                            	</c:if>
                            	<c:forEach var="i" begin="${startPage }" end="${endPage }">
                            		<li class="page-item">
                            			<a href="${contextPath }/contact/contactNotice?currentPageNumber=${i}&onePageViewCnt=${onePageViewCnt}&searchKeyword=${searchKeyword}&searchWord=${searchWord}" class="page-link">${i}</a>
                            		</li>
                            	</c:forEach>
                                <c:if test="${endPage != allPageCnt && endPage >= 10 }">
                                	<li class="page-item">
                                		<a href="${contextPath }/contact/contactNotice?currentPageNumber=${startPage + 10}&onePageViewCnt=${onePageViewCnt}&searchKeyword=${searchKeyword}&searchWord=${searchWord}" class="page-link" aria-label="Next">
                                			<i class="ti-angle-right"></i>다음
                                		</a>
                                	</li>
                                </c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<div class="form-group">
								<div class="default-select" id="default-select">
									<select id="searchKeyword">
										<option value="total">전체검색</option>
										<option value="memberId">작성자</option>
										<option value="subject">제목</option>
									</select>
								</div>
								<div class="input-group mb-3">
									<input type="text" class="form-control" placeholder='Search Keyword' id="searchWord">
                                </div>
							</div>
                            <input type="button" class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" value="검색" onclick="getBoardList()">
                        </aside>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>