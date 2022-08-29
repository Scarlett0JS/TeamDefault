<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<c:set var="sessionV" value="${session.userVo}" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Default</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">

    <!-- SummerNote -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
    
    <script>
        $(document).ready(function () {
            $('#summernote').summernote({
                placeholder: 'Input Content',
                minHeight: 450,
                maxHeight: null,
                focus: true,
                lang: 'ko-KR'
            });
        });

        function Load_community() {
            alert("Changes will not be saved")
            location.href = "${cpath}/UserLangBoardList.do?lang=" + "${lang}"
        }
    </script>
</head>

<body>
    <div class="container my-5 py-5">
        <h2>Write Yours</h2>
        <hr />
        <div>
            <form method="post" action="${cpath}/UserBoradWrite.do">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Title</span>
                    </div>
                    <input type="hidden" id="Writer" name="Writer" value=${ sessionScope.userVo.user_id }> <input
                        type="hidden" id="Lang" name="Lang" value=${ lang }> <input type="text" class="form-control"
                        id="summerTitle" name="summerTitle">
                </div>
                <textarea id="summernote" name="summernote"></textarea>
                <br>
                <button type="submit" class="btn btn-success">Submit</button>
                <button type="reset" class="btn btn-warning">Cancel</button>
                <button type="button" class="btn btn-info" onclick="javascript:Load_community()">List</button>
            </form>
        </div>
    </div>
</body>

</html>