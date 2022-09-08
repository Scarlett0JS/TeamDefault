<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Default</title>

    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/css/slicknav.css">
    <link rel="stylesheet" href="./assets/css/animate.min.css">
    <link rel="stylesheet" href="./assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="./assets/css/slick.css">
    <link rel="stylesheet" href="./assets/css/boardstyles.css">
    <link rel="stylesheet" href="./assets/css/my.css">
    <link rel="stylesheet" href="./assets/css/header.css">

    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script type="text/javascript">

        function Load_Write() {
            if ("${!empty sessionScope.userVo }" == "true") {
                location.href = "${cpath}/UserBoardWriteForm.do?lang=" + "${lang}"
            } else {
                alert("Please Login")
                location.href = "${cpath}/UserLoginForm.do"
            }
        }

    </script>

</head>

<body>
    <jsp:include page="../header/header2.jsp" />
    <main>
        <div class="container" id="community-c">
            <div class="row">
                <div class="col-md-12 center">
                    <h1>${lang} Community</h1>
                    <br> <br>
                    <table class="table">
                        <thead>
                            <tr class="community-a">
                                <th class="col-3">Writer</th>
                                <th class="col-4">Tilte</th>
                                <th class="col-3">Date</th>
                                <th class="col-2">hits</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="board" items="${ boardList }">
                                <tr class="community-a">
                                    <td class="col-3">${ board.user_id }</td>
                                    <td class="col-4"><a href="${cpath}/UserBoardView.do?num=${board.d_seq}">${ board.d_title }</a>
                                    </td>
                                    <td class="col-3">${ fn:split(board.d_date, " ")[0] }</td>
                                    <td class="col-2">${ board.d_cnt }</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="right">
                <button class='btn-e' onclick="javascript:Load_Write()">Write</button>
            </div>
        </div>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="${cpath}/UserLangBoardList.do?lang=${lang}&page=${page-5}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <c:forEach var="page" begin="${paging.start}" end="${ paging.end }">
                	<li class="page-item"><a class="page-link" href="${cpath}/UserLangBoardList.do?lang=${lang}&page=${page}">${ page }</a></li>
                </c:forEach>
                <c:if test="${ paging.curpage+5 < paging.totalPagingCount }">
                    <li class="page-item">
                        <a class="page-link" href="${cpath}/UserLangBoardList.do?lang=${lang}&page=${paging.curpage+5}" aria-label="Next"><span
                                aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${ paging.curpage+5 >= paging.totalPagingCount }">
                    <li class="page-item">
                        <a class="page-link" aria-label="Next"><span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </main>
    <div id="back-top">
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>

    <script src="./assets/js/jquery.slicknav.min.js"></script>
    <script src="./assets/js/hover-direction-snake.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    <script src="./assets/js/hover-direction-snake.min.js"></script>
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/header.js"></script>
    <script src="./assets/js/main.js"></script>
</body>

</html>