<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Community</title>

<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/slicknav.css">
<link rel="stylesheet" href="./assets/css/animate.min.css">
<link rel="stylesheet" href="./assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="./assets/css/slick.css">
<link rel="stylesheet" href="./assets/css/boardstyles.css">
<link rel="stylesheet" href="./assets/css/my.css">
<link rel="stylesheet" href="./assets/css/header.css">

<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
	    $(document).ready(function () {
	        loadBoardList()
	    })
	
	    function loadBoardList() {
	        $.ajax({
	            url: "${cpath}/UserBoardList.do",
	            type: "get",
	            dataType: "json",
	            success: BoardHtml,
	            error: function () {
	                alert("error")
	            }
	        })
	    }
	
	    function BoardHtml(data) {
	        let html = "<table class='table'>"
	        html += "<thead>"
	        html += "<tr calss='community-a'>"
	        html += "<th> Writer </th>"
	        html += "<th> Tilte </th>"
	        html += "<th> Date </th>"
	        html += "<th> hits </th>"
	        html += "</tr>"
	        html += "</thead>"
	        html += "<tbody>"
	        $.each(data, function (idx, obj) {
	            html += "<tr class='community-a'>"
	            html += "<td>" + obj.user_id + "</td>"
	            html += "<td><a href = '${cpath}/UserBoardView.do?num="+ obj.d_seq + "'>" + obj.d_title + "</a></td>"
	            html += "<td>" + obj.d_date.split(" ")[0] + "</td>"
	            html += "<td>" + obj.d_cnt + "</td>"
	            html += "</tr>"
	        })
	        html += "</tbody>"
	        html += "</table>"
	        $("#allBoardList").html(html)
	        $("#allBoardListMain").css("display", "block")
	        $("#allBoardList").css("display", "block")
	    }
	    
	    function Load_Write(){
	    	if ("${!empty sessionScope.userVo }" == "true") {
		    	location.href = "${cpath}/UserBoardWriteForm.do?lang=all"				
			} else {
				alert("Please Login")
				location.href = "${cpath}/UserLoginForm.do"
			}
	    }
    </script>
</head>

<body>
	<jsp:include page="../header/header2.jsp" />
	<main id="allBoardListMain" style="display: none">
		<div class="container" id="community-c">
			<div class="row">
				<div class="col-md-12 center">
					<h1>Community</h1>
					<br> <br>
					<div id="allBoardList" style="display: none"></div>
					<!-- <div class="center">
	                    <button class='btn' onclick="javascript:Load_Write()">Write</button>
                    </div> -->
				</div>
			</div>
		</div>
	</main>
	<div id="back-top">
		<a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
	</div>

	<script src="./assets/js/jquery.slicknav.min.js"></script>
	<script src="./assets/js/hover-direction-snake.min.js"></script>
	<script src="./assets/js/slick.min.js"></script>
	<script src="./assets/js/animated.headline.js"></script>
	<script src="./assets/js/plugins.js"></script>
	<script src="./assets/js/header.js"></script>
	<script src="./assets/js/main.js"></script>

</body>

</html>