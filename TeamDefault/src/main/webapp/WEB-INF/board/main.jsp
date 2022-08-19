<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            Load_BoardList();
        })

        function Load_BoardList() {
            $.ajax({
                url: "${cpath}/boardList.do",
                type: "get",
                dataType: "json",
                success: BoardHtml,
                error: function () {
                    alert("error")
                }
            })
        }

        function BoardHtml(data) {
            let html = "<table class='table table-bordered table-hover table-striped'>"
            $.each(data, function (index, obj) {
                html += "<tr>"
                html += "<td>" + obj.num + "</td>"
                html += "<td id = 't" + obj.num + "'><a href='javascript:Load_BoardView(" + obj.num + ")'>" + obj.title + "</a></td>"
                html += "<td>" + obj.writer + "</td>"
                html += "<td>" + obj.indate + "</td>"
                html += "<td id = 'cnt" + obj.num + "'>" + obj.count + "</td>"
                html += "</tr>"
            })
            html += "<tr>"
            html += "<td colspan='6'>"
            html += "<button id = 'btnWrite' class='btn btn-primary btn-block' onclick = 'BoardWriteForm()'> Write </button>"
            html += "</td>"
            html += "</tr>"
            html += "</table>"
            $("#list").html(html)
            $("#list").css("display", "block")
            $("#view").css("display", "none")
            $("#write").css("display", "none")
        }

        function BoardWriteForm() {
            $("#list").css("display", "none")
            $("#view").css("display", "none")
            $("#write").css("display", "block")
        }

        function BoardInsert() {
            let fData = $("#Frm_BoardWrite").serialize()
            $.ajax({
                url: "${cpath}/boardWrite.do",
                type: "post",
                data: fData,
                success: Load_BoardList,
                error: function () {
                    alert("error")
                }
            })
        }

        function BoardDelete(num) {
            $.ajax({
                url: "${cpath}/boardDelete.do",
                type: "get",
                data: { "num": num },
                success: Load_BoardList,
                error: function () {
                    alert("error")
                }
            })
        }

        function Load_BoardView(num) {
            $.ajax({
                url: "${cpath}/boardVIew.do",
                type: "get",
                data: { "num": num },
                dataType: "json",
                success: (BoardViewData) => {
                	let BoradDetail = {nums : BoardViewData.num,  titles : BoardViewData.title, contents : BoardViewData.content, writers : BoardViewData.writer}
                	let BoradDetailData = JSON.stringify(BoradDetail)
                    let html = "<table class='table table-bordered table-hover table-striped'>"
                    html += "<tr>"
                    html += "<td> Title </td>"
                    html += "<td>" + BoardViewData.title + "</td>"
                    html += "</tr>"
                    html += "<tr>"
                    html += "<td> Content </td>"
                    html += "<td>" + BoardViewData.content.replace(/\r\n/ig,'</br>') + "</td>"
                    html += "</tr>"
                    html += "<tr>"
                    html += "<td> Writer </td>"
                    html += "<td>" + BoardViewData.writer + "</td>"
                    html += "</tr>"
                    html += "<tr>"
                    html += "<td> Indate </td>"
                    html += "<td>" + BoardViewData.indate + "</td>"
                    html += "</tr>"
                    html += "<tr>"
                    html += "<td> Count </td>"
                    html += "<td>" + BoardViewData.count + "</td>"
                    html += "</tr>"
                    html += "<tr>"
                    html += "<td colspan = '2'>"
                    html += "<div class='btn-group btn-group-justified'>"
                    html += "<div class='btn-group'>"
                    html += "<button type='button' class='btn btn-success' onclick='Load_BoardUpdateForm(" + BoradDetailData +")'>Update</button>"
                    html += "</div>"
                    html += "<div class='btn-group'>"
                    html += "<button type='button' class='btn btn-danger' onclick='BoardDelete(" + BoardViewData.num + ")'>Delete</button>"
                    html += "</div>"
                    html += "<div class='btn-group'>"
                    html += "<button type='button' class='btn btn-info' onclick='Load_BoardList()'>List</button>"
                    html += "</div>"
                    html += "</tr>"
                    html += "</table>"
                    $('#view').html(html)
                    $("#list").css("display", "none")
                    $("#view").css("display", "block")
                    $("#write").css("display", "none")
                },
                error: function () {
                    alert("error")
                }
            })
        }
        
        function Load_BoardUpdateForm(BoradDetailData) {
            $("#list").css("display", "none")
            $("#view").css("display", "none")
            $("#write").css("display", "block")
            $("input[name=num").attr('value', BoradDetailData.nums)
            $("input[name=title]").attr('value', BoradDetailData.titles)
            $("textarea[name=content]").text(BoradDetailData.contents)
            $("input[name=writer]").attr('value', BoradDetailData.writers)
            $("button[name=BoardWrite]").attr('onclick', 'BoardUpdate()')
            $("button[name=BoardWrite]").text('Updating')
            $("button[name=reset]").trigger("click")
        }

        function BoardUpdate() {
            let fData = $("#Frm_BoardWrite").serialize()
            $.ajax({
                url: "${cpath}/boardUpdate.do",
                type: "post",
                data: fData,
                success: Load_BoardList,
                error: function () {
                    alert("error")
                }
            })
        }

    </script>
</head>

<body>
    <div class="container">
        <jsp:include page="../header/header.jsp" />
        <h2>MVC05</h2>
        <div class="panel panel-default">
            <div class="panel-heading">Board</div>
            <div class="panel-body" id="list"></div>
            <div class="panel-body" id="view"></div>
            <div class="panel-body" id="write" style="display: none">
                <form id="Frm_BoardWrite">
                    <input type="hidden" name="num" id="num" value=""/>
                    <table class="table table-bordered">
                        <tr>
                            <td>Title</td>
                            <td><input type="text" id="title" name="title" class="form-control" value=""/></td>
                        </tr>
                        <tr>
                            <td>Content</td>
                            <td><textarea rows="10" id="content" name="content" class="form-control"></textarea></td>
                        </tr>
                        <tr>
                            <td>Writer</td>
                            <td><input type="text" id="writer" name="writer" class="form-control" value=""/></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="btn-group btn-group-justified">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-success" id="BoardWrite" name="BoardWrite" onclick="BoardInsert()">Submit</button>
                                    </div>
                                    <div class="btn-group">
                                        <button type="reset" class="btn btn-warning" id="reset" name="reset">Cancel</button>
                                    </div>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-info" id="BoardList" name="BoardList" onclick="Load_BoardList()">List</button>
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