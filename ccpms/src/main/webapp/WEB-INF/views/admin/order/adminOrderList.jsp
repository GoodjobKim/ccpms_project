<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="section-top-border">
	<h3 class="mb-40">관리자 주문목록</h3>
		<div class="progress-table-wrap">
				<div class="progress-table">
					<div class="table-head">
						<div class="percentage">주문정보</div>
						<div class="serial">주문자</div>
						<div class="visit">주문날짜</div>
						<div class="serial">배송상태</div>
					</div>
					<c:choose>
						<c:when test="${empty orderList }">
							<tr align="center">
								<td colspan="4">주문내역이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="orderDTO" items="${orderList }">
								<div class="table-row" align="center">
									<div class="percentage">
										<div class="col-md-4">
											<img src="${contextPath }/thumbnails?goodsFileName=${orderDTO.goodsFileName }" width="150" height="200" >
											<div>
												<h4><a href="${contextPath }/goods/goodsDetail?goodsCd=${orderDTO.goodsCd}">${orderDTO.goodsNm }</a></h4>
												<p><fmt:formatNumber value="${orderDTO.price }"/>원 | 주문수량 : ${orderDTO.orderGoodsQty }개</p>
											</div>
										</div>
									</div>
									<div class="serial">${orderDTO.memberId }</div>
									<div class="visit">
										<fmt:formatDate value="${orderDTO.payOrderTime }" pattern="yyyy-MM-dd" />
									</div>
									<div class="serial">
										<h4>${orderDTO.deliveryStatus }</h4>
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