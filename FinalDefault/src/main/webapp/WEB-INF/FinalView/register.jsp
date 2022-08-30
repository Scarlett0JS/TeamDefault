<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title> App landing</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/css/my.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			if ("${registerError.registerError}" == "checkPw") {
				alert("Check password")
				$("input[name='userEmail']").val("${registerError.user_id}")
				$("input[name='userName']").val("${registerError.user_name}")
				$("input[name='userPw']").focus()
			}else if ("${registerError.registerError}" == "checkEmail") {
				alert("Duplicated Email")
				$("input[name='userEmail']").focus()
			}else if ("${registerError.registerError}" == "checkInput") {
				alert("Please enter everything")
				$("input[name='userEmail']").focus()
			}else {
				$("input[name='userEmail']").focus()				
			}
		})
		
		function Load_Main(){
			location.href = "${cpath}/index.do"	
    	}
		
	</script>
</head>

<body>
    <main>
        <form class="form-default" id="frm-register" action="${cpath}/UserRegister.do" method="POST">
            <div class="login-form">
                <div class="logo-login">
                    <a href="javascript:Load_Main()"><img src="assets/img/logo/loder.png" alt=""></a>
                </div>
                <h2>Registration Here</h2>
                <div class="form-input">
                    <label for="name">Email Address</label>
                    <input type="email" name="userEmail" id="userEmail" placeholder="Email Address">
                </div>
                <div class="form-input">
                    <label for="name">Password</label>
                    <input type="password" name="userPw" id="userPw" placeholder="Password">
                </div>
                <div class="form-input">
                    <label for="name">Confirm Password</label>
                    <input type="password" name="userPw-confirm" id="userPw-confirm" placeholder="Confirm Password">
                </div>
                <div class="form-input">
                    <label for="name">Nick name</label>
                    <input type="text" name="userName" id="userName" placeholder="Nick name">
                </div>
                <div class="form-input pt-30">
                    <input type="submit" name="submit" value="Registration">
                </div>
            </div>
        </form>
    </main>
    <script src="./assets/js/bootstrap.min.js"></script>
</body>

</html>