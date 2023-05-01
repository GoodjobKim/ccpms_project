<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                                <h2>비밀번호 찾기</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->
        <!-- Support Company Start-->
        <div class="support-company-area servic-padding fix">
            <div class="container">
                <form action="${contextPath }/member/findPasswd" method="post">
                	<div>
                		<h5>비밀번호 찾기</h5>
							<div class="mt-10">
								<p>찾고자하는 아이디를 입력하세요. <span>*</span></p>
								<input type="text" id="memberId" name="memberId" placeholder="아이디를 입력하세요." style="width: 60%;"
										onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디를 입력하세요.'" required	class="single-input">
							</div>	<br>
							
							<div align="right">
								<input type="submit" class="genric-btn success radius" value="찾기">
							</div>
					</div>
				</form>
				<div>
					<p>아이디가 기억나지 않는다면? <a href="${contextPath }/member/findId">아이디 찾기</a></p>
				</div>
            </div>
        </div>
        <!-- Support Company End-->

</body>
</html>