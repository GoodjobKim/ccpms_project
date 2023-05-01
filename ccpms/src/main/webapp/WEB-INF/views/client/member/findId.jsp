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
                                <h2>아이디 찾기</h2>
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
                <form action="${contextPath }/member/findId" method="post">
                	<div>
                		<h5>아이디 찾기</h5>
							<div class="mt-10">
								<p>이름 <span>*</span></p>
								<input type="text" id="memberNm" name="memberNm" placeholder="이름을 입력하세요." style="width: 60%;"
										onfocus="this.placeholder = ''" onblur="this.placeholder = '이름을 입력하세요.'" required	class="single-input">
							</div>	<br>
							
							<div class="mt-10">
								<p>전화번호<span>*</span></p>
								<input type="text" name="hp" placeholder="-를 포함해서 입력하세요." 
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'hp'" required class="single-input">
							</div>	<br>
							
							<div align="right">
								<input type="submit" class="genric-btn success radius" value="찾기">
							</div>
							
					</div>
				</form>
            </div>
        </div>
        <!-- Support Company End-->
</body>
</html>