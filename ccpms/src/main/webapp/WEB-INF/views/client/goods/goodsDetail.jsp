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
	function processToOrder(goodsCd){
		if("${sessionId == null}" == "true")	{
			alert("로그인 후 이용가능합니다.");
			location.href = "${contextPath}/member/login";
		}
		else{
			location.href = "${contextPath}/order/orderGoods?goodsCd="+goodsCd+"&orderGoodsQty="+$("#orderGoodsQty").val();
		}
	}
	
	function processToCart(goodsCd) {
		if("${sessionId == null}" == 'true') {
			alert("로그인 후 이용 가능합니다 ");
			location.href = "${contextPath}/member/login";
		}
		else{
			$.ajax({
				url : "${contextPath}/myPage/addcart",
				method : "get",
				data : {"goodsCd" : goodsCd , "cartGoodsQty" : $("#orderGoodsQty").val()},
				success : function(result){
					
					if(result == 'Duple'){
						alert("이미 추가된 항목입니다.");
					}
					else{
						alert("장바구니에 추가 되었습니다.");
					}
				}
			})
		}
	}
</script>
</head>
<body>
	<!--================Blog Area =================-->
	<section class="blog_area single-post-area section-padding">
		<div class="container">
			<div>
				<h1>${goodsDTO.goodsNm }</h1>
				<h5>${goodsDTO.startDt } ~ ${goodsDTO.endDt }	|	${goodsDTO.location }</h5>
			</div>
			<hr>
			<div class="row">
				<div class="col-lg-8 posts-list">
					<div class="single-post">
						<div class="feature-img">
							<img class="img-fluid" src="${contextPath }/thumbnails?goodsFileName=${goodsDTO.goodsFileName }">
						</div>

						<div class="d-sm-flex justify-content-between text-center">
							<p class="like-info">
								<span class="align-middle"><i class="fa fa-heart"></i></span>
								Lily and 4 people like this
							</p>
						</div>
						<div align="center">
							<input type="button" onclick="javascript:processToOrder(${goodsDTO.goodsCd});" class="genric-btn primary-border e-large" value="예매하기">
							
							<input type="button" onclick="javascript:processToCart(${goodsDTO.goodsCd});" class="genric-btn primary-border e-large" value="장바구니에 추가">
						</div>
						<div class="blog_details">
							<div align="center">
								<h1>공연정보</h1>
							</div>
							<ul class="blog-info-link mt-3 mb-4">
								<li><a href="#">상세정보</a></li>
								<li><a href="#cancel">예매/취소안내</a></li>			<!-- 넘어가는데 헤더에 가려서 좀 더 위쪽에 아이디 지정해야함  -->
							</ul>
							<hr>
							<p class="excert">${goodsDTO.showIntro }</p>
							<div id="cancel">
								<div class="section-top-border">						
									<h3 class="mb-30">예매</h3>
										<p>
											예매는 PC, 모바일, 고객센터 를 통해 신용카드, 가상계좌(무통장 입금), YES머니, YES상품권, 예치금 등으로 예매하실 수 있습니다.
											(단, 상품마다 사용 가능한 결제 수단이 다르게 적용될 수 있으니 상품 상세페이지 안내 사항을 확인해주세요.) 
										</p>
										<p>
											무통장입금 결제 선택 시 입금 마감시간은 예매일 익일 밤 11시 29분까지입니다. 입금 마감시간 내 미입금 된 경우 예매가 자동 취소됩니다. 
											(단, 상품에 따라 예매 당일 밤 11시 29분에 마감되는 경우가 있으니 예매 전후 반드시 확인해주시기 바랍니다.)
											예매수수료는 다음과 같습니다.(상품의 특성에 따라 예매수수료 정책은 다를 수 있습니다.)
										</p>
									<div class="progress-table-wrap">
										<div class="progress-table">
											<div class="table-head">
												<div class="percentage">장르</div>
												<div class="visit">PC/모바일</div>
												<div class="visit">전화예매</div>
											</div>
											<div class="table-row">
												<div class="percentage">콘서트, 뮤지컬, 클래식, 국악, 무용</div>
												<div class="visit">장당 1,000원</div>
												<div class="visit">장당 2,000원</div>
											</div>
											<div class="table-row">
												<div class="percentage">연극, 전시</div>
												<div class="visit">장당 500원</div>
												<div class="visit">장당 2,000원</div>
											</div>
											<div class="table-row">
												<div class="percentage">체험, 행사</div>
												<div class="visit">장당 300원</div>
												<div class="visit">장당 2,000원</div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="section-top-border">						
									<h3 class="mb-30">티켓수령방법</h3>
										<p>
											<h6>현장수령</h6>
											티켓은 예매자 본인 수령이 기본 원칙입니다.
											공연 당일 예매확인서와 예매자의 신분증 을 지참하신 후 공연장 매표소에서 티켓을 수령하시면 됩니다.
										</p>
										<p>	
											<h6>배송</h6>
											배송을 선택하신 경우 예매완료(결제익일) 기준 5~7일 이내에 예매 시 입력하신 주소로 배송됩니다.(영업일 기준)
											일괄배송의 경우 각 상품의 지정된 배송일부터 순차적으로 배송이 시작됩니다. 영업일 기준 5~7일 정도가 소요되며, 주소지에 따라 추가될 수 있습니다.
											배송 시작일은 상세정보 및 예매공지사항에서 확인하실 수 있습니다.
											티켓 배송은 일반 택배가 아닌 인편 배송으로 진행됩니다. 인편 배송의 경우 경비실이나 우편함 등에 보관이 불가하며 부재 시 반송되니
											반드시 티켓을 직접 받을 수 있는 주소를 기입 바랍니다.
											티켓 수령과 관련된 정책은 상품별로 상이하니 자세한 내용은 각 상품 상세정보에서 확인 부탁드립니다.
										</p>
								</div>
								
								<div class="section-top-border">						
									<h3 class="mb-30">취소마감시간</h3>
									<div class="progress-table-wrap">
										<div class="progress-table">
											<div class="table-head">
												<div class="percentage">공연 관람일</div>
												<div class="percentage">취소 마감일</div>
											</div>
											<div class="table-row">
												<div class="percentage">화요일 ~ 토요일</div>
												<div class="percentage">관람일 전일 평일 오후 5시</div>
											</div>
											<div class="table-row">
												<div class="percentage">일요일 ~ 월요일</div>
												<div class="percentage">토요일 오전 11시</div>
											</div>
											<div class="table-row">
												<div class="percentage">공휴일 및 공휴일 익일</div>
												<div class="percentage">
													공휴일 전일이 평일인 경우 - 오후 5시	<br>
													공휴일 전일이 토요일, 일요일 - 토요일 오전 11시	<br>
													공휴일에는 예매 취소 불가
												</div>
											</div>
										</div>
									</div>
									<p>
										관람일 당일 예매하신 건은 취소, 변경, 환불 불가합니다.
									</p>
									<p>
										배송이 시작된 티켓의 경우 티켓이 예스24 공연 고객센터로 취소마감시간 이전까지 반송되어야 취소 가능합니다.(취소수수료는 도착일 기준으로 부과됩니다.)
									</p>
									<p>
										결제수단을 복수로 선택한 경우 인터넷으로 부분취소가 불가하오니, 고객센터로 문의해주시기 바랍니다.
									</p>
								</div>
								
								<div class="section-top-border">						
									<h3 class="mb-30">취소수수료</h3>
									<div class="progress-table-wrap">
										<div class="progress-table">
											<div class="table-head">
												<div class="percentage">취소일</div>
												<div class="percentage">취소수수료</div>
											</div>
											<div class="table-row">
												<div class="percentage">예매 후 7일 이내</div>
												<div class="percentage">없음</div>
											</div>
											<div class="table-row">
												<div class="percentage">예매 후 8일 ~ 관람일 10일 전까지</div>
												<div class="percentage">뮤지컬, 콘서트, 클래식 : 장당 4,000원 / 연극, 전시 : 장당 2,000원(단, 티켓 금액의 10% 이내)</div>
											</div>
											<div class="table-row">
												<div class="percentage">관람일 9일 전 ~ 관람일 7일 전까지</div>
												<div class="percentage">티켓 금액의 10%</div>
											</div>
											<div class="table-row">
												<div class="percentage">관람일 6일 전 ~ 관람일 3일 전까지</div>
												<div class="percentage">티켓 금액의 20%</div>
											</div>
											<div class="table-row">
												<div class="percentage">관람일 2일 전 ~ 취소마감일시까지</div>
												<div class="percentage">티켓 금액의 30%</div>
											</div>
										</div>
									</div>
									<p>
										예매 후 7일 이내라도 취소시점이 관람일로부터 10일 이내라면 그에 해당하는 취소수수료가 부과됩니다.
									</p>
									<p> 
										관람일 당일 취소 가능한 상품의 경우 관람일 당일 취소 시 티켓금액의 90%가 부과됩니다.
									</p>
									<p>
										상품의 특성에 따라 취소수수료 정책이 달라질 수 있습니다.(각 상품 예매 시 취소수수료 확인)
									</p>
								</div>
								<div class="section-top-border">						
									<h3 class="mb-30">환불</h3>
										<p>
											예매수수료는 예매 당일 밤 12시 이전까지 환불되며, 그 이후 기간에는 환불되지 않습니다. 
										</p>
										<p>
											배송 및 반송처리 된 티켓의 배송비는 환불되지 않습니다.
										</p>
									<div class="progress-table-wrap">
										<div class="progress-table"	align="center">
											<div class="table-head">
												<div class="percentage">결제수단</div>
												<div class="percentage">환불안내</div>
											</div>
											<div class="table-row">
												<div class="percentage"	align="center">신용카드</div>
												<div class="percentage">
													일반적으로 취소완료 되고 4~5일(토, 공휴일 제외) 후 카드 승인 취소가 확인됩니다.	<br>
													취소시점에 따라 취소수수료와 예매수수료, 배송 받으신 경우 배송비를 제외한 금액만큼 환불 처리 됩니다. 
													(부분 취소 시에는 잔여 티켓 금액 + 수수료 등을 제외하고 환불 처리 됩니다.)	<br>
													각 카드사의 취소 정책에 따라 승인취소 및 환급일에 차이가 있을 수 있습니다. 	<br>
													자세한 사항은 카드사로 문의 바랍니다.
												</div>
											</div>
											<div class="table-row">
												<div class="percentage" align="center">무통장입금</div>
												<div class="percentage">
													예매 취소 시 반드시 환불 받으실 계좌번호와 은행명을 입력하세요.		<br>
													취소수수료,예매수수료와 배송 받으신 경우 배송비를 제외한 후 환불 처리됩니다.	<br>
													취소 후 환불 처리는 영업일 기준 3~5일 정도 소요됩니다.	<br>
													환불진행상태는 MY공연>예매확인/취소 상세내역에서 확인할 수 있습니다.	<br>
													
													* 배송 받은 티켓의 취소를 위해 고객센터로 발송하실 때, 환불 받으실 계좌 정보를 기입하여 보내주시면 보다 빠른 환불 처리가 가능합니다.
												</div>
											</div>
											<div class="table-row">
												<div class="percentage" align="center">YES머니, 예치금, YES상품권, 공연예매권</div>
												<div class="percentage">
													예매 취소 시 바로 복원됩니다. 
													(단, 사용기간이 만료된 경우 복원되지 않으니 취소 전 확인해주시기 바랍니다.)
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="navigation-top">
						<div class="navigation-area">
							<div class="row">
								<div class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
									<div class="detials">
										<h2>연관상품</h2>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="blog-author">
						<c:forEach var="relatedGoods" items="${relatedGoodsList }">
							<div class="media align-items-center">
								<div class="col-xl-4 col-lg-4 col-md-6">
									<div class="single-place mb-30">
										<div class="place-img" align="center">
											<img src="${contextPath }/thumbnails?goodsFileName=${relatedGoods.goodsFileName }">
										</div>
										<div class="place-cap">
											<div class="place-cap-top">
												<h3>
													<a href="${contextPath }/goods/goodsDetail?goodsCd=${relatedGoods.goodsCd}">${relatedGoods.goodsNm }</a>
												</h3>
												${relatedGoods.actor } <br>
												${relatedGoods.startDt } ~ ${relatedGoods.endDt }
											</div>
											<div class="place-cap-bottom">
												<ul>
													<li><i class="fas fa-map-marker-alt"></i>${goodsDTO.location }</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<ul class="list cat-list">
								<li>
									<h5>
										<span>등급 : ${goodsDTO.grade }</span>
									</h5> <br>
									<h5>
										<span>관람시간 : ${goodsDTO.showtime }</span>
									</h5> <br>
									<h5>
										<span>출연 : ${goodsDTO.actor }</span>
									</h5> <br>
									<h5>
										<span>가격 : <fmt:formatNumber value="${goodsDTO.price }" /></span>
									</h5> <br>
									<h5>
										<span>할인가격 : <fmt:formatNumber value="${goodsDTO.price - (goodsDTO.price * goodsDTO.discountRate / 100)}" /></span>
									</h5> <br>
								</li>
								<li>
									<h5>
										<span>공연시간안내</span>
										<p>${goodsDTO.publishedDt }</p>
										<p>${goodsDTO.publishedTime }</p>
									</h5> <br>
									<h5>
										<span>배송정보 : ${goodsDTO.deliveryInfo }</span>
									</h5>
									<h5>
										<span>잔여좌석 : ${goodsDTO.stock }</span>
									</h5>
								</li>
								<li>
									<h5>
										<span>수량 : </span>
									</h5>
									<div class="default-select" id="default-select">
										<select id="orderGoodsQty" name="orderGoodsQty">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
										</select>
									</div>
								</li>
							</ul>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ Blog Area end =================-->
</body>
</html>