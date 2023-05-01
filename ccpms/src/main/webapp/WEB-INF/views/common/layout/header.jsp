<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<header>
        <!-- Header Start -->
       <div class="header-area">
            <div class="main-header ">
                <div class="header-top top-bg d-none d-lg-block">
                   <div class="container">
                    <div class="row justify-content-between align-items-center">
                        <div class="col-lg-8">
                            <div class="header-info-left">
                                <ul>                          
                                    <li>ccpms CD/LP DVD/BD</li>
                                    <li>ccpms 라이브 홀 / ccpms 스테이지</li>
                                    <li>010 8651 7239</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="header-info-right f-right">
                                <ul class="header-social">
                                	<c:choose>
                                		<c:when test="${sessionScope.memberId != null }">
                                			<li style="color: white;">안녕하세요. ${sessionScope.memberId }님</li>
                                			<li><a href="${contextPath }/member/logout">logout</a></li>
                                		</c:when>
                                		<c:when test="${sessionScope.adminId != null }">
                                			<li style="color: white;">안녕하세요. ${sessionScope.adminId }님</li>
                                			<li><a href="${contextPath }/member/logout">logout</a></li>
                                		</c:when>
                                		<c:otherwise>
                                			<li><i class="fa fa-user"></i><a href="${contextPath }/member/login">Login</a></li>
		                                    <li><a href="${contextPath }/member/register">Register</a></li>
		                                    <li><a href="${contextPath }/member/findId">Find Id</a></li>
		                                    <li><a href="${contextPath }/member/findPasswd">Find Passwd</a></li>
                                		</c:otherwise>
                                	</c:choose>
                                </ul>
                            </div>
                        </div>
                       </div>
                   </div>
                </div>
               <div class="header-bottom  header-sticky">
                    <div class="container">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                  <a href="${contextPath }/"><img src="${contextPath }/resources/gotrip-master/assets/img/logo/ccpms_png.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-10">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>               
                                        <ul id="navigation">
                               				<c:choose>
			                                	<c:when test="${sessionScope.role eq 'admin' }">
			                                		<li><a href="${contextPath }/admin/goods/adminGoodsList">상품관리</a></li>
			                                		<li><a href="${contextPath }/admin/member/adminMemberList">유저관리</a></li>
			                                		<li><a href="${contextPath }/admin/order/adminOrderList">주문관리</a></li>
			                                		<li><a href="${contextPath }/contact/FAQ">고객센터</a>
			                                			<ul class="submenu">
		                                                    <li><a href="${contextPath }/contact/FAQ">자주묻는 질문</a></li>
		                                                    <li><a href="${contextPath }/contact/contactNotice">1:1문의</a></li>
		                                                </ul>
			                                		</li>
			                                	</c:when>
			                                	<c:otherwise>
		                                            <li><a href="${contextPath }/goods/goodsList?sort=all&part=all&genre=all&location=all">공연목록</a></li>
		                                            <li><a href="#">내정보</a>
		                                                <ul class="submenu">
		                                                    <li><a href="${contextPath }/myPage/myInfo?memberId=${sessionScope.memberId}">내 정보 수정</a></li>
		                                                    <li><a href="${contextPath }/myPage/myOrderList">주문내역</a></li>
		                                                    <li><a href="${contextPath }/myPage/myCartList">장바구니</a></li>
		                                                </ul>
		                                            </li>
		                                            <li><a href="${contextPath }/contact/FAQ">고객센터</a>
		                                            	<ul class="submenu">
		                                                    <li><a href="${contextPath }/contact/FAQ">자주묻는 질문</a></li>
		                                                    <li><a href="${contextPath }/contact/contactNotice">1:1문의</a></li>
		                                                </ul>
		                                            </li>
			                                	</c:otherwise>
		                                	</c:choose>
                                        </ul>
                                    </nav>
                                </div>
                                
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>

</body>
</html>