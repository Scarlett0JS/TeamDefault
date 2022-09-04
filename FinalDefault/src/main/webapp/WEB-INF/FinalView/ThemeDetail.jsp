<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/slicknav.css">
    <link rel="stylesheet" href="./assets/css/animate.min.css">
    <link rel="stylesheet" href="./assets/css/animated-headline.css">
    <link rel="stylesheet" href="./assets/css/magnific-popup.css">
    <link rel="stylesheet" href="./assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="./assets/css/themify-icons.css">
    <link rel="stylesheet" href="./assets/css/slick.css">
    <link rel="stylesheet" href="./assets/css/header.css">
    <link rel="stylesheet" href="./assets/css/my.css">

    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>

    <script type="text/javascript">

		$(window).load(function(){
			let curheart = document.getElementById("HeartImg")
			let fullheart = "./assets/img/icon/heart.png"
			let binheart = "./assets/img/icon/empty_heart.png"
			
			if ("${!empty sessionScope.userVo}" == "true") {
				$.ajax({
					url: "${cpath}/ThemeLikeCheck.do",
					type: "get",
					data: {"theme_seq" : "${themeVo.theme_seq}"},
					dataType: "json",
					success: function(data){
	        			if (data.flag == "full") {
							curheart.src = fullheart
						}
					},
					error: function(){
						alert("Error")
					}
				})
			}
		})
    	
        function Load_LanguageImg(lang) {
	        let destPath = "/projectImg/reFinal_ThemeImg/ThemeImg_Concat/"
            let imgtag = document.getElementById("ThemeImg")
            let temp = imgtag.src.split("/")
            let imgLi = temp[temp.length - 1].split("%20").join(" ").split(".")[0].split("_")
            imgtag.src = destPath + [imgLi[0], imgLi[1], lang, imgLi[3]].join("_") + ".png"
        }

        function Load_FontImg(font) {
	        let destPath = "/projectImg/reFinal_ThemeImg/ThemeImg_Concat/"
            let imgtag = document.getElementById("ThemeImg")
            let temp = imgtag.src.split("/")
            let imgLi = temp[temp.length - 1].split("%20").join(" ").split(".")[0].split("_")
            imgtag.src = destPath + [imgLi[0], imgLi[1], imgLi[2], font].join("_") + ".png"
        }
		
        function updateThemeLike(theme_seq){
        	let curheart = document.getElementById("HeartImg")
        	let fullheart = "./assets/img/icon/heart.png"
        	let binheart = "./assets/img/icon/empty_heart.png"
        	if ("${!empty sessionScope.userVo }" == "true") {
	        	$.ajax({
	        		url: "${cpath}/ThemeLikeUpdate.do",
	        		type: "get",
	        		data: {"theme_seq" : theme_seq},
	        		success: function(){
	        			location.href = "${cpath}/ThemeDetail.do?seq=" + "${themeVo.theme_seq}"
	        		},
	        		error: function(){
	        			alert("Error")
	        		}
	        	})				
			} else {
				alert("Please Login")
				location.href = "${cpath}/UserLoginForm.do"
			}
        }
        
    </script>
</head>

<body>
    <jsp:include page="../header/header3.jsp" />
    <main>
        <div>
            <div role="main" class="details-container">
                <div class="row justify-content-around">
                    <!-- pt-100 pb-30 -->
                    <div class="col-sm-5 right">
                        <img id="ThemeImg"
                            src="/projectImg/reFinal_ThemeImg/ThemeImg_Concat/${themeVo.theme_filepath }" alt=""
                            class="mb-0 center rounded detail-main-img">
                    </div>
                    <div class="col-sm-5 pl-0">
                        <div class="mt-8">
                            <h1 id="theme-name">
                                <img src="${ themeVo.theme_icon }" alt="" class="theme-icon">
                                ${ themeVo.theme_name }
                            </h1>
                            <p id="theme-by">
                                ${ themeVo.theme_producer } | <img src="./assets/img/icon/download_icon.png"
                                    alt="download_icon" class="download-icon"> ${ themeVo.theme_installcnt }
                                installs | <img src="./assets/img/icon/heart.png" alt="heart" class="heart">
                                ${themeVo.theme_likes} likes
                            </p>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn-dropdown1 dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">Programming</button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item dropdown-icon" href="javascript:Load_LanguageImg('Java')"><img
                                        src="./assets/img/my_img/logo/java_logo.png" alt="">JAVA</a>
                                <a class="dropdown-item dropdown-icon2"
                                    href="javascript:Load_LanguageImg('Python')"><img
                                        src="./assets/img/my_img/logo/python_logo.png" alt="">PYTHON</a>
                                <a class="dropdown-item dropdown-icon3" href="javascript:Load_LanguageImg('HTML')"><img
                                        src="./assets/img/my_img/logo/html_logo.png" alt="">HTML</a>
                                <a class="dropdown-item dropdown-icon4"
                                    href="javascript:Load_LanguageImg('JavaScript')"><img
                                        src="./assets/img/my_img/logo/js_logo.png" alt="">JAVASCRIPT</a>
                            </div>
                        </div>
                        <div class="btn-group pl-10">
                            <button type="button" class="btn-dropdown2 dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">Fonts</button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item dropdown-icon" href="javascript:Load_FontImg('JetBrains Mono')">
                                    JetBrains
                                    Mono </a> <a class="dropdown-item dropdown-icon"
                                    href="javascript:Load_FontImg('D2coding')"> D2coding </a> <a
                                    class="dropdown-item dropdown-icon" href="javascript:Load_FontImg('Noto Sans')">
                                    Noto Sans </a> <a class="dropdown-item dropdown-icon"
                                    href="javascript:Load_FontImg('Consolas')"> Consolas </a> <a
                                    class="dropdown-item dropdown-icon" href="javascript:Load_FontImg('Fira code')">
                                    Fira code </a>
                            </div>
                        </div>
                        <div class="row pt-3">
                            <div class="col-6 pt-3">
                                <div class="pt-5">
                                    <p class="">
                                        <a href="${themeVo.theme_url}">
                                            <button type="button" class="btn-install">
                                                Install Theme <img src="./assets/img/icon/download_icon.png"
                                                    alt="install_icon" class="install-icon">
                                            </button>
                                        </a>
                                        <button type="button" class="btn-commuview-heart" id="heart" onclick="javascript:updateThemeLike('${themeVo.theme_seq}')">
                                            <img src="./assets/img/icon/empty_heart.png" width="32px" id="HeartImg">
                                        </button>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="./assets/js/jquery.slicknav.min.js"></script>
    <script src="./assets/js/hover-direction-snake.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/header.js"></script>
    <script src="./assets/js/main.js"></script>
</body>

</html>