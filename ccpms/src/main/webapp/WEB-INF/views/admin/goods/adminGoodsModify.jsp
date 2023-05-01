<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){
		
		$("[name='part']").val("${goodsDTO.part}");
		$("[name='sort']").val("${goodsDTO.sort}");
		$("[name='genre']").val("${goodsDTO.genre}");
		$("[name='location']").val("${goodsDTO.location}");
		
	});
</script>
</head>
<body>
	<!-- slider Area Start-->
    <div class="slider-area ">
        <!-- Mobile Menu -->
        <div class="single-slider slider-height2 d-flex align-items-center" data-background="${contextPath }/resources/gotrip-master/assets/img/main/loginbanner.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>상품정보 수정</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- slider Area End-->
	<div class="section-top-border">
		<div class="col-lg-8 col-md-8">
			<h3 class="mb-30">상품정보 수정</h3>
			<form action="${contextPath }/admin/goods/adminGoodsModify" method="post" enctype="multipart/form-data">
				<input type="hidden" name="goodsCd" value="${goodsDTO.goodsCd }">
				<div class="mt-10">
					<p>공연이미지 &emsp;<span>*</span></p>
					<input type="file" id="goodsFileName" name="goodsFileName" value="${goodsDTO.goodsFileName }" class="single-input">
				</div>
				<div class="mt-10">
					<p>공연명 &emsp;<span>*</span></p>
					<input type="text" id="goodsNm" name="goodsNm" value="${goodsDTO.goodsNm }" class="single-input">
				</div>

				<div class="mt-10">
					<p>출연진 <span>*</span></p>
					<input type="text" id="actor" name="actor" value="${goodsDTO.actor }" class="single-input">
				</div>

				<div class="mt-10">
					<p>지역 <span>*</span></p>
					<div class="form-select" id="default-select">
						<select name="location">
							<option value="전국">전국</option>
							<option value="서울">서울</option>
							<option value="대학로">대학로</option>
							<option value="홍대">홍대</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
							<option value="대전">대전</option>
						</select>
					</div>
				</div>
				
				<div class="mt-10">
					<p>날짜 <span>*</span></p>
					<input type="text" name="publishedDt" value="${goodsDTO.publishedDt }" class="single-input">
				</div>
				
				<div class="mt-10">
					<p>공연시간 <span>*</span></p>
					<input type="text" name="publishedTime" value="${goodsDTO.publishedTime }" class="single-input">
				</div>
				
				<div class="mt-10">
					<p>관람시간(인터미션포함) <span>*</span></p>
					<input type="text" name="showtime" value="${goodsDTO.showtime }" class="single-input">
				</div>
				
				<div class="mt-10">
					<p>관람등급 <span>*</span></p>
					<input type="text" name="grade" value="${goodsDTO.grade }" class="single-input">
				</div>
				
				<div class="mt-10">
					<p>가격 <span>*</span></p>
					<input type="text" name="price" value="${goodsDTO.price }" class="single-input">
				</div>
				
				<div class="mt-10">
					<p>공연시작날짜 <span>*</span></p>
					<input type="date" name="startDt" value="${goodsDTO.startDt }" class="single-input">
				</div>
				
				<div class="mt-10">
					<p>공연종료날짜 <span>*</span></p>
					<input type="date" name="endDt" value="${goodsDTO.endDt }" class="single-input">
				</div>
				
				<div class="mt-10">
					<p>포인트 <span>*</span></p>
					<input type="text" name="point" value="${goodsDTO.point }" class="single-input">
				</div>
				
				<div class="mt-10">
					<p>공연소개 <span>*</span></p>
					<textarea class="single-textarea" name="showIntro" >${goodsDTO.showIntro }</textarea>
					<script>CKEDITOR.replace("showIntro");</script>
				</div>

				<div class="mt-10">
					<p>출연진 소개 <span>*</span></p>
					<textarea cols="5" rows="100" class="single-textarea" name="actorInfo" >${goodsDTO.actorInfo }</textarea>
					<script>CKEDITOR.replace("actorInfo");</script>
				</div>
				
				<div class="mt-10">
					<p>공연목차 <span>*</span></p>
					<textarea class="single-textarea" name="contentsOrder" >${goodsDTO.contentsOrder }</textarea>
					<script>CKEDITOR.replace("contentsOrder");</script>
				</div>
				
				<div class="mt-10">
					<p>할인률 <span>*</span></p>
					<input type="text" name="discountRate" value="${goodsDTO.discountRate }" class="single-input">
				</div>
				
				<div class="mt-10">
					<p>잔여좌석 <span>*</span></p>
					<input type="text" name="stock" value="${goodsDTO.stock }" class="single-input">
				</div>
				
				<div class="mt-10">
					<p>배송정보 <span>*</span></p>
					<textarea class="single-textarea" name="deliveryInfo" value="${goodsDTO.deliveryInfo }"></textarea>
					<script>CKEDITOR.replace("deliveryInfo");</script>
				</div>
				
				<div class="mt-10">
					<p>배송비 <span>*</span></p>
					<input type="text" name="deliveryPrice" value="${goodsDTO.deliveryPrice }" class="single-input">
				</div>
				
				<div class="mt-10">
					<p>공연종류 <span>*</span></p>
					<div class="form-select" id="default-select">
						<select name="sort">
							<option value="general">전체</option>
							<option value="musical">뮤지컬</option>
							<option value="theater">연극</option>
							<option value="classic">클래식</option>
							<option value="consert">콘서트</option>
						</select>
					</div>
				</div>
				
				<div class="mt-10">
					<p>장르 <span>*</span></p>
					<div class="form-select" id="default-select">
						<select name="genre">
							<option value="nothing">없음</option>
							<option value="romance">로맨스</option>
							<option value="comedy">코미디</option>
							<option value="drama">드라마</option>
							<option value="horror">공포</option>
							<option value="thriller">추리스릴러</option>
							<option value="fantasy">판타지</option>
							<option value="historical">시대/역사극</option>
						</select>
					</div>
				</div>
				
				<div class="mt-10">
					<p>상태 <span>*</span></p>
					<div class="form-select" id="default-select">
						<select name="part">
							<option value="ing">공연중</option>
							<option value="tobe">공연예정</option>
							<option value="signoff">공연종료</option>
						</select>
					</div>
				</div>

				<div align="right">
					<input type="submit" class="genric-btn success radius" value="수정">
				</div>
			</form>
		</div>
	</div>
</body>
</html>