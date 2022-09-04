<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>App landing</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">
<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/style.css">
<link rel="stylesheet" href="./assets/css/my.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
        $(document).ready(function () {
            if ("${loginError.loginError}" == "checkInput") {
                alert("check email or password")
            } else if ("${loginError.loginError}" == "nullInput") {
                alert("Please enter everything")
            }
            let emailInput = $("input[name='userEmail']")
            emailInput.focus()
        })

        function Load_Main() {
            location.href = "${cpath}/index.do"
        }

        function Load_RegisterForm() {
            location.href = "${cpath}/UserRegisterForm.do"
        }

        // 2. 카카오 초기화
        Kakao.init('20a7072a5eb081fde8df915647d48ba3');
        console.log(Kakao.isInitialized()); // 초기화 판단여부

        // 3. 데모버전으로 들어가서 카카오로그인 코드를 확인.
        function loginWithKakao() {
            Kakao.Auth.login({
                success: function (authObj) {
                    console.log(authObj); // access토큰 값
                    Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장

                    getInfo();
                },
                fail: function (err) {
                    console.log(err);
                }
            });
        }

        // 4. 엑세스 토큰을 발급받고, 아래 함수를 호출시켜서 사용자 정보를 받아옴.
        function getInfo() {
            let id = "";
            let email = "";
            let nickname = "";
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (res) {
                    console.log(res);
                    // 식별ID, 이메일, 닉네임
                    id = res.id;
                    email = res.kakao_account.email;
                    nickname = res.kakao_account.profile.nickname;
                    console.log(typeof (id, email, nickname));
                    kakaoRegister(id, email, nickname);
                },
                fail: function (error) {
                    alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
                }
            });
        }

        /* function kakaoLogout() {
            Kakao.API.request({
                url: '/v1/user/unlink',
                success: function (res) {
                    alert('success: ' + JSON.stringify(res))
                    console.log('success')
                },
                fail: function (err) {
                    alert('fail: ' + JSON.stringify(err))
                    console.log('fail')
                },
            })
        } */

        function kakaoRegister(id, email, nickname) {
            if (!email) {
                email = String(id)
            }
            location.href = "${cpath}/KakaoLoginRegister.do?id=" + String(id) + "&email=" + String(email) + "&nickname=" + String(nickname)
        }
    </script>
</head>

<body>
	<main class="login-body slider-bg">
		<div class="login-form">
			<div class="logo-login">
				<a href="javascript:Load_Main()"><img
					src="assets/img/logo/exLogo.png" alt=""></a>
			</div>
			<form class="form-default" id="frm-login"
				action="${cpath}/UserLogin.do" method="POST">
				<h2>Login</h2>
				<div class="form-input">
					<label for="name">Email</label> <input type="email"
						name="userEmail" id="userEmail" placeholder="Email">
				</div>
				<div class="form-input">
					<label for="name">Password</label> <input type="password"
						name="userPw" id="userPw" placeholder="Password">
				</div>
				<div class="form-input pt-30">
					<input type="submit" name="submit" value="login">
				</div>
			</form>
			<!-- social api button -->
			<div class="kakao_login img">
				<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
					src="./assets/img/my_img/kakao_login_small.png" width="222" />
				</a>
				<!-- Forget Password -->
				<!-- <a href="#" class="forget">Forget Password</a> -->
				<p class="mem">Not a member?</p>
				<a href="javascript:Load_RegisterForm()" class="registration">Registration</a>
			</div>
		</div>
	</main>
	<script src="./assets/js/bootstrap.min.js"></script>
</body>

</html>