<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

	<!-- table template -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css" integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons">
    <style>
   
	.btn.btn-danger:hover {
    box-shadow: 0 14px 26px -12px rgba(244,67,54,.42), 
                0 4px 23px 0 rgba(0,0,0,.12), 
                0 8px 10px -5px rgba(244,67,54,.2) !important;
    background-color: #f33527 !important;            
	}
	.btn.btn-sm{
    border-radius:3px !important;
	}
	
	.btn.btn-just-icon.btn-sm {
	    height: 30px;
	    min-width: 30px;
	    width: 30px;
	}
	
	.btn.btn-just-icon {
	    font-size: 24px;
	    height: 41px;
	    min-width: 41px;
	    width: 41px;
	    padding: 0 !important;
	    overflow: hidden;
	    position: relative;
	    line-height: 41px;
	}
	
	.btn.btn-just-icon.btn-round {
	    border-radius: 50% !important;
	}
	
    </style>
    
    <script>
        $(document).ready(function () {
            if ("${empty sessionScope.userVo}" == "true" || "${sessionScope.userVo.user_type}" == 'U') {
                location.href = "${cpath}/index.do"
            } else {
                Load_UserList()
            }
        })
        
        function Load_UserList() {
            $.ajax({
                url: "${cpath}/AdminUserList.do",
                type: "get",
                dataType: "json",
                success: UserHtml,
                error: function () {
                    alert("error")
                }
            })
        }
        
        function UserHtml(data) {
        	let html = "<div class='table-responsive'>"
            html += "<thead>"
            html += "<tr>"
            html += "<th>#</th>"
            html += "<th>Name</th>"
            html += "<th>Registration Date</th>"
            html += "<th>E-mail address</th>"
            html += "<th class='text-right'>Delete</th>"
            html += "</tr>"
            html += "</thead>"
            html += "<tbody>"
            let num = 1
            
            $.each(data, function (index, obj) {
                html += "<tr>"
                html += "<td>" + num + "</td>"
                num += 1
                html += "<td>" + obj.user_nick + "</td>"
                html += "<td>" + obj.user_joindate + "</td>"
                html += "<td>" + obj.user_id + "</td>"
                html += "<td class='td-actions text-right'>"
                html += "<button type='button' rel='tooltip' class='btn btn-danger btn-just-icon btn-sm' onclick='check(\"" + obj.user_id + "\")'><i class='material-icons'>delete</i></button></td>";
                html += "</tr>"
            })
            html += "</tbody>"
            html += "</div>"
            $(".table").html(html)
        }
        function check(user_id){
        	var check= confirm("All information will be deleted, Are you sure you want to delete it?");
        	if(check==true){
        		goDel(user_id);
        	}
        	else{
        		return;
        	}
        }
        
        function goDel(user_id) {
            $.ajax({
                url: "${cpath}/AdminDelete.do",
                type: "get",
                data: { "user_id": user_id },
                success: Load_UserList,
                error: function () {
                    alert("error");
                }
            });
        }

    </script>
</head>

<body>
    <jsp:include page="../header/header3.jsp" />
    <div class="container">
    	<div class="title">
    		<h3>Admin</h3>
    	</div>
       	<div class="row">
            <div class="col-lg-8 col-md-10 ml-auto mr-auto">
            <h4>User List</h4>
                <div class="table-responsive">
                <table class="table">
            
            </table>
            </div>
           </div>
        </div>
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