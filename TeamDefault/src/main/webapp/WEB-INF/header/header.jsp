<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <link rel="shortcut icon" href="#">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="./css/Login.css">
  <script type="text/javascript" src="./js/Login.js"></script>
  <script type="text/javascript">
  	function Load_LoginForm() {
	    if ($("#MemberLogin").css("display") == "none") {
	        $("#MemberLogIn").css("display", "block")
	    } else {
	        $("#MemberLogin").css("display", "none")
	    }
	}

	function Load_SignUpForm() {
	    if ($('#MemberLogIn').css("display") == "none") {
	        $('#MemberLogIn').css("display", "block")
	        $('#register-form-link').trigger("click")
	    } else {
	        $('#MemberLogIn').css("display", "none")
	    }
	}

	function MemberSignUp() {
	    let fData = $("#register-form").serialize()
	    $.ajax({
	        url: "${cpath}/MemberSignUp.do",
	        type: "post",
	        data: fData,
	        success: function () {
	        	location.href = "${cpath}/index.do"
	        },
	        error: function () {
	            alert("error")
	        }
	    })
	}
	
	function Load_Board(){
		location.href = "${cpath}/boardMain.do"
	}
	
	function Load_Main(){
		location.href = "${cpath}/index.do"
	}
	
	function LogOut(){
		$.ajax({
			url : "${cpath}/MemberLogOut.do",
			type : "post",
			success : function(){
				location.href = "${cpath}/index.do"
			},
			error : function(){
				alert("error")
			}
		})
	}
  </script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="javascript:Load_Main()">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">Page 1-1</a></li>
          <li><a href="#">Page 1-2</a></li>
          <li><a href="#">Page 1-3</a></li>
        </ul>
      </li>
      <li><a href="javascript:Load_Board()">Board</a></li>
    </ul>
    <c:if test="${empty sessionScope.memberDTO}">
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="javascript:Load_SignUpForm()"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
	      <li><a href="javascript:Load_LoginForm()"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
	    </ul>
    </c:if>
    <c:if test="${!empty sessionScope.memberDTO}">
	    <ul class="nav navbar-nav navbar-right">
		  <li><span class="glyphicon glyphicon-user"></span>Hello!! ${memberDTO.memName} </li>
	      <li><a href="javascript:LogOut()"><span class="glyphicon glyphicon-user"></span>LogOut</a></li>
	    </ul>
    </c:if>
  </div>
</nav>
<!-- sign in & up -->
<div class="container" id="MemberLogIn" style="display: none">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-login">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-6">
							<a href="#" class="active" id="login-form-link">Login</a>
						</div>
						<div class="col-xs-6">
							<a href="#" id="register-form-link">Register</a>
						</div>
					</div>
					<hr>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
						
							<form id="login-form" action = "${cpath}/login.do">
								<div class="form-group">
									<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
								</div>
								<div class="form-group">
									<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
										</div>
									</div>
								</div>
							</form>
							
							<form id="register-form" >
								<div class="form-group">
									<input type="email" name="SignUpEmail" id="SignUpEmail" tabindex="1" class="form-control" placeholder="Email Address" value="">
								</div>
								<div class="form-group">
									<input type="text" name="SignUpUsername" id="SignUpUsername" tabindex="1" class="form-control" placeholder="Username" value="">
								</div>
								<div class="form-group">
									<input type="password" name="SignUpPwd" id="SignUpPwd" tabindex="2" class="form-control" placeholder="Password">
								</div>
								<div class="form-group">
									<input type="password" name="SignUpPwd-cofirm" id="SignUpPwd-cofirm" tabindex="2" class="form-control" placeholder="Confirm Password">
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now" onclick="javascript:MemberSignUp()">
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>