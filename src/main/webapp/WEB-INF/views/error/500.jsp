<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    <!-- isErrorPage를 true 해야지만 exception 객체를 받아서 쓸 수 있다. -->
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="../include/nav.jsp" %>
<div class="container">
	<div class="jumbotron">
		<h1>서버에러</h1>
		<p>요청 처리 중 오류가 발생하였습니다.</p>
		<p>오류 내용: <%=exception.getMessage() %></p>
	</div>
</div>
</body>
</html>