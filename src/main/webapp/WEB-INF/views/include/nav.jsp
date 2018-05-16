<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="home.do">Simple Board</a>
		</div>
		<ul class="nav navbar-nav">
			<li><a href="/home.do">홈</a></li>
			<li><a href="/board/list.do">게시판</a></li>
			<li><a href="/book/form.do">책 게시판</a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
		<c:choose>
			<c:when test="${not empty LOGIN_USER }">
				<li><a>${LOGIN_USER.name }님 환영합니다.</a></li>
				<li><a href="/user/logout.do">로그아웃</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/user/loginform.do">로그인</a></li>
			</c:otherwise>
		</c:choose>
			<li><a href="/user/form.do">회원가입</a></li>
		</ul>
		<c:if test="${not empty LOGIN_USER } ">
			<p class="navbar-text navbar-right">${LOGIN_USER.name }님 환영합니다.</p>
		</c:if>
	</div>
</nav>