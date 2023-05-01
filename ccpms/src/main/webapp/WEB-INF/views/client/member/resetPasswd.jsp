<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$().ready(function(){
	
		$("#confirmPasswd").blur(function(){
			if($("#passwd").val() == $("#confirmPasswd").val()){
				$("#msg").html("<span style='color:green;'>비밀번호 일치</span>")
				
			}
			else{
				$("#msg").html("<span style='color:red;'>비밀번호 불일치</span>")
			}
		});
	
		$("form").submit(function(){
			if($("#passwd").val() != $("#confirmPasswd").val()){
				alert("비밀번호를 확인하세요.");
				$("#passwd").focus();
				return false;
			}
			
			if($("#passwd").val().length < 7){
				alert("비밀번호가 너무 짧습니다.");
				$("#passwd").focus();
				return false;
			}
		});
	});
</script>
</head>
<body>
	<!-- Support Company Start-->
        <div class="support-company-area servic-padding fix">
            <div class="container">
                <form action="${contextPath }/member/resetPasswd" method="post">
                	<input type="hidden" name="memberId" value="${memberDTO.memberId }">
                	<div>
                		<h5>비밀번호 재설정</h5>
							<div class="mt-10">
								<p>새 비밀번호 <span>*8자리 이상으로 작성하세요.</span></p>
								<input type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요."
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'Passwd'" required class="single-input">
							</div>	<br>
							
							<div class="mt-10">
								<p>새 비밀번호 확인 <span>*</span></p>
								<input type="password" id="confirmPasswd" placeholder="비밀번호를 입력하세요."	
										onfocus="this.placeholder = ''" onblur="this.placeholder = 'confirmPasswd'" required class="single-input"><span id="msg"></span>
							</div>	<br>
							
							<div align="right">
								<input type="submit" class="genric-btn success radius" value="확인">
							</div>
							
					</div>
				</form>
            </div>
        </div>
        <!-- Support Company End-->
</body>
</html>