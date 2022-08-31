<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	function Load_Main() {
		location.href = "${cpath}/index.do"
	}

	function Load_RegisterForm() {
		location.href = "${cpath}/UserRegisterForm.do"
	}

	function Load_LoginForm() {
		location.href = "${cpath}/UserLoginForm.do"
	}

	function Load_Community() {
		location.href = "${cpath}/UserBoardForm.do"
	}

	function LogOut() {
		location.href = "${cpath}/UserLogout.do"
	}

	function Load_MyPage() {
		location.href = "${cpath}/UserMypageForm.do?user_id="
				+ "${sessionScope.userVo.user_id}"
	}

	function Load_Community() {
		location.href = "${cpath}/UserBoardForm.do"
	}
</script>
</head>
<div id="preloader-active-my">
	<div
		class="preloader-my d-flex-my align-items-center-my justify-content-center-my">
		<div class="preloader-inner-my position-relative-my">
			<div class="preloader-circle-my"></div>
			<div class="preloader-img-my pere-text-my">
				<img src="./assets/img/logo/exLogo.png" alt="">
			</div>
		</div>
	</div>
</div>
<header>
	<div class="header-area-my header-color-my">
		<div class="main-header-my">
			<div class="header-bottom-my  header-sticky-my">
				<div class="container-fluid-my">
					<div class="row-my align-items-center-my">
						<div class="col-xl-2-my col-lg-2-my">
							<div class="logo">
								<a href="javascript:Load_Main()"><img
									src="./assets/img/logo/logo.png" alt="Logo"></a>
							</div>
						</div>
						<div class="col-xl-10-my col-lg-10-my">
							<div
								class="menu-wrapper-my d-flex-my align-items-center-my justify-content-end-my">
								<div class="main-menu-my d-none-my d-lg-block-my">
									<nav>
										<ul id="navigation-my">
											<li><a href="javascript:Load_Community()">All</a></li>
											<li><a href="${cpath}/UserLangBoardList.do?lang=Python">Python</a></li>
											<li><a href="${cpath}/UserLangBoardList.do?lang=Java">Java</a></li>
											<li><a href="${cpath}/UserLangBoardList.do?lang=Html">Html</a></li>
											<li><a
												href="${cpath}/UserLangBoardList.do?lang=JavaScript">JavaScript</a>
											</li>
											<li><a href="theme.html">Theme</a></li>
											<c:if test="${empty sessionScope.userVo}">
												<li class="button-header-my margin-left-my "><a
													href="javascript:Load_RegisterForm()" class="btn-my">Register</a>
												</li>
												<li class="button-header-my"><a
													href="javascript:Load_LoginForm()" class="btn-my">Log
														In</a></li>
											</c:if>
											<c:if test="${!empty sessionScope.userVo}">
												<li class="button-header-my margin-left-my "><a
													href="javascript:Load_MyPage()" class="btn-my">My Page</a>
												</li>
												<li class="button-header-my"><a
													href="javascript:LogOut()" class="btn-my">Log Out</a></li>
											</c:if>
										</ul>
									</nav>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>

</html>