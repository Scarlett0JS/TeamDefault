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
    <link rel="stylesheet" href="./assets/css/slicknav.css">
    <link rel="stylesheet" href="./assets/css/animate.min.css">
    <link rel="stylesheet" href="./assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="./assets/css/themify-icons.css">
    <link rel="stylesheet" href="./assets/css/slick.css">
    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/css/my.css">
    
    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    
    <script type="text/javascript">
    	$(document).ready(function(){
    		let emailInput = $("input[name='userEmail']")
    		emailInput.focus()
    	})
    
    	function Load_Main(){
    		location.href = "${cpath}/index.do"	
    	}
    	
        function Load_RegisterForm() {
            location.href = "${cpath}/UserRegisterForm.do"
        }
        
        function userLogin(){
        	let fData = $("frm-login").serialize()
        	$.ajax({
        		url: "${cpath}/UserLogin.do",
        		type: "get",
        		data: fData,
        		success: function(data){
        			console.log(data)
        			alert(data)
        			alert("here")
        			if("${empty sessionScope.mvo}"){
        				alert("Check email or password")
        				let emailInput = $("input[name='userEmail']")
    					emailInput.focus()
        			}else{
        				window.location.href = "${cpath}/index.do"	
        			}
        		},
        		error: function(){
        			alert("error")
        		}
        	})
        }
    </script>
</head>

<body>
    <main class="login-body" data-vide-bg="assets/img/login-bg.mp4">

        <div class="login-form">
            <div class="logo-login">
                <a href="javascript:Load_Main()"><img src="assets/img/logo/loder.png" alt=""></a>
            </div>
            <form class="form-default" id="frm-login">
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
                    <input type="submit" name="submit" value="login" onclick="javascript:userLogin()">
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