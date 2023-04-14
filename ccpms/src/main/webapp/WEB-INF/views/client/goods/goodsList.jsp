<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="sessionId" value="${sessionScope.memberId }"/>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	var index = 0;
	$().ready(function(){
		index = document.getElementById("temp").value;
		tid = setInterval('reaminTime()', 1000);
	});
	
	function reaminTime() {
		
		for (var i = 1; i <= index; i++) {
			var now = new Date();
			var end = new Date($("#endDt"+i).val());
			
			var remainDate = end - now;
				
			var day = Math.floor((remainDate / (1000 * 60 * 60 * 24)));
			var hours = Math.floor((remainDate % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		    var minutes = Math.floor((remainDate % (1000 * 60 * 60)) / (1000 * 60));
		    var time = day + "일" + hours + "시간" + minutes + "분";
		    
			$("#timer"+i).html(time);
			if(remainDate < 0) {
				clearInterval(tid);
			}
			else{
				remainDate - remainDate - 1000;
			}				
			
		}
		
	};
</script>
</head>
<body>
	<section class="blog_area section-padding">
        <div class="container">
            <div class="row">
            	<div class="col-lg-12">
					<div class="section-tittle text-center">
						<span>Enjoy Your Consert</span>
						<h2>공연 목록</h2>
					</div>
				</div>
                <div class="col-lg-8 mb-5 mb-lg-0">
                    <div class="blog_left_sidebar">
                        <article class="blog_item">
							<div class="favourite-place place-padding">
								<div class="container">
									<div class="row">
										<c:choose>
											<c:when test="${empty goodsList }">
												<tr align="center">
													<td colspan="6">등록된 공연이 없습니다.</td>
												</tr>
											</c:when>
											<c:otherwise>
												<c:forEach var="goodsDTO" items="${goodsList }" varStatus="i">
													<div class="col-xl-4 col-lg-4 col-md-6">
														<div class="single-place mb-30">
															<div class="place-img">
																<img src="${contextPath }/thumbnails?goodsFileName=${goodsDTO.goodsFileName }" alt="">
															</div>
															<div class="place-cap">
																<div class="place-cap-top">
																	<h3><a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDTO.goodsCd}">${goodsDTO.goodsNm }</a></h3>
																	${goodsDTO.startDt } ~ ${goodsDTO.endDt }
																	<input type="hidden" id="endDt${i.count }" value="${goodsDTO.endDt }">
																	<p class="dolor"><fmt:formatNumber value="${goodsDTO.price - goodsDTO.price * goodsDTO.discountRate / 100 }"/>원</p>
																</div>
																<div class="place-cap-bottom">
																	<ul>
																		<li><i class="far fa-clock"></i>남은 시간 : <span id="timer${i.count }"></span></li>
																		<li><i class="fas fa-map-marker-alt"></i>${goodsDTO.location }</li>
																	</ul>
																</div>
															</div>
														</div>
													</div>
													<c:set var="index" value="${index=index+1 }" />
												</c:forEach>
												<input type="hidden" id="temp" value="${index}" />
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
                        </article>

                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                    	<aside class="single_sidebar_widget search_widget">
                            <form action="${contextPath }/goods/searchGoods" method="get">
                                <div class="form-group">
                                    <div class="input-group mb-3">
										<input type="text" name="word" class="form-control" placeholder='Search Keyword' onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'">
										<input type="hidden" name="method" value="search">
                                        <div class="input-group-append">
                                            <button class="btns" type="button"><i class="ti-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" type="submit">Search</button>
                            </form>
                        </aside>
                     	<aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">Category</h4>
                            <ul class="list cat-list">
                                <li> <p align="center">뮤지컬<p>
									<p>장르</p>
										<a href="${contextPath }/goods/goodsList?sort=musical&genre=nothing" class="d-flex">-   없음</a>
										<a href="${contextPath }/goods/goodsList?sort=musical&genre=romance" class="d-flex">-   로맨스</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=musical&genre=comedy" class="d-flex">-   코미디</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=musical&genre=drama" class="d-flex">-   드라마</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=musical&genre=horror" class="d-flex">-   공포</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=musical&genre=thriller" class="d-flex">-   추리/스릴러</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=musical&genre=fantasy" class="d-flex">-   판타지</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=musical&genre=historical" class="d-flex">-   역사/시대극</a>	<br>
									<p>상태</p>
										<a href="${contextPath }/goods/goodsList?sort=musical&part=ing" class="d-flex">-   공연중</a>
										<a href="${contextPath }/goods/goodsList?sort=musical&part=signoff" class="d-flex">-   공연종료</a>
										<a href="${contextPath }/goods/goodsList?sort=musical&part=tobe" class="d-flex">-   공연예정</a>	<br>
									<p>지역</p>
										<a href="${contextPath }/goods/goodsList?sort=musical&location=전국"class="d-flex">-   전국</a>
										<a href="${contextPath }/goods/goodsList?sort=musical&location=서울" class="d-flex">-   서울</a>
										<a href="${contextPath }/goods/goodsList?sort=musical&location=대학로" class="d-flex">-   대학로</a>
										<a href="${contextPath }/goods/goodsList?sort=musical&location=홍대" class="d-flex">-   홍대</a>
										<a href="${contextPath }/goods/goodsList?sort=musical&location=경기" class="d-flex">-   경기</a>
										<a href="${contextPath }/goods/goodsList?sort=musical&location=인천" class="d-flex">-   인천</a>
										<a href="${contextPath }/goods/goodsList?sort=musical&location=대전" class="d-flex">-   대전</a>
                                </li>
                                <li> <p align="center">연극<p>
									<p>장르</p>
										<a href="${contextPath }/goods/goodsList?sort=theater&genre=nothing" class="d-flex">-   없음</a>
										<a href="${contextPath }/goods/goodsList?sort=theater&genre=romance" class="d-flex">-   로맨스</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=theater&genre=comedy" class="d-flex">-   코미디</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=theater&genre=drama" class="d-flex">-   드라마</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=theater&genre=horror" class="d-flex">-   공포</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=theater&genre=thriller" class="d-flex">-   추리/스릴러</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=theater&genre=fantasy" class="d-flex">-   판타지</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=theater&genre=historical" class="d-flex">-   역사/시대극</a>	<br>
									<p>상태</p>
										<a href="${contextPath }/goods/goodsList?sort=theater&part=ing" class="d-flex">-   공연중</a>
										<a href="${contextPath }/goods/goodsList?sort=theater&part=signoff" class="d-flex">-   공연종료</a>
										<a href="${contextPath }/goods/goodsList?sort=theater&part=tobe" class="d-flex">-   공연예정</a>	<br>
									<p>지역</p>
										<a href="${contextPath }/goods/goodsList?sort=theater&location=전국"class="d-flex">-   전국</a>
										<a href="${contextPath }/goods/goodsList?sort=theater&location=서울" class="d-flex">-   서울</a>
										<a href="${contextPath }/goods/goodsList?sort=theater&location=대학로" class="d-flex">-   대학로</a>
										<a href="${contextPath }/goods/goodsList?sort=theater&location=홍대" class="d-flex">-   홍대</a>
										<a href="${contextPath }/goods/goodsList?sort=theater&location=경기" class="d-flex">-   경기</a>
										<a href="${contextPath }/goods/goodsList?sort=theater&location=인천" class="d-flex">-   인천</a>
										<a href="${contextPath }/goods/goodsList?sort=theater&location=대전" class="d-flex">-   대전</a>
                                </li>
                                 <li> <p align="center">클래식<p>
									<p>장르</p>
										<a href="${contextPath }/goods/goodsList?sort=classic&genre=nothing" class="d-flex">-   없음</a>
										<a href="${contextPath }/goods/goodsList?sort=classic&genre=romance" class="d-flex">-   로맨스</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=classic&genre=comedy" class="d-flex">-   코미디</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=classic&genre=drama" class="d-flex">-   드라마</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=classic&genre=horror" class="d-flex">-   공포</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=classic&genre=thriller" class="d-flex">-   추리/스릴러</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=classic&genre=fantasy" class="d-flex">-   판타지</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=classic&genre=historical" class="d-flex">-   역사/시대극</a>	<br>
									<p>상태</p>
										<a href="${contextPath }/goods/goodsList?sort=classic&part=ing" class="d-flex">-   공연중</a>
										<a href="${contextPath }/goods/goodsList?sort=classic&part=signoff" class="d-flex">-   공연종료</a>
										<a href="${contextPath }/goods/goodsList?sort=classic&part=tobe" class="d-flex">-   공연예정</a>	<br>
									<p>지역</p>
										<a href="${contextPath }/goods/goodsList?sort=classic&location=전국"class="d-flex">-   전국</a>
										<a href="${contextPath }/goods/goodsList?sort=classic&location=서울" class="d-flex">-   서울</a>
										<a href="${contextPath }/goods/goodsList?sort=classic&location=대학로" class="d-flex">-   대학로</a>
										<a href="${contextPath }/goods/goodsList?sort=classic&location=홍대" class="d-flex">-   홍대</a>
										<a href="${contextPath }/goods/goodsList?sort=classic&location=경기" class="d-flex">-   경기</a>
										<a href="${contextPath }/goods/goodsList?sort=classic&location=인천" class="d-flex">-   인천</a>
										<a href="${contextPath }/goods/goodsList?sort=classic&location=대전" class="d-flex">-   대전</a>
                                </li>
                                <li> <p align="center">콘서트<p>
									<p>장르</p>
										<a href="${contextPath }/goods/goodsList?sort=consert&genre=nothing" class="d-flex">-   없음</a>
										<a href="${contextPath }/goods/goodsList?sort=consert&genre=romance" class="d-flex">-   로맨스</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=consert&genre=comedy" class="d-flex">-   코미디</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=consert&genre=drama" class="d-flex">-   드라마</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=consert&genre=horror" class="d-flex">-   공포</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=consert&genre=thriller" class="d-flex">-   추리/스릴러</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=consert&genre=fantasy" class="d-flex">-   판타지</a>
	                                    <a href="${contextPath }/goods/goodsList?sort=consert&genre=historical" class="d-flex">-   역사/시대극</a>	<br>
									<p>상태</p>
										<a href="${contextPath }/goods/goodsList?sort=consert&part=ing" class="d-flex">-   공연중</a>
										<a href="${contextPath }/goods/goodsList?sort=consert&part=signoff" class="d-flex">-   공연종료</a>
										<a href="${contextPath }/goods/goodsList?sort=consert&part=tobe" class="d-flex">-   공연예정</a>	<br>
									<p>지역</p>
										<a href="${contextPath }/goods/goodsList?sort=consert&location=전국"class="d-flex">-   전국</a>
										<a href="${contextPath }/goods/goodsList?sort=consert&location=서울" class="d-flex">-   서울</a>
										<a href="${contextPath }/goods/goodsList?sort=consert&location=대학로" class="d-flex">-   대학로</a>
										<a href="${contextPath }/goods/goodsList?sort=consert&location=홍대" class="d-flex">-   홍대</a>
										<a href="${contextPath }/goods/goodsList?sort=consert&location=경기" class="d-flex">-   경기</a>
										<a href="${contextPath }/goods/goodsList?sort=consert&location=인천" class="d-flex">-   인천</a>
										<a href="${contextPath }/goods/goodsList?sort=consert&location=대전" class="d-flex">-   대전</a>
                                </li>
                            </ul>
                        </aside>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>

	<!-- Pagination-area Start -->
        <div class="pagination-area pb-100 text-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="single-wrap d-flex justify-content-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-start">
                                  <li class="page-item"><a class="page-link" href="#"><span class="flaticon-arrow roted left-arrow"></span></a></li>
                                    <li class="page-item active"><a class="page-link" href="#">01</a></li>
                                    <li class="page-item"><a class="page-link" href="#">02</a></li>
                                    <li class="page-item"><a class="page-link" href="#">03</a></li>
                                  <li class="page-item"><a class="page-link" href="#"><span class="flaticon-arrow right-arrow"></span></a></li>
                                </ul>
                              </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	<!-- Pagination-area End -->
</body>
</html>