<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath }" />

<link rel="stylesheet" href="${path}/resources/css/index.css">

<body
	style="background-image: url('${pageContext.request.contextPath}/resources/images/space.jpg');">
<body>
	<div class="login-container">
		<div class="logo">
			<h1 style="color: white; font-size: 32px;">univora</h1>
		</div>
		<form method="post" action="${path}/login/login.do">
			<input type="text" class="input-field" id="userId" name="memberId"
				placeholder="Id or Email"> <input type="password"
				class="input-field" id="userPwd" name="password"
				placeholder="Password"> <a href="${path}/login/login.do"><button
					class="login-btn">LOGIN</button></a>
		</form>
		<div class="social-login">
			<div class="social-btn kakao-login">
				<span>카카오 로그인</span>
			</div>
			<div class="social-btn google-login">
				<span>구글 로그인</span>
			</div>
		</div>

		<div class="links">
			<a href="#">FORGOT YOUR PASSWORD?</a> <a
				href="${path }/login/signupagreement.do">CREATE ACCOUNT</a>
		</div>
	</div>
</body>
</html>
