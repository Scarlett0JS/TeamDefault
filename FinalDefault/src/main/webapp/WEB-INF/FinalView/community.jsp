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
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/css/boardstyles.css">
    <link rel="stylesheet" href="./assets/css/my.css">

    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
	            html += "<td><a href = 'javascript:LoadBoardView(" + obj.d_seq + ")'>" + obj.d_title + "</a></td>"
	            html += "<td>" + obj.d_date + "</td>"
	            html += "<td>" + obj.d_cnt + "</td>"
	            html += "</tr>"
	        })
	        html += "</tbody>"
	        html += "</table>"
	        $("#allBoardList").html(html)
	        $("#allBoardListMain").css("display", "block")
	        $("#allBoardList").css("display", "block")
	    }
	
	    function LoadBoardView(num) {
	        $.ajax({
	            url: "${cpath}/UserBoardView.do",
	            type: "get",
	            data: { "num": num },
	            success: (BoardViewData) => {
 	                let html = "<div class='row'>"
	
	                /* Content */
	                html += "<article>"
	                html += "<br class='mb-4'>"
	                html += "<h1 class='fw-bolder mb-1'>" + BoardViewData.d_title + "</h1><br>"
	                html += "<div class='text-muted fst-italic mb-2'>" + BoardViewData.user_id + "</div><br>"
	                html += "<section class='mb-5'>"
	                html += "<p class='fs-5 mb-4'>" + BoardViewData.d_content.replace(/\r\n/ig, '</br>') + "</p>"
	                html += "</section>"
	                html += "</article>"
	
	                /* Comment */
	                html += "<section class='mb-5'>"
	                html += "<div class='card bg-light'>"
	                html += "</div>"
	                html += "<form class='mb-4'>"
	                html += "<textarea class='form-control' rows='3' placeholder='Join the discussion and leave a comment!''></textarea>"
	                html += "</form>"
	                html += "<div class='d-flex'>"
	                html += "<div class='flex-shrink-0'>"
	                html += "<img class='rounded-circle' src='https://dummyimage.com/50x50/ced4da/6c757d.jpg' alt='...'/>"
	                html += "</div>"
	                html += "<div class='ms-3'>"
	                html += "<div class='fw-bold'>Commenter Name</div>"
	                html += "When I look at the universe and all the ways the universe wants to kill us"
	                html += "</div>"
	                html += "</div>"
	                html += "</div>"
	                html += "</div>"
	                html += "</section>"
	
	                /* End */
	                html += "</div>"
	                html += "</div>"
	                html += "</div>"
	             	$("#BoardView").html(html)
	        	    $("#allBoardListMain").css("display", "none")
	        	    $("#allBoardList").css("display", "none")
	        	    $("#BoardView").css("display", "block")
	            },
	            error: function () {
	                alert("Error")
	            }
	        })
	    }
        
    </script>
</head>

<body>
    <jsp:include page="../header/header2.jsp" />
    <main id="allBoardListMain" style="display:none">
        <div class="container" id="community-c">
            <div class="row">
                <div class="col-md-12 center">
                    <h1>Community</h1>
                    <br>
                    <br>
                    <div id="allBoardList" style="display:none"></div>
                    <div class="center">
                    </div>
                </div>
            </div>
        </div>
    </main>
    <div class="container mt-5" id="BoardView" style="display:none"></div>
    
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