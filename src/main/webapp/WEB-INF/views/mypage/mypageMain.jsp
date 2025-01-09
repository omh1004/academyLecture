<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<c:set var="path" value="${pageContext.request.contextPath }" />
<html>
<head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<meta charset="UTF-8">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		sans-serif;
}

body {
	background-color: #f5f5f5;
}

.header {
	background-color: white;
	padding: 1rem;
	border-bottom: 1px solid #e0e0e0;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.logo {
	font-size: 1.5rem;
	font-weight: bold;
	color: #2d2b38;
}

.search-bar {
	flex-grow: 1;
	margin: 0 2rem;
	position: relative;
}

.search-bar input {
	width: 100%;
	padding: 0.5rem 1rem;
	border-radius: 4px;
	border: none;
	background-color: #f0f0f0;
}

.main-content {
	display: flex;
	padding: 2rem;
	gap: 2rem;
}

.sidebar {
	width: 200px;
}

.sidebar-menu {
	background-color: white;
	border-radius: 4px;
	padding: 1rem;
}

.menu-item {
	padding: 0.5rem;
	cursor: pointer;
}

.profile-section {
	flex-grow: 1;
}

.profile-card {
	background-color: white;
	border-radius: 4px;
	padding: 2rem;
	margin-bottom: 1rem;
}

.profile-header {
	font-size: 1.2rem;
	font-weight: bold;
	margin-bottom: 1rem;
	color: #2d2b38;
	display: flex;
	align-items: center; /* 세로 정렬 중앙 */
	gap: 10px; /* 요소 간 간격 */
}

.profile-image {
	width: 100px;
	height: 100px;
	background-color: #2d2b38;
	border-radius: 4px;
	margin-bottom: 1rem;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
}

.profile-field {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0.5rem 0;
	border-bottom: 1px solid #f0f0f0;
}

.edit-button {
	padding: 0.3rem 1rem;
	border-radius: 20px;
	border: 1px solid #e0e0e0;
	background-color: white;
	cursor: pointer;
}
</style>
</head>
<body>

	<main class="main-content">
		<aside class="sidebar">
			<div class="sidebar-menu">
				<div class="menu-item">학습관리</div>
				<div class="menu-item">
					<a href="${pageContext.request.contextPath}/mypage/myLectureMain.do">내 학습</a>
				</div>
				<div class="menu-item">
				<a href="${pageContext.request.contextPath}/mypage/userReviews.do">작성한 수강평</a>
				</div>
				<div class="menu-item">수강신청 관리</div>
				
				<div class="menu-item">
					<a href="${pageContext.request.contextPath}/mypage/lectureBasket.do">수강바구니</a>
				</div>
				
				<div class="menu-item">
				<a href="${pageContext.request.contextPath}/mypage/purchaseHistory.do">구매내역</a>
				</div> 
				
				<div class="menu-item">
					<a href="${pageContext.request.contextPath}/mypage/myopenlecture.do">강의 스케줄</a>
				</div>
			</div>
		</aside>
		<section class="profile-section">
			<div class="profile-card">
				<div class="profile-header">
					<h2>내 프로필</h2>
					<button class="edit-button">
					 <a href="${pageContext.request.contextPath}/mypage/editProfile.do" style="text-decoration: none; color: inherit;">설정</a>
					</button>
				</div>
				<div class="profile-image">
					<span style="font-size: 2rem;">K</span>
				</div>
				<div class="profile-field">
					<span>닉네임&nbsp;&nbsp;&nbsp;&nbsp; ${userProfile.nickName}</span>
				</div>
				<div class="profile-field">
					<span>자기소개&nbsp;&nbsp;&nbsp;&nbsp;${userProfile.introduction}
					</span>
				</div>
			</div>

			<div class="profile-card">
				<div class="profile-header">
					<h4>기본 정보</h4>
				</div>
				<div class="profile-field">
					<span>이메일</span> <span>${userProfile.email}</span>
				</div>
				<div class="profile-field">
					<span>주소</span> <span>${userProfile.address}</span>
				</div>
				<div class="profile-field">
					<span>휴대폰 번호</span> <span>${userProfile.phone}</span>
				</div>
			</div>
		</section>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>