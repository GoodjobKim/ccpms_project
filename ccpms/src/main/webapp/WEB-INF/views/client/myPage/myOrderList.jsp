<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul{
		list-style: none;
		margin : 0;
		padding : 0;
	}
	
	li{
		margin : 0 0 0 0;
		padding : 0 0 0 0;
		boeder : 0;
		float : left;
	
	}
</style>
<script>
	
	function getOrdercheck(){
		
		var orderCheckList = "";
		if(confirm("정말로 삭제하겠습니까?")){
			$("[name='orderCheck']:checked").each(function(){
				orderCheckList += $(this).val() + ',';
			})
			location.href='${contextPath}/myPage/myOrderRemove?orderCheckList='+orderCheckList;
		}
	}
	
</script>
</head>
<body>
	<c:if test="${sessionScope.memberId eq null}">
		<script>
			alert("로그인을 먼저 진행해주세요.");
			location.href = "${contextPath}/member/login";
		</script>
	</c:if>

	<div class="section-top-border">
	<h3 class="mb-40" align="center">나의 주문목록</h3>
		<div class="progress-table-wrap">
			<div class="progress-table">
				<div class="table-head">
					<div class="serial">#</div>
					<div class="percentage">상품명</div>
					<div class="serial">상품가격</div>
					<div class="visit">주문날짜</div>
					<div class="serial">배송상태</div>
				</div>
				<c:choose>
					<c:when test="${empty myOrderList }">
						<tr align="center">
							<td colspan="4">주문내역이 존재하지 않습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="myOrderDTO" items="${myOrderList }" varStatus="i">
							<div class="table-row" align="center">
								<div class="serial">
									<div class="confirm-checkbox">
										<input type="checkbox" id="confirm-checkbox${i.count }" name="orderCheck" value="${myOrderDTO.orderCd }" checked> 
										<label for="confirm-checkbox${i.count }"></label>
									</div>
								</div>
								<div class="percentage">
									<div class="col-md-4">
										<img src="${contextPath }/thumbnails?goodsFileName=${myOrderDTO.goodsFileName }" width="150" height="200">
										<h4> <a href="${contextPath }/goods/goodsDetail?goodsCd=${myOrderDTO.goodsCd}">${myOrderDTO.goodsNm }</a> | ${myOrderDTO.orderGoodsQty }개</h4>
									</div>
								</div>
								<div class="serial">
									<fmt:formatNumber value="${myOrderDTO.price }" />원
								</div>
								<div class="visit">
									<fmt:formatDate value="${myOrderDTO.payOrderTime }" pattern="yyyy-MM-dd" />
								</div>
								<div class="serial">
									<h4>${myOrderDTO.deliveryStatus }</h4>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div align="center">
				<input type="button" onclick="getOrdercheck()" class="genric-btn success radius" value="주문취소">
			</div>
		</div>
	</div>
</body>
</html>