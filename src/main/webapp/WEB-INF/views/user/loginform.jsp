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
<div class="container">
	<div class="well well-sm">
		<h1>로그인 폼</h1>
		<c:if test="${param.err eq 'fail' }">
			<div class="alert alert-danger">
				<strong>오류</strong> 아이디 혹은 비밀번호가 올바르지 않습니다.
			</div>
		</c:if>
		<c:if test="${param.err eq 'deny' }">
			<div class="alert alert-danger">
				<strong>오류</strong> 로그인이 필요한 서비스입니다.
			</div>
		</c:if>
	</div>
	<div class="well">
		<form method="post" action="login.do">
			<div class="row form-group">
				<label class="col-sm-1">아이디</label>
				<div class=" col-sm-9">
					<input type="text" name="id" class="form-control"> 
				</div>
			</div>
			<div class="row form-group">
				<label class="col-sm-1">비밀번호</label>
				<div class=" col-sm-9">
					<input type="password" name="pwd" class="form-control"> 
				</div>
			</div>
			<div class="form-group text-right">
				<button class="btn btn-primary btn-sm">로그인</button>
			</div>
		</form>	
	</div>
</div>
</body>
</html>