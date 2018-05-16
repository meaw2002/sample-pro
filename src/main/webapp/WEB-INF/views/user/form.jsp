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
	<div class="panel panel-info">
		<div class="panel-heading">
			<h1>회원가입</h1>					
		</div>
		<div class="panel-body">
			<form action="register.do" method="post">
				<div class="form-group">
					<label>아이디</label>
					<input type="text" class="form-control" name="id"/>
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<input type="password" class="form-control" name="pwd"/>
				</div>
				<div class="form-group">
					<label>이름</label>
					<input type="text" class="form-control" name="name"/>
				</div>
				<div class="form-group text-right">
					<button class="btn btn-primary">회원가입</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>