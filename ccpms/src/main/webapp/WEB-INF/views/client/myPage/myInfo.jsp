<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

	$().ready(function(){
		var dateBirth = $("[name='dateBirth']").val().split("-");
		$("#birthY").val(dateBirth[0]);		
		$("#birthM").val(dateBirth[1]);
		$("#birthD").val(dateBirth[2]);
		
		$("form").submit(function(){
			var dateBirth = $("#birthY").val() + "-" + $("#birthM").val() + "-" + $("#birthD").val();
			$("[name='dateBirth']").val(dateBirth);
		});
	});
	
	function removeMember(){
		if(confirm("정말로 탈퇴하시겠습니까?")){
			location.href='${contextPath}/myPage/removeMember?memberId=' + $("#memberId").val();
		}
	}

</script>
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
					<h2 class="contact-title">내정보 보기</h2>
				</div>
				<div class="col-lg-8">
					<form action="${contextPath }/myPage/modifyInfo" method="post" class="form-contact contact_form" >
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<p>아이디 <span>*</span></p>
									<input class="form-control valid" name="memberId" id="memberId" type="text" value="${memberDTO.memberId }" readonly>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<p>이름 <span>*</span></p>
									<input class="form-control valid" name="memberNm" id="memberNm" type="text"
										onblur="this.placeholder = '이름을 입력하세요'" placeholder="이름을 입력하세요." value="${memberDTO.memberNm }" required>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<p>비밀번호 <span>*</span></p>
									<input class="form-control valid" name="passwd" id="passwd" type="password" value="${memberDTO.passwd }" readonly>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<p>포인트</p>
									<input class="form-control valid" name="receiverHp" id="receiverHp" type="text" value="${memberDTO.point }" readonly>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<p>성별 <span>*</span></p>
									<div class="switch-wrap d-flex justify-content-between">
										남<div >
											<input type="radio" id="default-radio1"name="sex" value="m" <c:if test="${memberDTO.sex eq 'm' }">checked</c:if>>
											<label for="default-radio1"></label>
										</div>
										여<div >
											<input type="radio" id="default-radio2"name="sex" value="f" <c:if test="${memberDTO.sex eq 'f' }">checked</c:if>>
											<label for="default-radio2"></label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<p>생년월일 <span>* 수정불가능하게 변경 disable말고</span></p>
									<div class="input-group-icon mt-10">
										<div class="default-select">
											<select id="birthY">
												<c:forEach var="i" begin="0" end="2023">
													<option>${2023-i }</option>
												</c:forEach>
											</select>년
										</div>
									</div>
									<div class="input-group-icon mt-10">
										<div class="default-select">
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
											</select>월
										</div>
									</div>
									<div class="input-group-icon mt-10">
										<div class="default-select">
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
											</select>일
										</div>
									</div>
									<input type="hidden" name="dateBirth" value="${memberDTO.dateBirth }">
								</div>	<br>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<p>연락처</p>
									<input class="form-control valid" name="hp" id="hp" type="text"
										onblur="this.placeholder = '연락처를 입력하세요.'" placeholder="연락처를 입력하세요." value="${memberDTO.hp }" >
									<div class="switch-wrap d-flex justify-content-between">
										<p>CCPMS에서 발송하는 SMS소식을 수신합니다.</p>
										<div class="primary-checkbox">
											<input type="checkbox" id="primary-checkbox1" name="smsstsYn" value="Y" <c:if test="${memberDTO.smsstsYn eq 'Y' }">checked</c:if>>
											<label for="primary-checkbox1"></label>
										</div>
									</div>	
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<p>이메일</p>
									<input class="form-control valid" name="email" id="email" type="text"
										onblur="this.placeholder = '이메일을 입력하세요.'" placeholder="이메일을 입력하세요." value="${memberDTO.email }" >
									<div class="switch-wrap d-flex justify-content-between">
										<p>CCPMS에서 발송하는 E-mail을 수신합니다.</p>
										<div class="primary-checkbox">
											<input type="checkbox" id="primary-checkbox2" name="emailstsYn" value="Y" <c:if test="${memberDTO.emailstsYn eq 'Y' }">checked</c:if>>
											<label for="primary-checkbox2"></label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<p>우편번호</p>
									<input class="form-control valid" type="text" name="zipcode" id="zipcode" value="${memberDTO.zipcode }" required>
									<input type="button" class="genric-btn default" onclick="execDaumPostcode();" value="검색">
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<p>도로명주소</p>
									<input class="form-control valid" name="roadAddress" id="roadAddress" type="text" value="${memberDTO.roadAddress }" required>
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<p>지번주소</p>
									<input class="form-control valid" name="jibunAddress" id="jibunAddress" type="text" value="${memberDTO.jibunAddress }" required>
								</div>
							</div>
							<div class="col-12">
								<div class="form-group">
									<p>나머지주소</p>
									<input class="form-control valid" name="namujiAddress" id="namujiAddress" type="text" value="${memberDTO.namujiAddress }" required>
								</div>
							</div>
						</div>
						<div class="form-group mt-3" align="right">
							<button type="submit" class="button button-contactForm boxed-btn">수정</button>
						</div>
						<div class="form-group mt-3" align="left">
							<button type="button" class="button button-contactForm boxed-btn" onclick="javascript:removeMember();">회원탈퇴</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ contact section end ================= -->
</body>
</html>