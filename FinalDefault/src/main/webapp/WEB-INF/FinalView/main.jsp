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
        function Load_ColorSelect() {
            location.href = "${cpath}/ColorSelect.do"
        }
        
		function Load_ThemeDetail(theme_seq){
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
                                    <span data-animation="fadeInLeft" data-delay=".3s">Best Domain & hosting
                                        service
                                        provider</span>
                                    <h1 data-animation="fadeInLeft" data-delay=".6s ">It only takes 5 minutes to
                                        get
                                        your theme</h1>
                                    <p data-animation="fadeInLeft" data-delay=".8s">Supercharge your WordPress
                                        hosting
                                        with detailed
                                        website analytics, marketing tools, security, and data
                                        backups all in one place.</p>
                                    <!-- Slider btn -->
                                    <!-- 슬라이더 애니메이션 넣기 -->
                                    <div class="slider-btns">
                                        <!--Hero form -->
                                        <form action="#" class="search-box">
                                            <div class="input-form">
                                                <input type="text" placeholder="Search">
                                                <!-- icon search -->
                                                <div class="search-form">
                                                    <button><i class="ti-search"></i></button>
                                                </div>
                                                <!-- icon search -->
                                                <div class="world-form">
                                                    <i class="fas fa-globe"></i>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-6">
                                <div class="hero__img d-none d-lg-block f-right">
                                    <!-- main image -->
                                    <img src="./assets/img/my_img/mainEx.png" alt="" data-animation="fadeInRight"
                                        data-delay="1s">
                                </div>
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
                            <h2>How to use</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <div class="single-cat">
                            <div class="cat-icon">
                                <img src="" alt="">
                            </div>
                            <div class="cat-cap">
                                <h5><a href="#">d</a></h5>
                                <p>내용</p>
                                <button class='btn-e' onclick="javascript:Load_ColorSelect()">Color Select</button>
                            </div>
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
                                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Unde, sunt. Facere
                                    laboriosam earum, iure
                                    aut
                                    mollitia voluptates animi fuga sunt suscipit voluptas soluta non totam, amet
                                    incidunt temporibus
                                    minima
                                    nesciunt?</p>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="container">
                            <div class="row">
								<c:forEach var="theme" items="${mostTheme}">
									<div class="col-md-4">
	                                    <div class="card mb-4 shadow-sm">
	                                        <img class="card-img-top" src="./assets/img/reFinal_ThemeImg/ThemeImg_Concat/${theme.theme_filepath }" alt="">
	                                        <div class="card-body">
	                                            <p class="card-text"><a href = "javascript:Load_ThemeDetail(${theme.theme_seq })"> ${ theme.theme_name } </a></p>
	                                            <div class="d-flex justify-content-between align-items-center">
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
        <!-- 🥕 -->
        <div class="bg-light">
            <div role="main" class="container">
                <div class="row">
                    <div class="col-6 center font-white">
                        <div class="my-3 p-3 black-background rounded">
                            <h2 class="mb-0 font-35px center font-weight-bold font font-white">Most Popular Extension</h2>
                            <div class="media text-muted pt-3">
                                <img data-src="" alt="" class="mr-2 rounded">
                            </div>
                            <div>
                                <c:forEach var="allEx" items="${allExList}">
                                    <div class="media text-muted pt-3 ">
                                        <p>
                                            <a href="${ allEx.ex_url }"><img src="${allEx.ex_filepath}" class="icon1"></a>
                                        </p>
                                        <p class="media-body pb-3 mb-0 small lh-125 font-12px px-4">
                                            <strong class="d-block text-gray-dark font-20px">${ allEx.ex_name }</strong>
                                            CreatorName : ${ allEx.ex_producer }
                                            <br>
                                            ${ allEx.ex_detail }
                                        </p>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 center font-white">
                        <div class="my-3 p-3 black-background rounded">
                            <h2 class="mb-0 font-35px center font-weight-bold font font-white">Most Util Extension</h2>
                            <div class="media text-muted pt-3">
                                <img data-src="" alt="" class="mr-2 rounded">
                            </div>
                            <div>
                                <c:forEach var="otherEx" items="${otherExList}">
                                    <div class="media text-muted pt-3 ">
                                        <p>
                                            <a href="${ otherEx.ex_url }"><img src="${otherEx.ex_filepath}" class="icon1"></a>
                                        </p>
                                        <p class="media-body pb-3 mb-0 small lh-125 font-12px px-4">
                                            <strong class="d-block text-gray-dark font-20px">${ otherEx.ex_name
                                                }</strong>
                                            CreatorName : ${ otherEx.ex_producer }
                                            <br>
                                            ${ otherEx.ex_detail }
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
    <!-- 🥕 -->
    <footer>
        <div class="footer-wrappr " data-background="">
            <div class="footer-area footer-padding ">
                <div class="container">
                    <div class="row d-flex justify-content-between">
                        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                            <div class="single-footer-caption mb-50">
                                <!-- logo -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- footer-bottom area -->
            <div class="footer-bottom-area">
                <div class="container">
                    <div class="footer-border">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="footer-copy-right text-center">
                                    <p></p>
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