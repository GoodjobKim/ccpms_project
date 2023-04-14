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
					<form action="${contextPath }/order/orderGoods" method="post" class="form-contact contact_form" >
						<input type="hidden" name="goodsCd" value="${goodsDTO.goodsCd }">
		                <input type="hidden" name="orderGoodsQty" value="${orderGoodsQty}">
		                <input type="hidden" name="memberId" value="${orderer.memberId}">
		                <input type="hidden" name="point" value="${goodsDTO.point * orderGoodsQty}">
		                
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
						<div class="media-body">
							<h1>Product</h1>
							<p>상품 제목 : ${goodsDTO.goodsNm }</p>
							<p>구매 수량 : (${orderGoodsQty }장)</p>
							<p>가격 : <span><fmt:formatNumber value="${goodsDTO.price - goodsDTO.price * goodsDTO.discountRate / 100 }"/>원</span></p>
							<p>총 금액 : <span><fmt:formatNumber value="${(goodsDTO.price - (goodsDTO.price * goodsDTO.discountRate / 100)) * orderGoodsQty}"/>원</span></p>
							<p>배송비 : <span><fmt:formatNumber value="${goodsDTO.deliveryPrice}"/>원</span></p>
							<p>포인트 : <span><fmt:formatNumber value="${goodsDTO.point * orderGoodsQty}"/>P 적립</span></p>
						</div>
					</div>
					<hr>
					<div class="media contact-info">
						<div class="media-body">
							<h1>Total</h1>	<br>
							<c:set var="paymentAmt" value="${(goodsDTO.price - (goodsDTO.price * goodsDTO.discountRate / 100)) * orderGoodsQty + goodsDTO.deliveryPrice}"/>
							<p><fmt:formatNumber value="${paymentAmt }"/>원</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ contact section end ================= -->
</body>
</html>