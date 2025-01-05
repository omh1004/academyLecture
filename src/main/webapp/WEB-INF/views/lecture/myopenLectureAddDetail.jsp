<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html lang="ko">
<head>
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
					<label for="category">카테고리를 선택해 주세요.</label>
					<div class="select-container">
						<select id="category" name="category" required>
							<option value="LDF001">입문</option>
							<option value="LDF002">초급</option>
							<option value="LDF003">중급</option>
							<option value="LDF004">고급</option>
						</select>
					</div>
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
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	<script>
		// Quill.js 초기화
		var quill = new Quill('#editor-container', {
			theme : 'snow',
			placeholder : '내용을 입력해 주세요...',
			modules : {
				toolbar : [ [ 'bold', 'italic', 'underline' ], [ {
					'header' : 1
				}, {
					'header' : 2
				} ], [ {
					'list' : 'ordered'
				}, {
					'list' : 'bullet'
				} ], [ 'link', 'image' ] ]
			}
		});
/* 
		// 기존 내용 로드
		quill.root.innerHTML = `${board.content}`;

		// 제출 버튼 클릭 시 Quill 내용 전송
		document.getElementById('submit-btn').addEventListener('click',
				function() {
					var content = quill.root.innerHTML;
					document.getElementById("content").value = content;
				}); */
	</script>
	
</body>
</html>


