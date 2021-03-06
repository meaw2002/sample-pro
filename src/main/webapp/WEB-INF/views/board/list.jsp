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
<%@ include file="../include/nav.jsp" %>
<div class="container">
	<h1>게시글 목록</h1>
	
	<table class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
			<c:when test="${empty boards }">
				<tr>
					<td colspan="5" class="text-center">등록된 글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="board" items="${boards }">
					<tr>
						<td>${board.no }</td>
						<td><a href="detail.do?no=${board.no }">${board.title }</a></td>
						<td>${board.nick }</td>
						<td><fmt:formatDate value="${board.createDate }"/></td>
						<td>
							<a class="btn btn-danger btn-xs">삭제</a>
							<a class="btn btn-success btn-xs">수정</a>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	<div>
		<a href="form.do" class="btn btn-default">새 글</a>
	</div>
</div>
</body>
</html>








