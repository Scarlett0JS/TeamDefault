<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<c:set var="sessionV" value="${session.userVo}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Default</title>
<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/slick.css">
<link rel="stylesheet" href="./assets/css/animate.min.css">
<link rel="stylesheet" href="./assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="./assets/css/header.css">
<link rel="stylesheet" href="./assets/css/color_copy.css">
<link rel="stylesheet" href="./assets/css/my.css">


<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
        $(document).ready(function () {
            LoadColorList()
        })

        function LoadColorList() {
            $.ajax({
                url: "${cpath}/ColorAllList.do",
                type: "get",
                dataType: "json",
                success: loadColor,
                error: function () {
                    alert("error")
                }
            })
        }

        function loadColor(data) {
            var tag = ""
            $.each(data, function(idx, obj){
            	tag += "<div id=" + obj.html_code + " class='cocircle' onclick='colorSet(this)'></div>";
            })

            document.getElementById("cocorow").innerHTML = tag;

            var colorBox = document.getElementsByClassName("cocircle");
            for (i = 0; i < colorBox.length; i++) {
                colorBox[i].style.background = colorBox[i].id;
            }
        }

        //onclick event
        let num = 0;
        
        function colorSet(target) {
            var beforeColor;
            if (num == 5) {
                $('.service-icon-five').attr("id", "");
                $('div').removeClass('activered');
            } else {
                $('#tt').css("background", target.id); // 아이디가 'tt'인 곳에 색상 넣기

                $($('.service-icon-five').get()[num]).attr("id", "");
                num++;
                $($('.service-icon-five').get()[num]).attr("id", "tt");
                document.getElementById(target.id).className += " cdisabled";
                if (beforeColor != undefined && beforeColor != null) { // 다중선택 안 되게 해주는 조건
                    document.getElementById(beforeColor).className = document.getElementById(beforeColor).className.replace(" activered", "");
                }

                //선택한 색상 표시 기능
                document.getElementById(target.id).className += " activered";
                beforeColor = target.id;
            }
        }


        function emp() {
            location.href = "${cpath}/ColorSelect.do"
        }

        function colorsubmit() {
        		console.log("진짜 미춰버리겠네 안지수")
            let selection = "";
            for (i = 0; i <= 4; i++) {
            	selection += String(i+1) + "=" + $($('.service-icon-five')[i]).css('background-color').slice(4,-1) + "&"
            	}
            location.href = "${cpath}/ColorSelectedFromUser.do?" + selection
      	}
    </script>
</head>

<body>
	<jsp:include page="../header/header3.jsp" />
	<!-- Color Select-->
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-2 col-sm-6 ">
				<div class="service-box1">
					<div class="service-icon-five" id="tt"></div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6 ">
				<div class="service-box">
					<div class="service-icon-five"></div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6 ">
				<div class="service-box">
					<div class="service-icon-five"></div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6 ">
				<div class="service-box">
					<div class="service-icon-five"></div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6 ">
				<div class="service-box">
					<div class="service-icon-five"></div>
				</div>
			</div>
			<div class="col-md-2 col-sm-6 ">
				<div class="btn-group_color center pb-5">
					<button type="button" class="btn-dropdown1 dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">언어선택
					</button>
					<div class="dropdown-menu">
						<a class="dropdown-item dropdown-icon" href="#">JAVA</a> <a
							class="dropdown-item dropdown-icon2" href="#">PYTHON</a> <a
							class="dropdown-item dropdown-icon3" href="#">HTML</a> <a
							class="dropdown-item dropdown-icon4" href="#">JAVASCRIPT</a>
					</div>
				</div>
				<button type="button" class="emp-btn" onclick="javascript:emp()">EMPTY</button>
				<button type="button" class="sel-btn"
					onclick="javascript:colorsubmit()">COLOR SELECTION</button>
			</div>

		</div>
	</div>
	<br>
	<Br>
	<div class="container" id="cocontainer">
		<div class="row" id="cocorow"></div>
	</div>
	<Br>
	<Br>
	<script>

    </script>

	<script src="./assets/js/jquery.slicknav.min.js"></script>
	<script src="./assets/js/hover-direction-snake.min.js"></script>
	<script src="./assets/js/popper.min.js"></script>
	<script src="./assets/js/slick.min.js"></script>
	<script src="./assets/js/animated.headline.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<script src="./assets/js/plugins.js"></script>
	<script src="./assets/js/header.js"></script>
	<script src="./assets/js/main.js"></script>
</body>

</html>