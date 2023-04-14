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
</head>
<body>
    <section class="blog_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
						<article class="blog_item">
							<div class="accordion" id="accordionPanelsStayOpenExample">
								<div class="accordion-item">
									<h2 class="accordion-header" id="panelsStayOpen-headingOne">
										<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
											<h5>예매한 티켓은 언제 배송되나요?</h5>
										</button>
									</h2>
									<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
										<div class="accordion-body">
											<font color="#ff0000">※ 티켓은 묶음배송이 불가합니다.</font>
											<br>
											<br>
											<strong><font color="#008000">[배송]</font></strong>
											<br>
											① 예매완료(결제익일) 기준 4-5일 이내 배송됩니다.(주말, 공휴일 제외한 영업일 기준) <br>
											② 배송료는 3,200원이며, 공연일 14일 전 예매분에 한해 배송접수 가능합니다. (영업일 기준) <br>
											③ 인편으로 배송되며, 수령인이 부재중이면 반송될 수 있습니다. <br>
											④ 반송된 티켓은 확인 후 재발송이 가능하며, 재발송 배송료 3,200원은 추가로 고객님께서 부담하
											   셔야 합니다. (2023.3.2부터 인상) <br><br>
											
											<strong><font color="#008000">[일괄배송]</font></strong>
											<br>
											① 일부 공연은 티켓 발송 날짜가 지정되어 있으며, 일괄배송 날짜는 공연 페이지에 공지합니다. <br>
											② 티켓 배송료는 3,200원이며, 일괄배송 일자 이후 예매하시면 공연장에서 현장수령 하셔야 합니다.(2023.3.2부터 인상) <br><br>
											
											
											<strong><font color="#008000">[주의 및 기타 사항]</font></strong>
											<br>
											① 이미 배송 받으신 티켓을 분실ㆍ훼손하시면 재발행이 불가능합니다.<br>
											② 상품 특성 및 예매하는 시점에 따라 수령 방법 중 일부의 선택이 불가능 할 수 있습니다. <br>
										</div>
										<ul class="blog-info-link">
											<li><a href="#">배송/반송</a></li>
										</ul>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header" id="panelsStayOpen-headingTwo">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
											<h5>공연 예매가 가능한 결제수단은 어떤 것들이 있나요?</h5>
										</button>
									</h2>
									<div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
										<div class="accordion-body">
											인터파크 티켓 예매 시 이용이 가능한 결제수단은 아래와 같습니다. <br><br>

											다만, 대형 공연 또는 경기의 티켓 예매 오픈 시간에는 많은 고객님들의 접속으로 인해 서버가 불안정하여
											원할한 예매를 위해 일시적으로 일부 결제수단은 이용에 제한이 있습니다.
											<br><br>
											
											<strong><font color="#008000">[인터파크 티켓 예매 시 가능한 결제수단 안내]</font></strong>
											<br>
											1. 신용카드	<br>
											2. 무통장입금	<br>
											3. 휴대폰결제	<br>
											4. I-Point	<br>
											5. 컬쳐랜드, 해피머니 문화상품권	<br>
											6. 공연예매권	<br>
											7. 문화예매권	<br>
											8. 카카오페이, PAYCO, Onepay 등의 간편결제		<br><br>
											
											Onepay 결제는 모바일 어플리케이션에서 예매 시에만 이용이 가능하며,
											스포츠, 전시 등의 일부 상품등을 예매 시에는 이용에 제한이 있습니다.
										</div>
										<ul class="blog-info-link">
											<li><a href="#">티켓예매/발권</a></li>
										</ul>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header" id="panelsStayOpen-headingThree">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
											<h5>티켓을 이미 우송 받았는데 취소하고 싶어요!</h5>
										</button>
									</h2>
									<div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
										<div class="accordion-body">
											이미 우송 받으신 티켓은 인터넷 및 전화로 취소하실 수 없습니다. <Br>
											취소를 원하실 경우, 취소 마감시간 전에 티켓이 인터파크 고객센터로 반송되어야 취소가 가능합니다. <Br><br>
											
											<strong><font color="#008000">[우편 반송 취소 안내] </font></strong>
											<br>
											1. 반송 <Br>
											① 우송된 티켓을 취소마감시간 전까지 인터파크 고객센터에 보내주셔야 취소가 가능합니다. <br>
											② 공연 전날이 휴일인 경우, 공연 2일전(휴일 전날) 평일 오후 5시, 토요일 11시까지 보내주셔야 
											     하며, 여러 장 중 일부만 취소를 원하시면 취소할 티켓만 보내주시면 됩니다. 
											     (휴일은 우체국이 영업하지 않기 때문에, 휴일은 티켓을 받을 수 없습니다.) <br>
											③ 한미 플래티늄카드, 신세계 플래티늄카드, 씨티은행 리볼빙 카드로 할인을 받아 구매하시면
											    인터파크 Gift Card, 기타 카드 마일리지로 결제하신 경우는 장당 부분취소를 하실 수 없고 전체
											    취소만 가능합니다. <br>
											   → 부분취소 가능 여부는 고객센터[1544-1555]로 문의해 주시기 바랍니다.	<br>
											④ 무통장입금 결제를 하신 경우, 반송하는 우편 안에 예매자 본인 명의 계좌번호를 동봉하여
											    주시기 바랍니다. <br><br>
											
											2. 반송 비용 및 취소수수료	<br>
											① 티켓반송 시 반송 비용은 고객님께서 부담하셔야 하며, 티켓이 정확하게 도착되도록 등기우편을
											    이용해 주시기 바랍니다. 	<br>
											② 취소 시, 예매수수료 취소수수료를 부담하셔야 하며, 배송비는 환불되지 않습니다.
											    → 취소수수료는 당사로 도착된 기준으로 부과되오니 최대한 빠르게 보내주시기 바랍니다. <br><br>
											
											3. 반송 후	<br>
											→ 티켓 도착 후 취소 시 문자 발송되며, 발송 2~3일 후 취소 문자를 받지 못하시면 고객센터[1544-1555]로 
											     문의해 주시기 바랍니다.
										</div>
										<ul class="blog-info-link">
											<li><a href="#">취소/환불</a></li>
										</ul>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header" id="panelsStayOpen-headingFour">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFour" aria-expanded="false" aria-controls="panelsStayOpen-collapseFour">
											<h5>공연 예매 후 수량을 일부만 취소할 수 있나요?</h5>
										</button>
									</h2>
									<div id="panelsStayOpen-collapseFour" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFour">
										<div class="accordion-body">
											<strong><font color="#008000">[부분취소]</font></strong>
											<br>
											① 기본적으로 부분취소는 가능합니다. 	<br>
											② 단, 특정카드로 할인을 받아 예매하시거나, 당사와 제휴된 카드사의 바우처 할인을 사용하여 예매한 경우,  인터파크 Gift Card, 
											    기타 카드 마일리지, 할인쿠폰, 휴대폰 결제 등을 사용하여 결제한 경우에는 부분취소를 하실 수 없고, 
											    전체취소만 가능합니다. <br>
											③ 이제너두(복지몰), 해피캐쉬, 컬쳐캐쉬를 이용하여 예매하신 경우 부분취소를 하실 수 없고, 전체취소만 가능합니다.	<br>
											④ 예매 내역에 따라 부분 취소 가능여부가 달라지오니 고객센터[1544-1555]로 문의해 주시기 바랍니다.	<br><br>

											<strong><font color="#008000">[전체취소만 가능한 경우 요약]</font></strong>
											 <br>
											① 할인쿠폰을 적용하여 할인받은 경우 <br>
											② 신용카드 할인 중 모든 상품을 할인 받을 수 있는 인터파크 제휴카드로 할인 받은 경우 <br>
											③ 단체 예매로 할인 받은 경우 <br>
											④ 카드 사용중지, 한도초과(잔액부족)및 분실 접수 된 카드	<br>
											⑤ 휴대폰 결제건	<br>
											⑥ 인터파크 제휴 연동사인 이제너두(복지몰), 해피캐쉬에서 복지포인트, 해피캐쉬, 컬쳐캐쉬로 예매한 경우	<br><br>
											
											<strong><font color="#008000">[취소마감시간과 취소수수료] </font></strong>	<Br>
											※ 취소시 취소 마감시간 이내에 취소가 가능하며, 그에따라 취소수수료가 부과됩니다.
										</div>
										<ul class="blog-info-link">
											<li><a href="#">취소/환불</a></li>
										</ul>
									</div>
								</div>
								<div class="accordion-item">
									<h2 class="accordion-header" id="panelsStayOpen-headingFive">
										<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseFive" aria-expanded="false" aria-controls="panelsStayOpen-collapseFive">
											<h5>예약번호입장(현장수령)으로 예매할 경우 대리인 수령이 가능한가요?</h5>
										</button>
									</h2>
									<div id="panelsStayOpen-collapseFive" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingFive">
										<div class="accordion-body">
											<strong>
												티켓을 현장에서 수령하실 때 예매자 본인이 가지 않으셔도 대리인이 수령할 수 있으나, 공연, 예매 내역에 따라 
												확인 절차는 차이가 있습니다.
											</strong>	<Br><br>
											
											<strong><font color="#008000">[공연]</font></strong><br>
											예약번호입장(현장수령)은 예매자와 관람자가 다르면 로그인 후 상단의 예매확인/취소 또는 My 티켓에서
											예매내역을 프린트하여 지참하시면 예약번호 및 본인(예매자 신분증) 확인 후, 대리인이 티켓을 수령하실 수
											있습니다. <br><br>
											
											다만, 할인 종류에 따라 대리 수령이 어려운 경우도 있으니 할인을 받으셨다면 자세한 내용은 고객센터로
											문의해 주시기 바랍니다.	<br><br>
											
											주최사의 요청에 따라, 티켓의 대리수령 및 관람이 제한 될 수 있으니, 예매하신 상품페이지의 공지사항을 확인하여주시기 바랍니다.	<br><br>
											
											①  My티켓 페이지에서 공연, 영화의 예매내역을 조회하신 뒤 "상세보기" 클릭 후 예매내역서(예약번호) 프린트
											가능합니다.	<br>
											② 티켓수령방법을 확인하시면 됩니다.
										</div>
										<ul class="blog-info-link">
											<li><a href="#">티켓예매/발권</a></li>
										</ul>
									</div>
								</div>
							</div>
						</article>

						<nav class="blog-pagination justify-content-center d-flex">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Previous">
                                        <i class="ti-angle-left"></i>
                                    </a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link">1</a>
                                </li>
                                <li class="page-item active">
                                    <a href="#" class="page-link">2</a>
                                </li>
                                <li class="page-item">
                                    <a href="#" class="page-link" aria-label="Next">
                                        <i class="ti-angle-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                        <aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">FAQ</h4>
							<ul class="list cat-list">
								<li><a href="#" class="d-flex">
										<p>회원</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>로그인</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>아이디/패스워드</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>예매/결제</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>배송/반송</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>취소/환불</p>
								</a></li>
							</ul>
						</aside>
                        <aside class="single_sidebar_widget tag_cloud_widget">
							<h4 class="widget_title">Tag Clouds</h4>
							<ul class="list">
								<li><a href="#">취소</a></li>
								<li><a href="#">환불</a></li>
								<li><a href="#">회원</a></li>
								<li><a href="#">배송</a></li>
								<li><a href="#">티켓수령</a></li>
								<li><a href="#">제휴문의</a></li>
								<li><a href="#">수수료</a></li>
							</ul>
						</aside>

                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>