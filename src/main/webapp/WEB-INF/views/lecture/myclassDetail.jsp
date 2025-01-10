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
<head>

<title>강의 상세 페이지</title>

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f9;
}

.container {
	max-width: 900px;
	margin: 20px auto;
	padding: 20px;
	background: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.lecture-header {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
}

.lecture-header img {
	width: 150px;
	height: 150px;
	border-radius: 8px;
	margin-right: 20px;
}

.lecture-header .details {
	flex: 1;
}

.lecture-header .details h1 {
	margin: 0 0 10px 0;
	font-size: 24px;
	color: #333;
}

.lecture-header .details p {
	margin: 5px 0;
	color: #555;
}

.video-container {
	margin-top: 20px;
}

.video-container video {
	width: 100%;
	height: auto;
	border-radius: 8px;
}
</style>
<script>
	function openEditor(videoPath) {

		const videoPlayer = document.getElementById('videoPlayer');

		videoPlayer.src = videoPath;
/* 
		videoPlayer.style.display = 'block'; */

	}
</script>
</head>

<body>
	<div class="container">
		<div class="lecture-header">
			<img src="${path}/resources/upload/lecture/image/${myclass.myLecture.lecturePicture}" alt="강의 썸네일">
			<div class="details">
				<h1>강의명 : ${myclass.myLecture.className}</h1>
				<h6>강사명: ${myclass.teacher.memberName} </h3>
				<p></p>
			</div>

		</div>
		<div class="video-container">
			<video id="videoPlayer" width="640" height="360" controls src="${path}/resources/upload/lecture/movie/${myclass.myLecture.lectureMovie}">${myclass.myLecture.lectureMovie}</video>

		</div>

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />