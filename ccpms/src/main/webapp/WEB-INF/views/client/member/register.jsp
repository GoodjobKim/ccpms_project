<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>

	$().ready(function(){
		
		$("#btnOverlapped").click(function(){
			var memberId = $("#memberId").val();
			
			if(memberId == ''){
				alert("아이디를 입력하세요.");
				return;
			}
			$.ajax({
				type : "get",
				url	: "${contextPath}/member/checkDuplicatedId?memberId=" + memberId,
				success	: function(data){
					if(data == "duplicate"){
						alert("사용할 수 있는 id입니다.");
					}
					else{
						alert("사용할 수 없는 id입니다.");
					}
				}
			});
		});
		
		$("#confirmPasswd").blur(function(){
			if($("#passwd").val() == $("#confirmPasswd").val()){
				$("#msg").html("<span style='color:green;'>비밀번호 일치</span>")
				
			}
			else{
				$("#msg").html("<span style='color:red;'>비밀번호 불일치</span>")
			}
		});

		$("form").submit(function(){
			var dateBirth = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
			$("[name='dateBirth']").val(dateBirth);
			
			if($("#smsstsYn").val() != "Y"){
				$(this).val("N");
			}
			if($("#emailstsYn").val() != "Y"){
				$(this).val("N");
			}
			if($("#passwd").val() != $("#confirmPasswd").val()){
				alert("비밀번호를 확인하세요.");
				$("#passwd").focus();
				return false;
			}
			if($("#memberId").val().length < 5 && $("#passwd").val().length < 7){
				alert("아이디나 비밀번호가 너무 짧습니다.");
				$("#memberId").focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
	<main>

        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="${contextPath }/resources/gotrip-master/assets/img/hero/about.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>Register</h2>
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
                <form action="${contextPath }/member/register" method="post">
                	<div>
                		<h5>회원가입</h5>
							<div class="mt-10">
								<p>아이디 &emsp;<span>*6자리 이상으로 작성하세요.</span></p>
								<input type="text" id="memberId" name="memberId" placeholder="아이디를 입력하세요." style="width: 60%;"
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'Id'" required	class="single-input">
								<input type="button" id="btnOverlapped" class="genric-btn default" value="중복확인">
							</div>	<br>
							
							<div class="mt-10">
								<p>비밀번호 &emsp;<span>*8자리 이상으로 작성하세요.</span></p>
								<input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요."
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'Passwd'" required class="single-input">
							</div>	<br>
							
							<div class="mt-10">
								<p>비밀번호 확인 <span>*</span></p>
								<input type="password" id="confirmPasswd" placeholder="비밀번호를 입력하세요."	
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'confirmPasswd'" required class="single-input"><span id="msg"></span>
							</div>	<br>
							
							<div class="mt-10">
								<p>이름 <span>*</span></p>
								<input type="text" name="memberNm" placeholder="이름을 입력하세요."	
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'Name'" required	class="single-input">
							</div>	<br>
							
							<!-- 디자인 무너진거 나중에 한번에 수정하기 -->
							<p>성별 <span>*</span></p>
							<div class="switch-wrap d-flex justify-content-between">
								남<div >
									<input type="radio" id="default-radio1"name="sex" value="m">
									<label for="default-radio1"></label>
								</div>
								여<div >
									<input type="radio" id="default-radio2"name="sex" value="f">
									<label for="default-radio2"></label>
								</div>
							</div>
							<br>
							
							<div class="mt-10">
								<p>생년월일 <span>*</span></p>
								<div class="input-group-icon mt-10">
									<div class="form-select" id="default-select"">
										<select id="birthY">
											<c:forEach var="i" begin="0" end="2023">
												<option>${2023-i }</option>
											</c:forEach>
										</select>
									</div>
								</div>년
								<div class="input-group-icon mt-10">
									<div class="form-select" id="default-select"">
										<select id="birthM">
											<c:forEach var="i" begin="1" end="12">
												<c:choose>
													<c:when test="${i < 10 }">
														<option>0${i }</option>
													</c:when>
													<c:otherwise>
														<option>${i }</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
								</div>월
								<div class="input-group-icon mt-10">
									<div class="form-select" id="default-select"">
										<select id="birthD">
											<c:forEach var="i" begin="1" end="31">
												<c:choose>
													<c:when test="${i < 10 }">
														<option>0${i }</option>
													</c:when>
													<c:otherwise>
														<option>${i }</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select>
									</div>
								</div>일
								<input type="hidden" name="dateBirth">
							</div>	<br>
							
							<div class="mt-10">
								<p>연락처 <span>*</span></p>
								<input type="text" name="hp" placeholder="-를 포함해서 입력하세요." 
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'hp'" required class="single-input">
							</div>	<br>
							<div class="switch-wrap d-flex justify-content-between">
								<p>CCPMS에서 발송하는 SMS소식을 수신합니다.</p>
								<div class="primary-checkbox">
									<input type="checkbox" id="primary-checkbox1" name="smsstsYn" value="Y" checked>
									<label for="primary-checkbox1"></label>
								</div>
							</div>	<br>
							
							<div class="mt-10">
								<p>이메일 <span>*</span></p>
								<input type="email" name="email" placeholder="이메일을 입력하세요." 
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email address'" required class="single-input">
							</div>	<br>
							<div class="switch-wrap d-flex justify-content-between">
								<p>CCPMS에서 발송하는 E-mail을 수신합니다.</p>
								<div class="primary-checkbox">
									<input type="checkbox" id="primary-checkbox2" name="emailstsYn" value="Y" checked>
									<label for="primary-checkbox2"></label>
								</div>
							</div>	<br>
							
							우편번호
							<div class="input-group-icon mt-10">
								<div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
								<input type="text" id="zipcode" name="zipcode" placeholder="우편번호" 
										onfocus="this.placeholder = ''"	onblur="this.placeholder = '우편번호'" required class="single-input">
								<input type="button" class="genric-btn default" onclick="execDaumPostcode();" value="검색">
							</div>
							도로명주소
							<div class="input-group-icon mt-10">
								<div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
								<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소를 입력하세요." 
										onfocus="this.placeholder = ''"	onblur="this.placeholder = '도로명주소'" required class="single-input">
							</div>
							지번주소
							<div class="input-group-icon mt-10">
								<div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
								<input type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소를 입력하세요." 
										onfocus="this.placeholder = ''"	onblur="this.placeholder = '지번주소'" required class="single-input">
							</div>
							나머지주소
							<div class="input-group-icon mt-10">
								<div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></div>
								<input type="text" id="namujiAddress" name="namujiAddress" placeholder="나머지주소를 입력하세요." 
										onfocus="this.placeholder = ''"	onblur="this.placeholder = '나머지주소'" required class="single-input">
							</div>	<br><br>
							
							
							
							<div align="right">
								<input type="submit" class="genric-btn success radius" value="가입">
							</div>
							<!-- For Gradient Border Use -->
							<!-- <div class="mt-10">
										<div class="primary-input">
											<input id="primary-input" type="text" name="first_name" placeholder="Primary color" 
													onfocus="this.placeholder = ''" onblur="this.placeholder = 'Primary color'">
											<label for="primary-input"></label>
										</div>
								</div> -->
					</div>
				</form>
            </div>
        </div>
        <!-- Support Company End-->
    </main>
</body>
</html>