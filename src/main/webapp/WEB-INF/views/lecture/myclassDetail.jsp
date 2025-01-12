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
	background-color: #f9f9f9;
}

.container {
	max-width: 900px;
	margin: 30px auto;
	padding: 25px;
	background: #362D4B;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border: 2px solid;
	border-color: #472ED6;
}

.lecture-header {
	display: flex;
	align-items: center;
	gap: 20px;
	margin-bottom: 25px;
}

.lecture-header img {
	width: 160px;
	height: 160px;
	border-radius: 10px;
	object-fit: cover;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.lecture-header .details {
	flex: 1;
}

.lecture-header .details h1 {
	margin: 0 0 10px;
	font-size: 2.2rem;
	color: #fff;
	font-weight: bold;
}

.lecture-header .details h6 {
	margin: 5px 0;
	font-size: 1rem;
	color: #7f8c8d;
}

.lecture-header .details p {
	margin: 10px 0;
	font-size: 0.95rem;
	color: #555555;
	line-height: 1.6;
}

.video-container {
	margin-top: 20px;
}

.video-container video {
	width: 100%;
	height: auto;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	/* 테두리 스타일 */
	border: 1px solid;
	border-color: #472ED6;
}

button {
	padding: 10px 20px;
	font-size: 1rem;
	color: white;
	background-color: #3498db;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #2980b9;
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
			<c:if test="${myclass.myLecture.lecturePicture ==null}">
				<img
					src="${path}/resources/upload/lecture/image/readyUpload.jpg"
					alt="강의 썸네일">
			</c:if>
			<c:if test="${myclass.myLecture.lecturePicture !=null}">
				<img
					src="${path}/resources/upload/lecture/image/${myclass.myLecture.lecturePicture}"
					alt="강의 썸네일">
			</c:if>
			<div class="details">
				<h1>강의명 : ${myclass.myLecture.className}</h1>
				<h6>
					강사명: ${myclass.teacher.memberName}
					</h3>
					<p></p>
			</div>

		</div>
		<div class="video-container">

			<c:if test="${myclass.myLecture.lectureMovie !=null}">
				<video id="videoPlayer" width="640" height="360" controls
					src="${path}/resources/upload/lecture/movie/${myclass.myLecture.lectureMovie}">${myclass.myLecture.lectureMovie}</video>
			</c:if>
			<c:if test="${myclass.myLecture.lectureMovie ==null}">
				<video id="videoPlayer" width="640" height="360" controls
					src="${path}/resources/upload/lecture/movie/turtle.mp4">turtle.mp4
				</video>
			</c:if>
		</div>

	</div>
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />