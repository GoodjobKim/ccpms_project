<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${sessionScope.memberId eq null}">
		<script>
			alert("로그인을 먼저 진행해주세요.");
			location.href = "${contextPath}/member/login";
		</script>
	</c:if>

	<!-- ================ contact section start ================= -->
    <section class="contact-section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <h2 class="contact-title">문의사항 작성</h2>
                    </div>
                    <div class="col-lg-8">
                        <form class="form-contact contact_form" action="${contextPath }/contact/addBoard" method="post">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control valid" name="memberId" id="memberId" type="text" value="${memberId }" readonly>
                                    </div>
                                </div>
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <input class="form-control" name="passwd" id="passwd" type="password" onblur="this.placeholder = 'Enter password'" placeholder="비밀번호 입력">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <input class="form-control valid" name="subject" id="subject" type="text" onblur="this.placeholder = 'Enter subject'" placeholder="제목 입력">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control w-100" name="content" id="content" cols="30" rows="9" onblur="this.placeholder = 'Enter content'" placeholder=" Enter content"></textarea>
                                    	<script>CKEDITOR.replace("content");</script>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group mt-3" align="right">
                            	<input type="submit" class="button button-contactForm boxed-btn" value="작성">
                                <input type="button" class="button button-contactForm boxed-btn" onclick="location.href='${contextPath}/contact/contactNotice'" value="목록보기">
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-home"></i></span>
                            <div class="media-body">
                                <h3>Cheonan, SouthKorea.</h3>
                                <p>Chungsuro, 99</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-tablet"></i></span>
                            <div class="media-body">
                                <h3>+82 010 8651 7239</h3>
                                <p>Mon to Fri 9am to 6pm</p>
                            </div>
                        </div>
                        <div class="media contact-info">
                            <span class="contact-info__icon"><i class="ti-email"></i></span>
                            <div class="media-body">
                                <h3>worish@naver.com</h3>
                                <p>Send us your problem anytime!</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    <!-- ================ contact section end ================= -->
</body>
</html>