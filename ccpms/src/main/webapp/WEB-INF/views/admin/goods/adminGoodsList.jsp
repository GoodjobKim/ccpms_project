<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<script>
	function adminGoodsRemove(goodsCd){
		if(confirm("정말로 삭제하겠습니까?")){
			location.href="${contextPath}/admin/goods/adminGoodsRemove?goodsCd="+goodsCd;
		}
	}

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- slider Area Start-->
    <div class="slider-area ">
        <!-- Mobile Menu -->
        <div class="single-slider slider-height2 d-flex align-items-center" data-background="${contextPath }/resources/gotrip-master/assets/img/hero/contact_hero.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>Goods List</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- slider Area End-->
	<div class="section-top-border">
		<h3 class="mb-40">회원목록</h3>
		<div align="right">
			<input type="button" onclick="javascript:location.href='${contextPath}/admin/goods/adminGoodsAdd'" class="genric-btn success radius" value="등록">
		</div>
		<div class="progress-table-wrap">
			<div class="progress-table">
				<div class="table-head" align="center">
					<div class="serial">상품 번호</div>
					<div class="percentage">상품정보</div>
					<div class="visit">등록날짜</div>
					<div class="serial">수정</div>
					<div class="serial">삭제</div>
				</div>
				<c:choose>
					<c:when test="${empty goodsList }">
						<tr align="center">
							<td colspan="5">등록된 상품이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="goodsDTO" items="${goodsList }" varStatus="i">
							<div class="table-row" align="center">
								<div class="serial">${goodsDTO.goodsCd }</div>
								<div class="percentage">
									<div class="col-md-4">
										<a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDTO.goodsCd}">
											<img src="${contextPath }/thumbnails?goodsFileName=${goodsDTO.goodsFileName }" width="300" height="350" >
										</a>
										<div>
											<h4><a href="${contextPath }/goods/goodsDetail?goodsCd=${goodsDTO.goodsCd}">${goodsDTO.goodsNm }</a></h4>
											<p>${goodsDTO.actor} | ${goodsDTO.startDt } | <fmt:formatNumber value="${goodsDTO.price }"/>원</p>
										</div>
									</div>
								</div>
								<div class="visit">
									<fmt:formatDate value="${goodsDTO.enrollDt }" pattern="yyyy-MM-dd" />
								</div>
								<div class="serial">
									<a href="${contextPath }/admin/goods/adminGoodsModify?goodsCd=${goodsDTO.goodsCd}" class="genric-btn info circle">수정</a>
								</div>
								<div class="serial">
									<a href="javascript:adminGoodsRemove(${goodsDTO.goodsCd });" class="genric-btn info circle">삭제</a>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
	</div>
</body>
</html>