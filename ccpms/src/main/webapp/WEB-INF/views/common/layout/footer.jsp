<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<footer>
		<!-- Footer Start-->
		<div class="footer-area footer-padding footer-bg"
			data-background="${contextPath }/resources/gotrip-master/assets/img/main/footerImage.jpg">
			<div class="container">
				<div class="row d-flex justify-content-between">
					<div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
						<div class="single-footer-caption mb-50">
							<div class="single-footer-caption mb-30">
								<!-- logo -->
								<div class="footer-logo">
									<a href="${contextPath }/"><img
										src="${contextPath }/resources/gotrip-master/assets/img/logo/ccpms_outline.svg"
										alt=""></a>
								</div>
								<div class="footer-tittle">
									<div class="footer-pera">
										<p>Lorem iaspsum doldfor sit amvset, consectetur
											adipisicing cvelit csed do eiusmod tempor incididucvccnt ut
											labovre.</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-2 col-lg-3 col-md-3 col-sm-5">
						<div class="single-footer-caption mb-50">
							<div class="footer-tittle">
								<h4>Quick Links</h4>
								<ul>
									<li><a href="${contextPath }/">HOME</a></li>
									<li><a href="${contextPath }/goods/goodsList?sort=all&part=all&genre=all&location=all">공연목록</a></li>
									<li><a href="${contextPath }/myPage/myInfo?memberId=${sessionScope.memberId}">내정보</a></li>
									<li><a href="${contextPath }/contact/FAQ">고객센터</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
						<div class="single-footer-caption mb-50">
							<div class="footer-tittle">
								<h4>New Products</h4>
								<ul>
									<li><a href="${contextPath }/goods/goodsList?sort=musical&part=all&genre=all&location=all">뮤지컬</a></li>
									<li><a href="${contextPath }/goods/goodsList?sort=consert&part=all&genre=all&location=all">콘서트</a></li>
									<li><a href="${contextPath }/goods/goodsList?sort=classic&part=all&genre=all&location=all">클래식</a></li>
									<li><a href="${contextPath }/goods/goodsList?sort=theater&part=all&genre=all&location=all">연극</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-5 col-sm-7">
						<div class="single-footer-caption mb-50">
							<div class="footer-tittle">
								<ul>
									<li><a href="#"><i class="fab fa-twitter"></i></li>
									<li><a href="#"><i class="fab fa-facebook-f"></i></li>
									<li><a href="#"><i class="fab fa-behance"></i></li>
									<li><a href="#"><i class="fas fa-globe"></i></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- Footer bottom -->
				<div class="row pt-padding">
					<div class="col-xl-7 col-lg-7 col-md-7">
						<div class="footer-copy-right">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="ti-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
					</div>
					<div class="col-xl-5 col-lg-5 col-md-5">
						<!-- social -->
						<div class="footer-social f-right">
							<a href="#"><i class="fab fa-twitter"></i></a> 
							<a href="#"><i class="fab fa-facebook-f"></i></a> 
							<a href="#"><i class="fab fa-behance"></i></a> 
							<a href="#"><i class="fas fa-globe"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Footer End-->
	</footer>

</body>
</html>