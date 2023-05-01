<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Wellcome To CCPMS! </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
		<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

		<!-- CSS here -->
            <link rel="stylesheet" href="${contextPath }/resources/gotrip-master/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="${contextPath }/resources/gotrip-master/assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="${contextPath }/resources/gotrip-master/assets/css/flaticon.css">
            <link rel="stylesheet" href="${contextPath }/resources/gotrip-master/assets/css/slicknav.css">
            <link rel="stylesheet" href="${contextPath }/resources/gotrip-master/assets/css/animate.min.css">
            <link rel="stylesheet" href="${contextPath }/resources/gotrip-master/assets/css/magnific-popup.css">
            <link rel="stylesheet" href="${contextPath }/resources/gotrip-master/assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="${contextPath }/resources/gotrip-master/assets/css/themify-icons.css">
            <link rel="stylesheet" href="${contextPath }/resources/gotrip-master/assets/css/slick.css">
            <link rel="stylesheet" href="${contextPath }/resources/gotrip-master/assets/css/nice-select.css">
            <link rel="stylesheet" href="${contextPath }/resources/gotrip-master/assets/css/style.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script src="${contextPath }/resources/gotrip-master/assets/js/vendor/jquery-3.3.1.min.js"></script>
            <script src="${contextPath}/resources/ckeditor/ckeditor.js"></script>
            <script>
				function execDaumPostcode() {
				    new daum.Postcode({
				        oncomplete: function(data) {
				
				            var fullRoadAddr = data.roadAddress; 
				            var extraRoadAddr = ''; 
				
				            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                extraRoadAddr += data.bname;
				            }
				            if (data.buildingName !== '' && data.apartment === 'Y'){
				               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				            }
				            if (extraRoadAddr !== ''){
				                extraRoadAddr = ' (' + extraRoadAddr + ')';
				            }
				            if (fullRoadAddr !== ''){
				                fullRoadAddr += extraRoadAddr;
				            }
				
				            document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
				            document.getElementById('roadAddress').value = fullRoadAddr;
				            document.getElementById('jibunAddress').value = data.jibunAddress;
				          
				        }
				    }).open();
				}
			</script>
   </head>

   <body>
	    
	    <!-- Header Section Begin -->
	    	<tiles:insertAttribute name="header" />
	    <!-- Header Section End -->
	
		<!-- Main Section Begin -->
		    <tiles:insertAttribute name="body" />
	    <!-- Main Section End -->
	    
	    <!-- Footer Section Begin -->
			<tiles:insertAttribute name="footer" />
		<!-- Footer Section End -->
	
		<!-- JS here -->
		
			<!-- All JS Custom Plugins Link Here here -->
	        <script src="${contextPath }/resources/gotrip-master/assets/js/vendor/modernizr-3.5.0.min.js"></script>
			
			<!-- Jquery, Popper, Bootstrap -->
			
	        <script src="${contextPath }/resources/gotrip-master/assets/js/popper.min.js"></script>
	        <script src="${contextPath }/resources/gotrip-master/assets/js/bootstrap.min.js"></script>
		    <!-- Jquery Mobile Menu -->
	        <script src="${contextPath }/resources/gotrip-master/assets/js/jquery.slicknav.min.js"></script>
	
			<!-- Jquery Slick , Owl-Carousel Plugins -->
	        <script src="${contextPath }/resources/gotrip-master/assets/js/owl.carousel.min.js"></script>
	        <script src="${contextPath }/resources/gotrip-master/assets/js/slick.min.js"></script>
			<!-- One Page, Animated-HeadLin -->
	        <script src="${contextPath }/resources/gotrip-master/assets/js/wow.min.js"></script>
			<script src="${contextPath }/resources/gotrip-master/assets/js/animated.headline.js"></script>
	        <script src="${contextPath }/resources/gotrip-master/assets/js/jquery.magnific-popup.js"></script>
	
			<!-- Scrollup, nice-select, sticky -->
	        <script src="${contextPath }/resources/gotrip-master/assets/js/jquery.scrollUp.min.js"></script>
	        <script src="${contextPath }/resources/gotrip-master/assets/js/jquery.nice-select.min.js"></script>
			<script src="${contextPath }/resources/gotrip-master/assets/js/jquery.sticky.js"></script>
	        
	        <!-- contact js -->
	        <script src="${contextPath }/resources/gotrip-master/assets/js/contact.js"></script>
	        <script src="${contextPath }/resources/gotrip-master/assets/js/jquery.form.js"></script>
	        <script src="${contextPath }/resources/gotrip-master/assets/js/jquery.validate.min.js"></script>
	        <script src="${contextPath }/resources/gotrip-master/assets/js/mail-script.js"></script>
	        <script src="${contextPath }/resources/gotrip-master/assets/js/jquery.ajaxchimp.min.js"></script>
	        
			<!-- Jquery Plugins, main Jquery -->	
	        <script src="${contextPath }/resources/gotrip-master/assets/js/plugins.js"></script>
	        <script src="${contextPath }/resources/gotrip-master/assets/js/main.js"></script>
	        
	   </body>
</html>