<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강의 등록</title>
<!-- Quill.js CSS -->
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link rel="stylesheet" href="${path}/resources/css/board/boardwrite.css">
</head>
<body>
	<div class="main-container">
		${openLecture}
		<h1>강의 등록</h1>
		<form action="${path}/lecture/myopenLecturedetail.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" id="lectureNo" name="lectureNo"
				value="${openLecture.lectureNo}">
			<div class="section">
				<div class="form-group">
					<label for="category">카테고리</label> <select id="category"
						name="category" required>
						<option value="LDF001">입문</option>
						<option value="LDF002">초급</option>
						<option value="LDF003">중급</option>
						<option value="LDF004">고급</option>
					</select>
				</div>
				<div class="form-group">
					<label for="title">제목을 입력해 주세요.</label> <input type="text"
						id="title" class="form-control" placeholder="제목을 입력해 주세요."
						name="title" value="${board.title}">
				</div>
			</div>
			<div class="section">
				<div class="form-group">
					<label for="editor-container">강의 내용</label>
					<div id="editor-container"></div>
					<input type="hidden" id="instructorintro" name="instructorintro">
				</div>
			</div>
			<div class="section">
				<div class="form-group">
					<label for="file">동영상 업로드</label> <input type="file" id="file"
						name="file" required>
				</div>
			</div>

			<div class="button-container">
				<button id="submit-btn" type="submit">등록</button>
			</div>

		</form>
	</div>

	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	<script>
		var quill = new Quill('#editor-container', {
			theme : 'snow'
		});
		document.querySelector('form').addEventListener('submit', function() {
			document.getElementById('content').value = quill.root.innerHTML;
		});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>


