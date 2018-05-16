<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>검색결과</h1>
	<table class="table">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="10%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>출판사</th>
				<th>가격</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="book" items="${books }">
			<tr>
				<td>${book.id }</td>
				<td>${book.name }</td>
				<td>${book.publisher }</td>
				<td>${book.price }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>


















