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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function () {
        Load_MemberList();
    })
    function Load_MemberList() {
            $.ajax({
                url: "${cpath}/memberList.do",
                type: "get",
                dataType: "json",
                success: MemberHtml,
                error: function () {
                    alert("error")
                }
            })
        }
    function goDel(memId){
    	$.ajax({
  		  url:"${cpath}/memberDelete.do",
  		  type:"get",
  		  data:{"memId":memId},
  		  success:Load_MemberList,
  		  error:function(){
  			  alert("error");
  		  }
  	  });
    }
    function MemberHtml(data){
    	 let html = "<table class='table table-bordered table-hover table-striped'>"
    		 html += "<tr>"
             html += "<td>ID</td>"
             html += "<td>Name</td>"
             html += "<td>Delete</td>"
             html += "</tr>"
    		 $.each(data, function (index, obj) {
                 html += "<tr>"
                 html += "<td>" + obj.memId + "</td>"
                 html += "<td>" + obj.memName + "</td>"
                 html+="<td><button class='btn btn-sm btn-danger' onclick='goDel(\""+obj.memId+"\")'>Delete</button></td>";
                 html += "</tr>"
             })
             $("#list").html(html)
    }
    
    
    </script>
</head>
<body>
<jsp:include page="../header/header.jsp" />
    <div class="container">
    <h2>Default</h2>
    <div class="panel panel-default">
    <div class="panel-heading">Member</div>
    <div class="panel-body" id="list"></div>
    </div>
    </div>
</body>
</html>