<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){
		var orderGoodsQtyList = "${orderGoodsQtyList}".split(",");
		
		var viewPaymentAmt = 0;
		var paymentAmtList = 0;
		var totalDeliveryPrice = 0;
		var totalPoint = 0;
		for (var i = 0; i < orderGoodsQtyList.length -1; i++) {
			$("#qty"+i).text(orderGoodsQtyList[i] + "개");
			$("#orderGoodsQty"+i).val(orderGoodsQtyList[i]);
			
			var price = Number($("#price"+i).val());
			var discountRate = Number($("#discountRate"+i).val());
			var orderGoodsQty = Number($("#orderGoodsQty"+i).val());
			var deliveryPrice = Number($("#deliveryPrice"+i).val());
			
			viewPaymentAmt += (price - parseInt(price * (discountRate / 100))) * orderGoodsQty + deliveryPrice;
			
			paymentAmtList += (price - parseInt(price * (discountRate / 100))) * orderGoodsQty + deliveryPrice;
			paymentAmtList += ",";
			
			totalDeliveryPrice += deliveryPrice;
			totalPoint += Number($("#point"+i).val() * Number($("#orderGoodsQty"+i).val()));
		}
		
		$("#totalDeliveryPrice").html(totalDeliveryPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원");
		$("#totalPoint").html(totalPoint.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "P 적립");
		$("#viewPaymentAmt").html(viewPaymentAmt.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + " 원");
		$("[name='paymentAmtList']").val(paymentAmtList);
		$("[name='totalPoint']").val(totalPoint);
	})

	function setPayMethod(){
		var method = $("[name='payMethod']").val();
		if(method == 'card'){
			$("#cardCompanyNm, #cardPayMonth").show();
			$("#payOrdererHp").hide();
		}
		else{
			$("#cardCompanyNm, #cardPayMonth").hide();
			$("#payOrdererHp").show();
			$("[name='payOrdererHp']").val("${orderer.hp}");
		}
	}
</script>
</head>
<body>
	<!-- ================ contact section start ================= -->
	<section class="contact-section">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<h2 class="contact-title">주문상세</h2>
				</div>
				<div class="col-lg-8">
					<form action="${contextPath }/order/orderCartGoods" method="post" class="form-contact contact_form" >
						<input type="hidden" name="goodsCdList" value="${goodsCdList }">
		                <input type="hidden" name="orderGoodsQtyList" value="${orderGoodsQtyList}">	
           				<input type="hidden" name="totalPoint" value="${totalPoint }">
		                <input type="hidden" name="paymentAmtList">
		                <input type="hidden" name="memberId" value="${orderer.memberId}">
              			<input type="hidden" name="cartCdList" value="${cartCdList}">		
		                
						<c:set var="paymentAmt" value="${(goodsDTO.price - (goodsDTO.price * goodsDTO.discountRate / 100)) * orderGoodsQty + goodsDTO.deliveryPrice}"/>
		                <input type="hidden" name="paymentAmt" value='<fmt:parseNumber integerOnly="true" value="${paymentAmt }"/>'/>
		                
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<p>주문자 성함</p>
									<input class="form-control valid" name="ordererNm" id="ordererNm" type="text"
										onblur="this.placeholder = '주문자 성함을 입력하세요.'" placeholder="주문자 성함을 입력하세요." value="${orderer.memberNm }" required>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<p>주문자 연락처</p>
									<input class="form-control valid" name="ordererHp" id="ordererHp" type="text"
										onblur="this.placeholder = '주문자 연락처를 입력하세요.'" placeholder="주문자 연락처 번호를 입력하세요." value="${orderer.hp }" required>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<p>받는분 이름</p>
									<input class="form-control valid" name="receiverNm" id="receiverNm" type="text"
										onblur="this.placeholder = '받으실 분 이름을 입력하세요.'" placeholder="받으실 분 이름을 입력하세요." value="${orderer.memberNm }" required>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<p>받는분 연락처</p>
									<input class="form-control valid" name="receiverHp" id="receiverHp" type="text"
										onblur="this.placeholder = '받으실 분 연락처를 입력하세요.'" placeholder="받으실 분 연락처를 입력하세요." value="${orderer.hp }" required>
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<p>결제방법</p>
									<div class="form-select" id="payMethod">
										<select name="payMethod" onchange="setPayMethod()">
											<option value="card" >카드결제</option>
                                    		<option value="phone">휴대폰결제</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<p>배송방법</p>
									<div class="form-select" id="deliveryMethod">
										<select name="deliveryMethod">
											<option value="일반">일반택배</option>
											<option value="편의점">편의점택배</option>
											<option value="해외">해외배송</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group" id="cardCompanyNm">
									<p>카드회사</p>
									<div class="form-select" >
										<select name="cardCompanyNm">
											<option value="삼성">삼성</option>
											<option value="하나SK">하나SK</option>
											<option value="현대">현대</option>
											<option value="KB">KB</option>
											<option value="신한">신한</option>
											<option value="롯데">롯데</option>
											<option value="BC">BC</option>
											<option value="시티">시티</option>
											<option value="NH농협">NH농협</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group"  id="cardPayMonth">
									<p>할부개월</p>
									<div class="form-select">
										<select name="cardPayMonth">
											<option value="0">일시불</option>                                    
											<option value="1">1개월</option>                                    
											<option value="2">2개월</option>                                    
											<option value="3">3개월</option>                                    
											<option value="4">4개월</option>                                    
											<option value="5">5개월</option>                                    
											<option value="6">6개월</option>      
										</select>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group" id="payOrdererHp" style="display: none">
									<p>결제 핸드폰번호</p>
									<input class="form-control valid" name="payOrdererHp" type="text">
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<p>배송메세지</p>
									<input class="form-control valid" type="text" name="deliveryMessage" id="deliveryMessage" placeholder="배송메세지를 입력하세요.">
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<p>우편번호</p>
									<input class="form-control valid" type="text" name="zipcode" id="zipcode" value="${orderer.zipcode }" required>
									<input type="button" class="genric-btn default" onclick="execDaumPostcode();" value="검색">
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<p>도로명주소</p>
									<input class="form-control valid" name="roadAddress" id="roadAddress" type="text" value="${orderer.roadAddress }" required>
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<p>지번주소</p>
									<input class="form-control valid" name="jibunAddress" id="jibunAddress" type="text" value="${orderer.jibunAddress }" required>
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<p>나머지주소</p>
									<input class="form-control valid" name="namujiAddress" id="namujiAddress" type="text" value="${orderer.namujiAddress }" required>
								</div>
							</div>
						</div>
						<div class="form-group mt-3" align="right">
							<button type="submit" class="button button-contactForm boxed-btn">결제하기</button>
						</div>
					</form>
				</div>

				<!--  사이드 -->
				<div class="col-lg-3 offset-lg-1">
					<div class="media contact-info">
						<c:set var="point" value="0"/>
						<div class="media-body">
							<h1>Product</h1>
							<c:forEach var="goodsDTO" items="${goodsList }" varStatus="i">
								<c:set var="point" value="${point + goodsDTO.point }" />
								<p>${i.index + 1}. &nbsp; ${goodsDTO.goodsNm }</p>	
								<span id="qty${i.index }"></span>
								<span><fmt:formatNumber value="${goodsDTO.price - goodsDTO.price * goodsDTO.discountRate / 100 }"/>원</span>
								<input type="hidden" id="price${i.index }" value="${goodsDTO.price}" />
								<input type="hidden" id="discountRate${i.index }" value="${goodsDTO.discountRate}" />
								<input type="hidden" id="orderGoodsQty${i.index }"/>
								<input type="hidden" id="deliveryPrice${i.index }" value="${goodsDTO.deliveryPrice}" />
								<input type="hidden" id="point${i.index }" value="${goodsDTO.point}" />
							</c:forEach>
							<br>
							<p>배송비 : <span id="totalDeliveryPrice"></span></p>
							<p>포인트 : <span id="totalPoint"></span></p>
						</div>
					</div>
					<hr>
					<div class="media contact-info">
						<div class="media-body">
							<h1>Total</h1>	<br>
							<span id="viewPaymentAmt"></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ contact section end ================= -->
</body>
</html>