<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Default</title>
    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/slicknav.css">
    <link rel="stylesheet" href="./assets/css/animate.min.css">
    <link rel="stylesheet" href="./assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="./assets/css/slick.css">
    <link rel="stylesheet" href="./assets/css/boardstyles.css">
    <link rel="stylesheet" href="./assets/css/my.css">
    <link rel="stylesheet" href="./assets/css/header.css">

    <!-- JS here -->
    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    
	
</head>

<body>
    <jsp:include page="../header/header2.jsp" />
    <main>
        <div class="center pt-10 theme-list-title">
            <h1>Themes for Visual Studio Code</h1>
        </div>
        <div class="container">
            <div class="pt-5">
                <div class="row">
                    <c:forEach var="theme" items="${themeVo}" varStatus="cnt">
                        <div class="col">
                            <div class="card-li mb-4 shadow-sm">
                                <img class="card-li-img-top rounded" src="./assets/img/reFinal_ThemeImg/ThemeImg_Concat/${theme.theme_filepath }" alt="">
                                <div class="card-li-body">
                                    <p class="themeName-li"><a href="${theme.theme_url}">${theme.theme_name} | ${theme.theme_lang}</a></p>
                                    <p id="theme-by-li">${theme.theme_producer}
                                        <img src="./assets/img/icon/download_icon.png" alt="download_icon"
                                            class="download-icon-li"> ${theme.theme_installcnt} |
                                        <img src="./assets/img/icon/heart.png" alt="heart" class="heart-li"> ${theme.theme_likes}
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center pagination-lg">
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                    <c:forEach var="page" begin="${paging.start}" end="${ paging.end }">
	                    <li class="page-item"><a class="page-link" href="${cpath}/ThemeAllList.do?page=${page}">${ page }</a></li>
                    </c:forEach>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </main>
    <footer>

    </footer>

    <script src="./assets/js/jquery.slicknav.min.js"></script>
    <script src="./assets/js/hover-direction-snake.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/header.js"></script>
    <script src="./assets/js/main.js"></script>
</body>

</html>