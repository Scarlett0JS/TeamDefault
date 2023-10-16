<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html class="no-js">

<head>
<meta charset="UTF-8">
<title>Default</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/slicknav.css">
<link rel="stylesheet" href="./assets/css/animate.min.css">
<link rel="stylesheet" href="./assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="./assets/css/themify-icons.css">
<link rel="stylesheet" href="./assets/css/slick.css">
<link rel="stylesheet" href="./assets/css/header.css">
<link rel="stylesheet" href="./assets/css/style.css">
<link rel="stylesheet" href="./assets/css/my.css">


<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>

<script type="text/javascript">
        $(document).ready(function () {
            $("#userinputImg").on('change', function () {
                var fileName = $("#userinputImg").val()
                $("#inputlabel").html(fileName);
            })
        })

        function Load_ColorSelect() {
            location.href = "${cpath}/ColorSelect.do"
        }

        function Load_ThemeDetail(theme_seq) {
            location.href = "${cpath}/ThemeDetail.do?seq=" + String(theme_seq)
        }
    </script>

</head>

<body>
	<jsp:include page="../header/header.jsp" />
	<main>
		<!-- Slider Area Start-->
		<div class="slider-area slider-bg ">
			<div class="slider-active">
				<!-- Single Slider -->
				<div class="single-slider d-flex align-items-center slider-height ">
					<div class="container">
						<div class="row align-items-center justify-content-between">
							<div class="col-xl-5 col-lg-5 col-md-9 ">
								<div class="hero__caption">
									<h1 data-animation="fadeInLeft" data-delay=".6s ">Find
										Fabulous Themes with Just a Click</h1>
									<p data-animation="fadeInLeft" data-delay=".8s">Color
										themes from the Marketplace let you modify the colors in
										Visual Studio Code's user interface to suit your preferences
										and work environment.</p>
									<!-- Slider btn -->
									<!-- 슬라이더 애니메이션 넣기 -->
									<div class="slider-btns">
										<!--Hero form -->
										<form action="${cpath}/ThemeSearch.do" class="search-box"
											method="post">
											<div class="input-form">
												<input type="text" id="ThemeSearch" name="ThemeSearch"
													placeholder="Search">
												<div class="search-form">
													<button type="submit" name="submit">
														<i class="ti-search"></i>
													</button>
												</div>
												<div class="world-form">
													<i class="fas fa-globe"></i>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6">
								<div class="hero__img d-none d-lg-block f-right moving-main-img"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<section class="team-area section-padding20 section-bg1">
			<div class="container">

				<div class="row justify-content-center">
					<div class="col-xl-12">
						<div class="section-tittle text-center mb-105">
							<h2>Find Your Theme</h2>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-9">
						<div class="single-cat">
							<div class="cat-icon">
								<img class="colorRecomm"
									src="./assets/img/my_img/colorRecomm.png" alt="">
							</div>
						</div>
					</div>
					<div class="col-3">
						<div class="cat-cap">
							<h3>With Colors</h3>
							<button class='btn-e' onclick="javascript:Load_ColorSelect()">Color
								Select</button>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-9">
						<div class="single-cat">
							<div class="cat-icon">
								<img class="colorRecomm" src="./assets/img/my_img/imgRecomm.png"
									alt="">
							</div>
						</div>
					</div>
					<div class="col-3">
						<div class="cat-cap-image">
							<h3 class="image-h5-1">With Image</h3>
							<p class="image-p-2">Select Program language</p>
							<form action="${cpath}/ImageSelectFromUser.do" id="fileForm"
								name="fileForm" method="POST" enctype="multipart/form-data">
								<input id="userinputImg" name="userinputImg" type="file"
									accept=".jpg, .jpeg, .png" style="display: none"> <select
									name="Language" id="Language" class="btn-lang">
									<option value="Python" class="python blue left" selected>Python</option>
									<option value="Java" class="java red left">Java</option>
									<option value="HTML" class="html orange left">Html</option>
									<option value="JavaScript" class="js yellow left">Javascript
									</option>
								</select> <input id="imgSubmit" name="imgSubmit" type="submit"
									style="display: none">
							</form>
							<br>
							<button class='btn-color-s' id="imgButton"
								onclick="document.fileForm.userinputImg.click()">Select
								Image</button>
							<br>
							<p class="image-p-3" id="inputlabel">No Images</p>
							<button class='btn-e'
								onclick="document.fileForm.imgSubmit.click()">Submit</button>
						</div>
					</div>
				</div>
			</div>

		</section>
		<div class="about-area1 section-padding20">
			<section class="pricing-card-area fix">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-xl-8 col-lg-2">
							<div class="section-tittle text-center mb-30 font-40px">
								<h2>Most popular Themes</h2>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Unde, sunt. Facere laboriosam earum, iure aut mollitia
									voluptates animi fuga sunt suscipit voluptas soluta non totam,
									amet incidunt temporibus minima nesciunt?</p>
							</div>
						</div>
					</div>
					<div>
						<div class="container">
							<div class="row">
								<c:forEach var="theme" items="${mostTheme}">
									<div class="col-md-4">
										<div class="card mb-4 shadow-sm">
											<img class="card-img-top rounded"
												src="/projectImg/reFinal_ThemeImg/ThemeImg_Concat_F/${theme.theme_filepath}"
												alt="fuck">
											<div class="card-body">
												<p class="card-text">
													<a href="javascript:Load_ThemeDetail(${theme.theme_seq })">${ theme.theme_name } </a>
												</p>
												<div
													class="d-flex justify-content-between align-items-center">
													<small class="text-muted"></small>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<div class="extension">
			<div role="main" class="container">
				<div class="row">
					<div class="col-6 center font-white">
						<div class="my-3 p-3 black-background all-rounded">
							<h2
								class="mb-5 font-35px center font-weight-bold font font-white ">Most
								Popular Extension</h2>
							<div>
								<c:forEach var="allEx" items="${allExList}">
									<div class="media text-muted pt-5">
										<p>
											<a href="${ allEx.ex_url }"><img
												src="${allEx.ex_filepath}" class="icon1"></a>
										</p>
										<p class="media-body pb-3 mb-0 small lh-125 font-12px px-4">
											<strong class="d-block text-gray-dark font-20px">${
                                                allEx.ex_name }</strong>
											CreatorName : ${ allEx.ex_producer } <br> ${ allEx.ex_detail
                                            }
										</p>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="col-6 center font-white">
						<div class="my-3 p-3 black-background all-rounded">
							<h2
								class="mb-5 font-35px center font-weight-bold font font-white">Most
								Util Extension</h2>
							<div>
								<c:forEach var="otherEx" items="${otherExList}">
									<div class="media text-muted pt-5">
										<p>
											<a href="${ otherEx.ex_url }"><img
												src="${otherEx.ex_filepath}" class="icon1"></a>
										</p>
										<p class="media-body pb-3 mb-0 small lh-125 font-12px px-4">
											<strong class="d-block text-gray-dark font-20px">${
                                                otherEx.ex_name
                                                }</strong>
											CreatorName : ${ otherEx.ex_producer } <br> ${
                                            otherEx.ex_detail }
										</p>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer>
		<div class="footer-wrappr " data-background="">
			<!-- footer-bottom area -->
			<div class="footer-bottom-area">
				<div class="container-footer">
					<div class="footer-border">
						<div class="row">
							<div class="col-xl-12">
								<div class="footer-copy-right text-center">
									<div class="footer-social mt-50">
										<a href="https://www.instagram.com/js_scarlett1010"><i
											class="fab fa-instagram"></i></a> <a><i
											class="fab fa-slack-hash"></i></a> <a
											href="https://github.com/PringlesHair/First_Project"><i
											class="fab fa-github"></i></a> <a
											href="https://www.youtube.com/watch?v=RN_3gnuGoNQ"><i
											class="fab fa-youtube"></i></a>
									</div>
									<p class="mt-50">
										<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
										Copyright &copy;
										<script>document.write(new Date().getFullYear());</script>
										All rights reserved | This template is made with by Default
										<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Scroll Up -->
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<script src="./assets/js/bootstrap.min.js"></script>
	<script src="./assets/js/jquery.slicknav.min.js"></script>
	<script src="./assets/js/slick.min.js"></script>
	<script src="./assets/js/wow.min.js"></script>
	<script src="./assets/js/animated.headline.js"></script>
	<script src="./assets/js/jquery.barfiller.js"></script>
	<script src="./assets/js/waypoints.min.js"></script>
	<script src="./assets/js/hover-direction-snake.min.js"></script>
	<script src="./assets/js/plugins.js"></script>
	<script src="./assets/js/main.js"></script>

</body>

</html>