<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script>
	$().ready(function(){
		getTotalPrice();
		
		$("[name='cartCheck']").change(function(){
			getTotalPrice();
		});
	});
	
	function getTotalPrice() {
		var totalPrice = 0;
		$("[name='cartCheck']:checked").each(function(){
			var tempCartCheck = $(this).val();
			totalPrice += Number($("#price" + tempCartCheck).val()) * Number($("#cartGoodsQty" + tempCartCheck).val());
		});
		totalPrice = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원";
		$("#totalPrice").html(totalPrice);
	}
	
	function removeCart(){
		var cartCdList = "";
		if(confirm("정말로 삭제하시겠습니까?")){
			$("[name='cartCheck']:checked").each(function(){
				cartCdList += $(this).val() + ',';
			});
			location.href="${contextPath}/myPage/removeCart?cartCdList="+cartCdList;
		}
	}

	function selectAllCart(){
		if($("#selectAll").prop("checked")){
			$("[name='cartCheck']").prop("checked", true);
		}
		else{
			$("[name='cartCheck']").prop("checked", false);
		}
		getTotalPrice();
	}
	
	function getCartcheck(){				//주문
		
		var goodsCdList = "";
		var cartGoodsQtyList = "";
		var cartCdList = "";
		
		$("[name='cartCheck']:checked").each(function(){
			var cartCd = $(this).val();
			var goodsCd = $("#goodsCd" + cartCd).val();
			var cartGoodsQty = $("#cartGoodsQty" + cartCd).val();
			
			goodsCdList += goodsCd + ",";
			cartGoodsQtyList += cartGoodsQty + ",";
			cartCdList += cartCd + ",";
		});
		
		if(goodsCdList == ""){
			alert("주문목록이 선택되지 않았습니다.");
			return false;
		}
		
		var url = "${contextPath}/order/orderCartGoods";
			url += "?goodsCdList=" + goodsCdList;
			url += "&cartGoodsQtyList=" + cartGoodsQtyList;
			url += "&cartCdList=" + cartCdList;
			
		location.href = url;
	}
	
	
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${sessionScope.memberId eq null}">
		<script>
			alert("로그인을 먼저 진행해주세요.");
			location.href = "${contextPath}/member/login";
		</script>
	</c:if>

	<div class="section-top-border">
	<h3 class="mb-40">나의 장바구니</h3>
		<div class="progress-table-wrap">
			<div class="progress-table">
				<h6 align="left"><input type="checkbox" id="selectAll" onchange="selectAllCart()"> &ensp;전체선택</h6>	<br>
				<div class="table-head">
					<div class="serial">#</div>
					<div class="percentage">상품명</div>
					<div class="serial">상품가격</div>
					<div class="visit">주문수량</div>
					<div class="serial">등록일자</div>	
				</div>
				<c:choose>
					<c:when test="${empty myCartList }">
						<tr align="center">
							<td colspan="4">장바구니에 상품이 존재하지 않습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="myCartDTO" items="${myCartList }" varStatus="i">
							<div class="table-row" align="center">
								<div class="serial">
									<div class="confirm-checkbox">
										<input type="checkbox" id="confirm-checkbox${i.count }" name="cartCheck" value="${myCartDTO.cartCd }"> 
										<label for="confirm-checkbox${i.count }"></label>
									</div>
								</div>
								<div class="percentage">
									<div class="col-md-4">
										<img src="${contextPath }/thumbnails?goodsFileName=${myCartDTO.goodsFileName }" width="150" height="200">
										<h4> <a href="${contextPath }/goods/goodsDetail?goodsCd=${myCartDTO.goodsCd}">${myCartDTO.goodsNm }</a></h4>
										<input type="hidden" id="goodsCd${myCartDTO.cartCd }" value="${myCartDTO.goodsCd }">
									</div>
								</div>
								<div class="serial">
									<span style="text-decoration: line-through; color: gray;"><fmt:formatNumber value="${myCartDTO.price }" /></span> <br>
									<fmt:formatNumber value="${myCartDTO.price - myCartDTO.price * (myCartDTO.discountRate / 100) }" />원
									<input type="hidden" id="price${myCartDTO.cartCd }" value="${myCartDTO.price - myCartDTO.price * (myCartDTO.discountRate / 100) }">
								</div>
								<div class="visit">
									${myCartDTO.cartGoodsQty }개
									<input type="hidden" id="cartGoodsQty${myCartDTO.cartCd }" value="${myCartDTO.cartGoodsQty }">
								</div>
								<div class="serial">
									<fmt:formatDate value="${myCartDTO.enrollDt }" pattern="yyyy-MM-dd" />
								</div>
								
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div align="left">
				<h3>Cart total</h3>
				<ul>
					<li>Total <span id="totalPrice"></span></li>
				</ul>
			</div>
			<div align="center">
				<input type="button" onclick="getCartcheck()" class="genric-btn success radius" value="주문하기">
				<input type="button" onclick="removeCart()" class="genric-btn success radius" value="선택공연 삭제">
			</div>
		</div>
	</div>
</body>
</html>