<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin</title>

<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/slicknav.css">
<link rel="stylesheet" href="./assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="./assets/css/slick.css">
<link rel="stylesheet" href="./assets/css/style.css">
<link rel="stylesheet" href="./assets/css/boardstyles.css">
<link rel="stylesheet" href="./assets/css/my.css">
<link rel="stylesheet" href="./assets/css/header.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script src="text/javascript">
$(document).ready(function () {
    Load_UserList()
})
function Load_UserList() {
        $.ajax({
            url: "${cpath}/UserList.do",
            type: "get",
            dataType: "json",
            success: UserHtml,
            error: function () {
                alert("error")
            }
        })
    }
function goDel(user_id){
	$.ajax({
		  url:"${cpath}/AdminDelete.do",
		  type:"get",
		  data:{"user_id":user_id},
		  success:Load_UserList,
		  error:function(){
			  alert("error");
		  }
	  });
} 
function UserHtml(data){
	 let html = "<table class='table table-bordered table-sm m-0'>"
	 	 html += "<thead>"
		 html += "<tr>"
         html += "<th>Name</th>"
         html += "<th>Registration Date</th>"
         html += "<th>E-mail address</th>"
         html += "<th>Type</th>"
         html += "<th>Delete</th>"
         html += "</tr>"
         html += "</thead>"
         html += "<tbody>"
		 $.each(data, function (index, obj) {
             html += "<tr>"
             html += "<td>" + obj.user_nick + "</td>"
             html += "<td>" + obj.user_joindate + "</td>"
             html += "<td>" + obj.user_id + "</td>"
             html += "<td>" + obj.user_type + "</td>"
             html +="<td><button class='btn btn-sm btn-danger' onclick='goDel(\""+obj.user_id+"\")'>Delete</button></td>";
             html += "</tr>"
         })
         html += "</tbody>"
         html += "</table>"
         $("#userList").html(html)
}

</script>
</head>

<body>
<jsp:include page="../header/header.jsp" />
<main class="container pt-5">
	<div class="card mb-5">
     	<div class="card-header">User List</div>
            <div class="card-block p-0">
            <br>
            <div id="userList">
            </div>
        </div>
    </div>
</main>


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