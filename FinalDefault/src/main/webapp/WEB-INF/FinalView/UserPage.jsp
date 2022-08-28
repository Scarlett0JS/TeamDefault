<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/slick.css">
    <link rel="stylesheet" href="./assets/css/animate.min.css">
    <link rel="stylesheet" href="./assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="./assets/css/header.css">
    <link rel="stylesheet" href="./assets/css/userpage.css">

    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            Load_UserDetail()
        })

        function Load_UserDetail() {
            $.ajax({
                url: "${cpath}/UserDetailList.do",
                type: "get",
                dataType: "json",
                success: UserDetailHtml,
                error: function () {
                    alert("Error")
                }
            })
        }

        function UserDetailHtml(data) {
         	let html = "<li class='about-items'><i class='mdi mdi-account icon-sm'></i>"
        		html += "<span class='about-item-name'>Name:</span>"
                html += "<span class='about-item-detail' id='userNickArea'>" + data.user_nick +"</span>"
                html += "<a href='javascript:EditUserNickForm()' class='about-item-edit' id='userNickHref'>Edit</a></li>"
                html += "<li class='about-items'><i class='mdi mdi-account icon-sm'></i>"
                html += "<span class='about-item-name'>Email:</span>"
                html += "<span class='about-item-detail' id='userIdArea'>" + data.user_id +"</span>"
                html += "<li class='about-items'><i class='mdi mdi-lock-outline icon-sm'></i>"
                html += "<span class='about-item-name'>Password:</span>"
                html += "<span class='about-item-detail' id='userPwArea'>" + data.user_pw + "</span>"
                html += "<a href='javascript:EditUserPwForm()' class='about-item-edit' id='userPwHref'>Edit</a></li>"
            $("#UserDetailArea").html(html)
            $("#UserDetailArea").css("display", "block")
        }
        
        
        function EditUserNickForm(){
        	let userNickAreaInput = "<input id='UserNickInput' type='text' class='form-control'>"
        	$("#userNickArea").html(userNickAreaInput)
        	
        	let updateBtn = "<a href='javascript:UpdateUserNick()' class='about-item-edit'>Edit</a>"
        	$("#userNickHref").html(updateBtn)
        }
        
        function UpdateUserNick(){
        	let nickdata = $("#UserNickInput").val()
        	let user_id = "${ user_id }"
        	$.ajax({
        		url: "${cpath}/UserNickUpdate.do",
        		type: "get",
        		data: {"user_id" : user_id, "user_nick" : nickdata},
        		success: function(){
        			location.href = "${cpath}/UserMypageForm.do?user_id=" + user_id
        		},
        		error: function(){
        			alert("Error")
        		}
        		
        	})
        }
        

        function DeleteFromUser() {
            $.ajax({
                url: "${cpath}/UserDelete.do",
                type: "get",
                success: function () {
                    location.href = "${cpath}/UserLogout.do"
                },
                error: function () {
                    alert("Error")
                }
            })
        }

    </script>

</head>

<body>
    <jsp:include page="../header/header.jsp" />
    <div class="main-panel">
        <div class="container">
            <div class="row margin-top-65 margin-bottom-160">
                <div class="col-md-4 grid-margin stretch-card">
                    <div class="card rounded-15">
                        <div class="profile-card">
                            <div class="profile-header">
                                <div class="cover-image rounded-top-15">
                                    <!-- <img src="https://cdn.pixabay.com/photo/2019/10/19/14/16/away-4561518_960_720.jpg" class="img img-fluid"> -->
                                </div>
                                <div class="user-image">
                                    <img src="./assets/img/user/User.png" class="img ">
                                </div>
                            </div>
                            <div class="profile-content">
                                <div class="profile-name" style="display: none">${ sessionScope.userVo.user_id }</div>
                                <br>
                                <ul class="profile-info-list ">
                                    <a href="" class="profile-info-list-item rounded-30"><i
                                            class="mdi mdi-eye"></i>Profile Settings</a>
                                    <a href="" class="profile-info-list-item rounded-30"><i
                                            class="mdi mdi-bookmark-check"></i>My Theme</a>
                                    <a href="" class="profile-info-list-item rounded-30"><i
                                            class="mdi mdi-movie"></i>Something </a>
                                    <a href="" class="profile-info-list-item rounded-30"><i
                                            class="mdi mdi-account"></i>Something</a>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-8 grid-margin stretch-card">
                    <div class="card rounded-15">
                        <div class="card-body">
                            <p class="card-title">Profile Settings</p>
                            <hr>
                            <p class="card-description">User Information</p>
                            <ul class="about" style="display:none" id="UserDetailArea"></ul>
                            <p class="card-description">Delete Account</p>
                            <ul class="about">
                                <li class="leave">Do you want to leave us?
                                    <a href="javascript:DeleteFromUser()" class="delete-outline">DELETE ACCOUNT</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script src="./assets/js/main.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <script src="./assets/js/jquery.slicknav.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>
</body>

</html>