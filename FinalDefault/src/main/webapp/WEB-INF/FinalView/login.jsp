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
    		if ("${loginError.loginError}" == "checkInput") {
				alert("check email or password")
			}  
    		
    		let emailInput = $("input[name='userEmail']")
    		emailInput.focus()
    	})
    
    	function Load_Main(){
    		location.href = "${cpath}/index.do"	
    	}
    	
        function Load_RegisterForm() {
            location.href = "${cpath}/UserRegisterForm.do"
        }
        
    </script>
</head>

<body>
    <main>
        <div class="login-form">
            <div class="logo-login">
                <a href="javascript:Load_Main()"><img src="assets/img/logo/loder.png" alt=""></a>
            </div>
            <form class="form-default" id="frm-login" action="${cpath}/UserLogin.do" method="POST">
                <h2>Login Here</h2>
                <div class="form-input">
                    <label for="name">Email</label>
                    <input type="email" name="userEmail" id="userEmail" placeholder="Email">
                </div>
                <div class="form-input">
                    <label for="name">Password</label>
                    <input type="password" name="userPw" id="userPw" placeholder="Password">
                </div>
                <div class="form-input pt-30">
                    <input type="submit" name="submit" value="login">
                </div>
            </form>
            <!-- social api button -->
            <div class="">
            </div>
            <!-- Forget Password -->
            <!-- <a href="#" class="forget">Forget Password</a> -->
            <a href="javascript:Load_RegisterForm()" class="registration">Registration</a>
        </div>
    </main>
    <script src="./assets/js/bootstrap.min.js"></script>
</body>

</html>