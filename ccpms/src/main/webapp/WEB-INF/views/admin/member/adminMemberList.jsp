<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- slider Area Start-->
    <div class="slider-area ">
        <!-- Mobile Menu -->
        <div class="single-slider slider-height2 d-flex align-items-center" data-background="${contextPath }/resources/gotrip-master/assets/img/main/loginbanner.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>User List</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- slider Area End-->
	<div class="section-top-border">
		<h3 class="mb-40">회원목록</h3>
		<div class="progress-table-wrap">
			<div class="progress-table">
				<div class="table-head">
					<div class="serial">번호</div>
					<div class="country">회원아이디</div>
					<div class="visit">회원이름</div>
					<div class="visit">성별</div>
					<div class="visit">생년월일</div>
					<div class="visit">연락처</div>
					<div class="visit">이메일</div>
					<div class="country">집주소</div>
					<div class="visit">보유포인트</div>
					<div class="visit">가입일자</div>
				</div>
				<c:choose>
					<c:when test="${empty memberList }">
						<tr align="center">
							<td colspan="6">가입된 회원이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="memberDTO" items="${memberList }" varStatus="i">
							<div class="table-row">
								<div class="serial">${i.count }</div>
								<div class="country">${memberDTO.memberId }</div>
								<div class="visit">${memberDTO.memberNm }</div>
								<div class="visit">${memberDTO.sex }</div>
								<div class="visit">${memberDTO.dateBirth }</div>
								<div class="visit">${memberDTO.hp }</div>
								<div class="visit">${memberDTO.email }</div>
								<div class="country">${memberDTO.roadAddress }</div>
								<div class="visit">${memberDTO.point }P</div>
								<div class="visit">
									<fmt:formatDate value="${memberDTO.joinDt }"
										pattern="yyyy-MM-dd" />
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>