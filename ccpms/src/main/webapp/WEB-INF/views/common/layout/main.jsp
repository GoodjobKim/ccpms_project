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

<main>
	
	        <!-- slider Area Start-->
	        <div class="slider-area ">
	            <!-- Mobile Menu -->
	            <div class="slider-active">
	                <div class="single-slider hero-overly  slider-height d-flex align-items-center" data-background="${contextPaht }/resources/gotrip-master/assets/img/hero/h1_hero.jpg">
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-xl-9 col-lg-9 col-md-9">
	                                <div class="hero__caption">
	                                    <h1>Find your <span>Next Show!</span> </h1>
	                                    <p>Make Enjoy your show!</p>
	                                </div>
	                            </div>
	                        </div>
	                        <!-- Search Box -->
	                        <div class="row">
	                            <div class="col-xl-12">
	                                <!-- form -->
	                                <form action="#" class="search-box">
	                                    <div class="input-form mb-30">
	                                        <input type="text" placeholder="찾으려는 공연이 있나요 ?">
	                                    </div>
	                                    <div class="select-form mb-30">
	                                        <div class="select-itms">
	                                            <select name="select" id="select1">
	                                                <option value="all">전체</option>
	                                                <option value="musical">뮤지컬</option>
	                                                <option value="drama">연극</option>
	                                                <option value="consert">콘서트</option>
	                                                <option value="classic">클래식</option>
	                                            </select>
	                                        </div>
	                                    </div>
	                                    <div class="search-form mb-30">
	                                        <a href="#">검색</a>
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

	        <!-- Support Company Start-->
	        <div class="support-company-area support-padding fix">
	            <div class="container">
	                <div class="row align-items-center">
		                <div class="col-xl-6 col-lg-6">
	                        <div class="support-location-img mb-50">
	                            <img src="assets/img/service/support-img.jpg" alt="">
	                            <div class="support-img-cap">
	                                <span>요 부분이 비동기 방식으로 사진이 변경되는 부분</span>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-6 col-lg-6">
	                        <div class="right-caption">
	                            <!-- Section Tittle -->
	                            <div class="section-tittle section-tittle2">
	                                <span>Ranking</span>
	                                <h2>현재 공연 랭킹</h2>
	                            </div>
	                            <div class="support-caption">
	                                <p>현재 공연 랭킹을 3가지를 보여주기 종류별(뮤지컬, 공연, 연극) 이면 더 좋음 비동기 방식으로 누르면 내용이 변하게</p>
	                                <div class="select-suport-items">
	                                    <label class="single-items">#뮤지컬
	                                        <input type="checkbox" checked="checked active">
	                                        <span class="checkmark"></span>
	                                    </label>
	                                    <label class="single-items">#콘서트
	                                        <input type="checkbox" checked="checked active">
	                                        <span class="checkmark"></span>
	                                    </label>
	                                    <label class="single-items">#연극
	                                        <input type="checkbox" checked="checked active">
	                                        <span class="checkmark"></span>
	                                    </label>
	                                    <label class="single-items">#클래식
	                                        <input type="checkbox" checked="checked active">
	                                        <span class="checkmark"></span>
	                                    </label>
	                                </div>
	                                <a href="#" class="btn border-btn">About us</a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- Support Company End-->
	        <!-- Testimonial Start -->
	        <!-- Testimonial Start -->
	        <div class="testimonial-area testimonial-padding" data-background="assets/img/testmonial/testimonial_bg.jpg">
	            <div class="container ">
	                <div class="row d-flex justify-content-center">
	                    <div class="col-xl-11 col-lg-11 col-md-9">
	                        <div class="h1-testimonial-active">
	                            <!-- Single Testimonial -->
	                            <div class="single-testimonial text-center">
	                                <!-- Testimonial Content -->
	                                <div class="testimonial-caption ">
	                                    <div class="testimonial-top-cap">
	                                        <p>Event!</p>
	                                    </div>
	                                    <!-- founder -->
	                                    <div class="testimonial-founder d-flex align-items-center justify-content-center">
	                                        <div class="founder-img">
	                                            <img src="" alt="">
	                                        </div>
	                                        <div class="founder-text">
	                                            <span></span>
	                                            <p></p>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
	                            <!-- Single Testimonial -->
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- Testimonial End -->
	        <!-- Blog Area Start -->
	        <div class="home-blog-area section-padding2">
	            <div class="container">
	                <!-- Section Tittle -->
	                <div class="row">
	                    <div class="col-lg-12">
	                        <div class="section-tittle text-center">
	                            <span>Focus This Consert </span>
	                            <h2>Focus On!</h2>
	                        </div>
	                    </div>
	                </div>
	                <div class="row">
	                    <div class="col-xl-6 col-lg-6 col-md-6">
	                        <div class="home-blog-single mb-30">
	                            <div class="blog-img-cap">
	                                <div class="blog-img">
	                                    <img src="${contextPaht }/resources/gotrip-master/assets/img/blog/home-blog1.jpg" alt="">
	                                </div>
	                                <div class="blog-cap">
	                                    <p> |  뮤지컬</p>
	                                    <h3><a href="single-blog.html">뮤지컬 오페라의 유령 </a></h3>
	                                    <a href="#" class="more-btn">마침내, 13년만의 한국어 공연! »</a>
	                                </div>
	                            </div>
	                            <div class="blog-date text-center">
	                                <span>24</span>
	                                <p>Now</p>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="col-xl-6 col-lg-6 col-md-6">
	                        <div class="home-blog-single mb-30">
	                            <div class="blog-img-cap">
	                                <div class="blog-img">
	                                    <img src="${contextPaht }/resources/gotrip-master/assets/img/blog/home-blog2.jpg" alt="">
	                                </div>
	                                <div class="blog-cap">
	                                    <p> |   연극</p>
	                                    <h3><a href="single-blog.html">연극 포쉬</a></h3>
	                                    <a href="#" class="more-btn">Read more »</a>
	                                </div>
	                            </div>
	                            <div class="blog-date text-center">
	                                <span>24</span>
	                                <p>Now</p>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- Blog Area End -->
	
	    </main>

</body>
</html>