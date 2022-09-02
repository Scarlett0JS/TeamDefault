<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

  <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
  <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
  
  <script type="text/javascript">
  	function Load_colorSelect(){
  		location.href = "${cpath}/ColorSelect.do"
  	}
  	
  	function Load_ThemeDetail(seq){
  		location.href = "${cpath}/ThemeDetail.do?seq=" + String(seq)
  	}
  </script>
  
</head>

<body>
  <jsp:include page="../header/header3.jsp" />
  <main>
    <div class="center pt-10 theme-list-title">
      <h1>Recommendation Theme List</h1>
      <button class='btn-e' onclick="javascript:Load_colorSelect()">Color Select</button>
    </div>
    <div class="container">
      <div class="pt-5">
        <div class="row">
          <c:forEach var="themeData" items="${ themeVo }">
            <div class="col">
              <div class="card-li mb-4 shadow-sm">
                <img class="card-li-img-top rounded" src="./assets/img/reFinal_ThemeImg/ThemeImg_Concat/${themeData.theme_filepath }" alt="">
                <div class="card-li-body">
                  <p class="themeName-li"><a href="javascript:Load_ThemeDetail(${ themeData.theme_seq })">${themeData.theme_name}</a></p>
                  <p id="theme-by-li">${themeData.theme_producer}
                    <img src="./assets/img/icon/download_icon.png" alt="download_icon" class="download-icon-li"> ${themeData.theme_installcnt} |
                    <img src="./assets/img/icon/heart.png" alt="heart" class="heart-li"> ${themeData.theme_likes}
                  </p>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
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