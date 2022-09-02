<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile Settings</title>

<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/slicknav.css">
<link rel="stylesheet" href="./assets/css/slick.css">
<link rel="stylesheet" href="./assets/css/animate.min.css">
<link rel="stylesheet" href="./assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="./assets/css/header.css">
<link rel="stylesheet" href="./assets/css/userpage.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="./assets/js/userpage.js"></script>
<script type="text/javascript">
        $(document).ready(function () {
            if ("${empty sessionScope.userVo}" == "true") {
                location.href = "${cpath}/index.do"
            } else {
                Load_UserDetail()
            }
            
            console.log("${themeVo}")
        })

        function Load_UserDetail() {
            $.ajax({
                url: "${cpath}/UserDetailList.do",
                type: "get",
                dataType: "json",
                success: UserDetailHtml,
                error: function () {
                    location.href = "${cpath}/index.do"
                }
            })
        }

        function UserDetailHtml(data) {
            let star = "*".repeat(data.user_pw.length)
            let html = "<li class='about-items row'>"
            html += "<span class='about-item-name col-2'>Email :</span>"
            html += "<span class='about-item-detail col-3' id='userIdArea'>" + data.user_id + "</span>"
            html += "<li class='about-items row'>"
            html += "<span class='about-item-name col-2'>Name :</span>"
            html += "<span class='about-item-detail col-8' id='userNickArea'>" + data.user_nick + "</span>"
            html += "<a href='javascript:EditUserNickForm()' class='about-item-edit col-1' id='userNickHref'>Edit</a></li>"
            html += "<li class='about-items row'>"
            html += "<span class='about-item-name col-2'>Password :</span>"
            html += "<span class='about-item-detail col-8' id='userPwArea'>" + star + "</span>"
            html += "<a href='javascript:EditUserPwForm()' class='about-item-edit col-1' id='userPwHref'>Edit</a></li>"
            $("#UserDetailArea").html(html)
           	$("#userpost").css("display", "none")
            $("#UserPostedArea").css("display", "none")
            
            $("#userprof").css("display", "block")
            $("#UserDetailArea").css("display", "block")
        }

        function EditUserNickForm() {
            let userNickAreaInput = "<input id='UserNickInput' type='text' class='form-control'>"
            $("#userNickArea").html(userNickAreaInput)

            let updateBtn = "<a href='javascript:UpdateUserNick()' class='about-item-edit'>Edit</a>"
            $("#userNickHref").html(updateBtn)
        }

        function UpdateUserNick() {
            let nickdata = $("#UserNickInput").val()
            let user_id = "${ user_id }"
            $.ajax({
                url: "${cpath}/UserNickUpdate.do",
                type: "get",
                data: { "user_id": user_id, "user_nick": nickdata },
                success: function () {
                    location.href = "${cpath}/UserMypageForm.do?user_id=" + user_id
                },
                error: function () {
                    alert("Error")
                }

            })
        }

        function EditUserPwForm() {
            let userPwAreaInput = "<input id='UserPwInput' type='text' class='from-control'>"
            $("#userPwArea").html(userPwAreaInput)

            let updateBtn = "<a href='javascript:UpdateUserPw()' class='about-item-edit'>Edit</a>"
            $("#userPwHref").html(updateBtn)
        }

        function UpdateUserPw() {
            let pwdata = $("#UserPwInput").val()
            let user_id = "${ user_id }"
            $.ajax({
                url: "${cpath}/UserPwUpdate.do",
                type: "get",
                data: { "user_id": user_id, "user_pw": pwdata },
                success: function () {
                    location.href = "${cpath}/UserMypageForm.do?user_id=" + user_id
                },
                error: function () {
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

        function Load_Mypage() {
            location.href = "${cpath}/UserMypageForm.do?user_id=" + "${sessionScope.userVo.user_id}"
        }

        function Load_UserPost() {
            let user_id = "${ user_id }"
            $.ajax({
                url: "${cpath}/UserPostedList.do",
                type: "post",
                data: { "user_id": user_id },
                dataType: 'json',
                success: load_UserPostForm,
                error: function () {
                    alert("Error")
                }
            })
        }
        
		function Load_UserTheme() {
			$("#userpost").css("display", "none")
			$("#UserPostedArea").css("display", "none")
			$("#userprof").css("display", "none")
			$("#UserDetailArea").css("display", "none")
			$("#usertheme").css("display", "block")
		}

        function load_UserPostForm(data) {
            let html = ""
            $.each(data, function (idx, obj) {
                console.log(obj)
                html += "<li class='about-items'>"
                html += "<div class='row'>"
                html += "<i class='mdi mdi-account icon-sm'></i>"
                html += "<div class='col-md-1'>"
                html += "<span class='about-item-name post-right'>" + String(idx + 1) + "</span></div>"
                html += "<div class='col-md-6'>"
                html += "<span class='about-item-name'><a href='javascript:Load_boardView(" + obj.d_seq + ")' class='post-a'>" + obj.d_title + "</a></span></div>"
                html += "<div class='col-md-3'>"
                html += "<span class='about-item-name'>" + obj.d_date.split(" ")[0] + "</span></div>"
                html += "<div class='col-md-1'>"
                html += "<span class='about-item-name post-right'>" + obj.d_cnt + "</span></div>"
                html += "<div class='col-md-1'>"
                html += "<span class='about-item-name post-right'>" + obj.d_like + "</span></div></div></li>"
            })
            $("#UserPostedArea").html(html)
            $("#userprof").css("display", "none")
            $("#UserDetailArea").css("display", "none")

            $("#userpost").css("display", "block")
            $("#UserPostedArea").css("display", "block")
        }

        function Load_boardView(board_num) {
            location.href = "${cpath}/UserBoardView.do?num=" + board_num
        }
		
		function Load_ThemeDetail(seq) {
			location.href = "${cpath}/ThemeDetail.do?seq=" + String(seq)
		}
    </script>

</head>

<body>
	<jsp:include page="../header/header3.jsp" />
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
									<img src="./assets/img/my_img/User.png" class="img ">
								</div>
							</div>
							<div class="profile-content">
								<div class="profile-name">${ sessionScope.userVo.user_id }</div>
								<br>
								<ul class="profile-info-list ">
									<li>
										<!-- 유저 프로필 세팅 화면 로딩 --> 
										<a href="javascript:Load_UserDetail()" class="profile-info-list-item rounded-30"><i class="mdi mdi-eye"></i>Profile Settings</a> 
										<!-- 유저가 좋아요한 테마 로딩 --> 
										<a href="javascript:Load_UserTheme()" class="profile-info-list-item rounded-30"><i class="mdi mdi-bookmark-check"></i>My Theme</a> 
										<!-- 유저가 올린 포스트 로딩 -->
										<a href="javascript:Load_UserPost()" class="profile-info-list-item rounded-30"><i class="mdi mdi-movie"></i>My Post</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-8 grid-margin stretch-card">
					<div class="card rounded-15">
						<div class="card-body" style="display: none" id="userprof">
							<p class="card-title">Profile Settings</p>
							<hr>
							<p class="card-description">User Information</p>

							<ul class="about" style="display: none" id="UserDetailArea"></ul>

							<p class="card-description">Delete Account</p>
							<ul class="about">
								<li class="leave">Do you want to leave us? 
									<a href="javascript:DeleteFromUser()" class="delete-outline">DELETE ACCOUNT</a></li>
							</ul>
						</div>


						<div class="card-body" style="display: none" id="usertheme">
							<p class="card-title">My Theme</p>
								<hr>
								<div id="contents">
									<div id="morecontents" class="main">
										<div class="container margin-top-30">
											<div class="row">
												<c:forEach var="theme" items="${themeVo}">
													<div class="col-md-6 morecontents">
														<div class="card mb-4 shadow-sm rounded-20">
															<img class="card-img-top rounded-20"
																src="./assets/img/reFinal_ThemeImg/ThemeImg_Concat/${theme.theme_filepath}"
																alt="">
															<div class="card-body">
																<p class="card-text"> <a
																		href="javascript:Load_ThemeDetail(${theme.theme_seq})">
																		${ theme.theme_name } </a></p>
																<div class="d-flex justify-content-between align-items-center">
																	<small class="text-muted"></small>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
										<div id="more-wrap"> <a href="javascript:;" class="more">∨ More</a> </div>
									</div>
								</div>
						</div>
						

						<div class="card-body" style="display: none" id="userpost">
							<p class="card-title">My Post</p>
							<hr>
							<ul class="post-sort">
								<li class="about-items">
									<div class="row post-tcolor">
										<i class="mdi mdi-account icon-sm"></i>
										<div class="col-md-1"><span class="about-item-name post-right">No. </span></div>
										<div class="col-md-6"><span class="about-item-name">Title </span></div>
										<div class="col-md-3"><span class="about-item-name">Date </span></div>
										<div class="col-md-1"><span class="about-item-name">Hits </span></div>
										<div class="col-md-1"><span class="about-item-name">Like </span></div>
									</div>
								</li>
							</ul>
							<hr class="post-hr">
							<ul class="post-sort" style="display: none" id="UserPostedArea"></ul>
						</div>

					</div>
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