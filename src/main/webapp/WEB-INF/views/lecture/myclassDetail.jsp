<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
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
	max-width: 1200px;
	margin: 0 auto;
	padding: 2rem;
}

.course-header {
	display: flex;
	gap: 2rem;
	margin-bottom: 2rem;
	background: white;
	padding: 2rem;
	border-radius: 8px;
}

.course-image {
	width: 50px;
	height: 50px;
	background: linear-gradient(45deg, #2b3a6a, #1a2442);
	border-radius: 8px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 3rem;
}

.course-info {
	flex: 1;
}

.course-title {
	font-size: 1.5rem;
	margin-bottom: 1rem;
}

.course-meta {
	display: flex;
	gap: 1rem;
	margin-bottom: 1rem;
	color: #666;
}

.course-meta span::after {
	content: "•";
	margin-left: 1rem;
}

.course-meta span:last-child::after {
	content: "";
}

.course-price {
	font-size: 1.5rem;
	font-weight: bold;
	margin: 1rem 0;
}

.action-buttons {
	display: flex;
	gap: 1rem;
}

.btn {
	padding: 0.8rem 2rem;
	border-radius: 4px;
	border: none;
	cursor: pointer;
	font-size: 1rem;
}

.btn-primary {
	background-color: #2d2b38;
	color: white;
}

.btn-secondary {
	background-color: white;
	border: 1px solid #2d2b38;
	color: #2d2b38;
}

.instructor-section {
	background: white;
	padding: 2rem;
	border-radius: 8px;
	margin-bottom: 2rem;
}

.section-title {
	font-size: 1.3rem;
	margin-bottom: 1.5rem;
}

.instructor-profile {
	display: flex;
	gap: 2rem;
	background: #f8f8f8;
	padding: 1.5rem;
	border-radius: 8px;
}

.instructor-image {
	width: 120px;
	height: 120px;
	border-radius: 8px;
	object-fit: cover;
}

.instructor-info {
	flex: 1;
}

.instructor-name {
	font-size: 1.1rem;
	font-weight: bold;
	margin-bottom: 0.5rem;
}

.instructor-bio {
	color: #666;
	line-height: 1.6;
}

.reviews-section {
	background: white;
	padding: 2rem;
	border-radius: 8px;
}

.rating-summary {
	display: flex;
	align-items: center;
	gap: 1rem;
	padding: 1rem;
	border: 1px solid #eee;
	border-radius: 4px;
	margin-bottom: 2rem;
}

.rating-number {
	font-size: 2rem;
	font-weight: bold;
}

.review-item {
	display: flex;
	gap: 1rem;
	margin-bottom: 1.5rem;
	padding-bottom: 1.5rem;
	border-bottom: 1px solid #eee;
}

.review-avatar {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background-color: #2d2b38;
}

.review-content {
	flex: 1;
}

.review-meta {
	display: flex;
	gap: 0.5rem;
	margin-bottom: 0.5rem;
	color: #666;
}

.review-buttons {
	display: flex;
	gap: 0.5rem;
	margin-top: 0.5rem;
}

.review-btn {
	padding: 0.3rem 0.8rem;
	border: 1px solid #ddd;
	border-radius: 20px;
	background: white;
	cursor: pointer;
	font-size: 0.9rem;
}

.sub-comment {
	margin-left: 2rem;
	border-left: 2px solid #ddd;
	padding-left: 1rem;
	margin-bottom: 15px;
	padding-bottom: 10px;
}

.sub-comment .d-flex {
	justify-content: space-between;
	align-items: center;
}

.review-date {
	font-size: 0.8rem;
	color: #666;
}

.dropdown {
	margin-left: 10px;
}
</style>
<script>
        function openEditor(videoPath) {
            const videoPlayer = document.getElementById('videoPlayer');
            videoPlayer.src = videoPath;
            videoPlayer.style.display = 'block';
        }
    </script>
</head>
<body>
	<main class="main-content">
		<div class="course-header">
			<div class="course-image">
 				<img src='${path}/resources/images/풀밭에 자는 커비.jpg'
					alt="사진이 없습니다." width="250px" height="300"/>
			</div>
			<div class="course-info">
				<h1 class="course-title">${myclass.myLecture.className}</h1>
				<div class="course-meta">
					<span>djeldi??</span>
				</div>
				<div>${lecture.userId}</div>
			</div>
		</div>
		<section class="video-section">
		 	<video id="videoPlayer" width="640" height="360" controls style="display:none;"></video>
            	<button onclick="openEditor('${path}/resources/upload/lecture/${myclass.lecturePlay.savedName}')">${myclass.lecturePlay.savedName}</button>
		</section>
	</main>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />