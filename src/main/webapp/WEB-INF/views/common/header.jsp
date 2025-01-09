<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>

<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--     <link rel="stylesheet" href="${path}/resources/css/style.css"> --%>

<link rel="stylesheet"
	href="${path}/resources/css/common/headerfooter.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
<script>
function connectWebSocket(memberId) {
    const socket = new WebSocket("ws://localhost:8080/univora/notification-websocket/"+memberId);
   // ws://localhost:9090/HelloMVC/chatting
    
    	//let socket=new WebSocket("ws://localhost:9090/HelloMVC/chatting");
    socket.onmessage = function (event) {
        updateNotificationCount();
    };
}

var unreadCount = 0;
//읽지 않은 알림 카운트를 가져와 표시
function fetchUnreadCount() {
 fetch('http://localhost:8080/${pageContext.request.contextPath}/notifications')
     .then(response => response.text())
     .then(count => {
         unreadCount = parseInt(count, 10);
         updateNotificationCount();
     });
}

//알림 카운트 증가
function incrementNotificationCount() {
 unreadCount += 1;
 updateNotificationCount();
}

//알림 카운트 초기화 (읽음 처리)
function markAsRead() {
 fetch('http://localhost:8080/${pageContext.request.contextPath}/notifications', { method: 'POST' })
     .then(() => {
         unreadCount = 0; // 읽음 처리 후 카운트 초기화
         updateNotificationCount();
     });
}

//화면에 알림 카운트 표시
function updateNotificationCount() {
 document.getElementById('notification-count').textContent = unreadCount;
}
</script>
<title>univora</title>

</head>
<body onload="updateNotificationCount(); connectWebSocket('${sessionScope.loginMember.memberId}');">
	<!-- Header -->
	<header class="header">
		<a href="${path }/main/login.do"> <img
			src="${pageContext.request.contextPath}/resources/images/header-logo.png"
			alt="univora" class="logo-img">
		</a>
		<div class="nav-items">

	
	<!-- <a href="${pageContext.request.contextPath}/main/msg.do" class="mainpage-link"> </a>  -->
	<span>강의</span>



			<form method="get" action="/univora/lecture/search.do"
				class="search-form">
				<div class="search-container">
					<input type="text" name="query" placeholder="배우고 싶은 것들을 이야기해주세요"
						class="search-input" value="${param.query}">
					<button type="submit" class="search-button">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
							class="search-icon">
        <circle cx="11" cy="11" r="8" stroke="#666" stroke-width="2"
								fill="none"></circle>
        <line x1="16" y1="16" x2="22" y2="22" stroke="#666"
								stroke-width="2"></line>
    </svg>
					</button>
				</div>
			</form>





			<!--  <input type="text" class="search-box" placeholder="배우고 싶은 것들을 이야기해주세요"> -->



			<c:if test="${sessionScope.loginMember==null }">
				<a href="${path}/main/index.do"><button class="login-btn">Login</button></a>
			</c:if>



			<c:if test="${sessionScope.loginMember != null}">
				<!-- 알림 아이콘 및 프로필 -->
				<div class="profile-container">
					<!-- 알림 아이콘 -->
					<div class="notification-icon">
						<button onclick="markAsRead()">
							<span>🔔</span> <span id="notification-count">0</span>
						</button>
					</div>

					<!-- 프로필 아이콘 -->
					<a href="${pageContext.request.contextPath}/mypage/main.do"
						class="profile-link">
						<div class="profile-circle">
							<!-- 프로필 이미지가 없다면 기본 배경 표시 -->
						</div>
					</a>
				</div>
			</c:if>



			<style>
.profile-container {
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 20px; /* 알림 아이콘과 프로필 간격을 20px로 설정 */
}

.profile-link {
	text-decoration: none;
}

.profile-circle {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: #362D4B; /* 기본 배경색 */
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 1px solid #ddd; /* 테두리 */
	transition: box-shadow 0.2s ease-in-out;
}

.profile-circle:hover {
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* hover 효과 */
}

.profile-circle img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.notification-icon {
	position: relative;
	font-size: 24px;
	color: #362D4B;
	cursor: pointer;
}

.notification-icon .badge {
	position: absolute;
	top: -5px;
	right: -10px;
	background-color: #362D4B;
	color: white;
	font-size: 12px;
	border-radius: 50%;
	padding: 2px 6px;
	font-weight: bold;
}

/* 검색창 컨테이너 */
.search-container {
	display: flex;
	align-items: center;
	width: 100%;
	max-width: 400px; /* 넓이 조정 */
	border: 1px solid #ddd;
	border-radius: 20px; /* 둥근 모서리 */
	padding: 5px 10px;
	background-color: #f9f9f9;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

/* 입력 필드 */
.search-input {
	flex-grow: 1;
	border: none;
	outline: none;
	padding: 8px 10px; /* 높이 조정 */
	border-radius: 20px;
	font-size: 14px; /* 글자 크기 조정 */
	background: transparent;
	font-family: "Arial", sans-serif;
}

/* 검색 버튼 */
.search-button {
	background: none;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.search-button:hover {
	background-color: #eee; /* 호버 시 배경 */
	border-radius: 50%; /* 아이콘 둥글게 */
}

.search-button svg {
	fill: #666;
	width: 16px; /* 돋보기 크기 */
	height: 16px;
	transition: fill 0.3s, transform 0.3s;
}

.search-button:hover svg {
	fill: #333;
	transform: scale(1.1); /* 호버 시 약간 확대 */
}

/* 겹치는데 일단 추가 */
.search-button {
	background: none;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 0;
	display: flex;
	align-items: center;
	justify-content: center;
}

.search-icon {
	width: 16px; /* 아이콘 너비 */
	height: 16px; /* 아이콘 높이 */
	stroke-width: 2px; /* 선 두께 */
	stroke: #666; /* 아이콘 색상 */
	transition: stroke 0.3s, transform 0.3s;
}

.search-button:hover .search-icon {
	stroke: #333; /* 호버 시 색상 */
	transform: scale(1.1); /* 호버 시 확대 */
}
</style>

	</header>