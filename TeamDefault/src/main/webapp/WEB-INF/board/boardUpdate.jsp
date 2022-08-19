<%@page import="com.board.entity.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${ pageContext.request.contextPath }" />
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
<script>
	function go_BoardList() {
		location.href = ""
	}
</script>
</head>
<body>
	<jsp:include page="../header/header.jsp" />
	<div class="container">
		<h2>Project Board</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Board</div>
			<div class="panel-body">
				<form action="${cpath}/boardUpdate.do?num=${vo.num}" method="post">
					<table class="table table-bordered">
						<tr>
							<td>Title</td>
							<td><input type="text" name="title" class="form-control" value = "${vo.title}"/></td>
						</tr>
						<tr>
							<td>Content</td>
							<td><textarea rows="10" name="content" class="form-control">${vo.content}</textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="btn-group btn-group-justified">
									<div class="btn-group">
										<button type="submit" class="btn btn-success">Submit</button>
									</div>
									<div class="btn-group">
										<button type="reset" class="btn btn-warning">Cancel</button>
									</div>
									<div class="btn-group">
										<button type="button" class="btn btn-info" onclick="go_BoardList()">List</button>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div class="panel-footer">Spring 특화 A</div>
		</div>
	</div>
</body>
</html>