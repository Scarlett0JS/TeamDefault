<%@page import="kr.test.entity.TestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	TestDTO vo = (TestDTO) request.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="../testHeader/header.jsp" />
		<h2>Login</h2>
		<div class="panel panel-default">
			<div class="panel-heading">test_Login</div>
			<div class="panel-body">
				<table class="table table-bordered table-hover table-striped ">
					<tr>
					<td><label for="usrlabel">ID</label></td>
						<td><%= vo.getUserId() %></td>
					</tr>
					<tr>
					<td><label for="pwdlabel">Password</label></td>
						<td><%= vo.getUserPw() %></td>
					</tr>
				</table>
			</div>
			<div class="panel-footer">Spring 특화 A</div>
		</div>
	</div>
</body>
</html>
