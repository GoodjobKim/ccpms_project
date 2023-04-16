<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wellcome To CCPMS!</title>
</head>
<body>
<script>

</script>
<main>
	
	        <!-- slider Area Start-->
	        <div class="slider-area ">
	            <!-- Mobile Menu -->
	            <div class="slider-active">
	                <div class="single-slider hero-overly  slider-height d-flex align-items-center" data-background="${contextPaht }/resources/gotrip-master/assets/img/main/kyle-head-p6rNTdAPbuk-unsplash.jpg">
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-xl-9 col-lg-9 col-md-9">
	                                <div class="hero__caption">
	                                    <h1>Find your <span>Next Show!</span> </h1>
	                                    <p>Make Your Enjoy Time!</p>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- Search Box -->
	                        <div class="row">
	                            <div class="col-xl-12">
	                                <!-- form -->
	                                <form action="${contextPath }/goods/searchGoods" method="get" class="search-box">
	                                    <div class="input-form mb-30">
	                                        <input type="text" placeholder="찾으려는 공연이 있나요 ?" name="word">
	                                        <input type="hidden" name="method" value="search">
	                                    </div>
	                                    <div class="select-form mb-30">
	                                        <div class="select-itms">
	                                            <select name="select" id="select1">
	                                                <option value="all">전체</option>
	                                            </select>
	                                        </div>
	                                    </div>
	                                    <div class="search-form mb-30">
	                                        <a href="${contextPath }/goods/searchGoods">검색</a>
	                                    </div>
	                                </form>	
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- slider Area End-->
	        <!-- Favourite Places Start -->
	        <div class="favourite-place place-padding">
	            <div class="container">
	                <!-- Section Tittle -->
	                <div class="row">
	                    <div class="col-lg-12">
	                        <div class="section-tittle text-center">
	                            <span>POPULAR SHOW List</span>
	                            <h2>POPULAR SHOW</h2>
	                        </div>
	                    </div>
	                </div>
	                <div class="row">
		                <c:forEach var="bestConsert" items="${bestConsertInfo }">
		                	<div class="col-xl-4 col-lg-4 col-md-6">
		                        <div class="single-place mb-30">
		                            <div class="place-img">
		                                <img src="${contextPath }/thumbnails?goodsFileName=${bestConsert.goodsFileName }" alt="">
		                            </div>
		                            <div class="place-cap">
		                                <div class="place-cap-top">
		                                    <h3><a href="${contextPath }/goods/goodsDetail?goodsCd=${bestConsert.goodsCd}">${bestConsert.goodsNm }</a></h3>
		                                    ${bestConsert.startDt } ~ ${bestConsert.endDt }
		                                    <p class="dolor"><fmt:formatNumber value="${bestConsert.price - bestConsert.price * bestConsert.discountRate / 100 }"/>원</p>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </c:forEach>
	                </div>
				<div class="row">
	                    <div class="col-lg-12">
	                        <div class="section-tittle text-center">
	                            <span>Newer SHOW List</span>
	                            <h2>Newer SHOW</h2>
	                        </div>
	                    </div>
	                </div>
	                <div class="row">
	                	<c:forEach var="newConsert" items="${newConsertInfo }">
		                	<div class="col-xl-4 col-lg-4 col-md-6">
		                        <div class="single-place mb-30">
		                            <div class="place-img">
		                                <img src="${contextPath }/thumbnails?goodsFileName=${newConsert.goodsFileName }">
		                            </div>
		                            <div class="place-cap">
		                                <div class="place-cap-top">
		                                    <h3><a href="${contextPath }/goods/goodsDetail?goodsCd=${newConsert.goodsCd}">${newConsert.goodsNm }</a></h3>
		                                    ${newConsert.startDt } ~ ${newConsert.endDt }
		                                    <p class="dolor"><fmt:formatNumber value="${newConsert.price - newConsert.price * newConsert.discountRate / 100 }"/>원</p>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </c:forEach>
	                </div>
	            </div>
	        </div>
	        <!-- Favourite Places End -->

	        <div class="video-area video-bg pt-200 pb-200"  data-background="${contextPaht }/resources/gotrip-master/assets/img/main/event-background.jpg">
	            <div class="container">
	                <div class="row">
	                    <div class="col-xl-12">
	                        <div class="video-caption text-center">
	                            <p class="pera1">Love where you're going in the perfect time</p>
	                            <p class="pera2">현재 진행중인 이벤트</p>
	                             <div class="founder-img" align="center">
	                             	<img src="${contextPath }/resources/gotrip-master/assets/img/main/event1.jpg" alt="">
	                             	<img src="${contextPath }/resources/gotrip-master/assets/img/main/event2.jpeg" alt="">
	                             	<img src="${contextPath }/resources/gotrip-master/assets/img/main/event3.jpeg" alt="">
	                             </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        
	        <!-- Blog Area Start -->
	        <div class="home-blog-area section-padding2">
	            <div class="container">
	                <!-- Section Tittle -->
	                <div class="row">
	                    <div class="col-lg-12">
	                        <div class="section-tittle text-center">
	                            <span>주목할만한 공연! </span>
	                            <h2>Focus On!</h2>
	                        </div>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col-xl-6 col-lg-6 col-md-6">
	                    	<c:forEach var="musicalRanking" items="${bestMusicalRanking }">
		                        <div class="home-blog-single mb-30">
		                            <div class="blog-img-cap">
		                                <div class="blog-img">
		                                    <img src="${contextPath }/thumbnails?goodsFileName=${musicalRanking.goodsFileName }" alt="">
		                                </div>
		                                <div class="blog-cap">
		                                    <p> |  뮤지컬</p>
		                                    <h3><a href="${contextPath }/goods/goodsDetail?goodsCd=${musicalRanking.goodsCd}">${musicalRanking.goodsNm }</a></h3>
		                                    <a href="${contextPath }/goods/goodsDetail?goodsCd=${musicalRanking.goodsCd}" class="more-btn">자세히보기 »</a>
		                                </div>
		                            </div>
		                            <div class="blog-date text-center">
		                                <span><p class="dolor"><fmt:formatNumber value="${musicalRanking.price - musicalRanking.price * musicalRanking.discountRate / 100 }"/>원</p></span>
		                                <p>Now</p>
		                            </div>
		                        </div>
	                        </c:forEach>
	                    </div>
	                    <div class="col-xl-6 col-lg-6 col-md-6">
	                    	<c:forEach var="theaterRanking" items="${bestTheaterRanking }">
		                        <div class="home-blog-single mb-30">
		                            <div class="blog-img-cap">
		                                <div class="blog-img">
		                                    <img src="${contextPaht }/thumbnails?goodsFileName=${theaterRanking.goodsFileName}" alt="">
		                                </div>
		                                <div class="blog-cap">
		                                    <p> |   연극</p>
		                                    <h3><a href="${contextPath }/goods/goodsDetail?goodsCd=${theaterRanking.goodsCd}">${theaterRanking.goodsNm }</a></h3>
		                                    <a href="${contextPath }/goods/goodsDetail?goodsCd=${theaterRanking.goodsCd}" class="more-btn">자세히보기 »</a>
		                                </div>
		                            </div>
		                            <div class="blog-date text-center">
		                                <span><p class="dolor"><fmt:formatNumber value="${theaterRanking.price - theaterRanking.price * theaterRanking.discountRate / 100 }"/>원</p></span>
		                                <p>Now</p>
		                            </div>
		                        </div>
	                        </c:forEach>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- Blog Area End -->
	
	    </main>

</body>
</html>