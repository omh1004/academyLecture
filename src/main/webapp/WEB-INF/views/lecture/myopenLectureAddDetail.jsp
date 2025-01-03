<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강의 상세등록</title>
    <!-- Quill.js CSS -->
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${path}/resources/css/board/boardwrite.css">
</head>
<body>
    <div class="main-container">
        <h1 class="page-title">내 강의 상세 등록</h1>
		${openLecture}
        <!-- 수정 폼 -->
        <form action="${path}/board/boardupdateend.do" method="post">
            <!-- 게시글 번호 전달 -->
            <input type="hidden" name="boardNo" value="${board.boardNo}">

            <!-- 섹션 1: 카테고리 & 제목 입력 -->
            <div class="section">
                <div class="form-group">
                    <label for="category">카테고리를 선택해 주세요.</label>
                    <div class="select-container">
                        <select id="category" class="form-control" name="category">
                            <option value="CAT-2" ${board.categoryName == 'CAT-2' ? 'selected' : ''}>잡담</option>
                            <option value="CAT-3" ${board.categoryName == 'CAT-3' ? 'selected' : ''}>책</option>
                            <option value="CAT-4" ${board.categoryName == 'CAT-4' ? 'selected' : ''}>진학</option>
                            <option value="CAT-5" ${board.categoryName == 'CAT-5' ? 'selected' : ''}>진로</option>
                            <option value="CAT-6" ${board.categoryName == 'CAT-6' ? 'selected' : ''}>유아</option>
                            <option value="CAT-7" ${board.categoryName == 'CAT-7' ? 'selected' : ''}>입시</option>
                            <option value="CAT-8" ${board.categoryName == 'CAT-8' ? 'selected' : ''}>정보</option>
                            <option value="CAT-9" ${board.categoryName == 'CAT-9' ? 'selected' : ''}>질문</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="title">제목을 입력해 주세요.</label>
                    <input type="text" id="title" class="form-control" placeholder="제목을 입력해 주세요." name="title" value="${board.title}">
                </div>
            </div>

            <!-- 섹션 2: 내용 입력 -->
            <div class="section">
                <div class="form-group">
                    <label for="editor-container">내용을 입력해 주세요.</label>
                    <div id="editor-container"></div>
                    <input id="content" type="hidden" name="content">
                </div>
            </div>
			
			
			<div class="section tags-input">
			    <div class="form-group">
			        <label for="tags">#태그를 입력해 주세요.</label>
			        <input 
			            type="text" 
			            id="tags" 
			            class="form-control" 
			            placeholder="" 
			            name="tag" 
			            value="${fn:join(board.tag, ',')}" />
			    </div>
			</div> 
			
            <!-- 섹션 3: 태그 입력 
            <div class="section tags-input">
                <div class="form-group">
                    <label for="tags">#태그를 입력해 주세요.</label>
                    <input type="text" id="tags" class="form-control" placeholder="#태그를 입력해 주세요." name="tag" value="${board.tag}">
                </div>
            </div> -->

            <!-- 등록 버튼 -->
            <div class="button-container">
                <button id="submit-btn" type="submit">수정</button>
            </div>
        </form>
    </div>

    <!-- Quill.js 라이브러리 -->
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    <script>
        // Quill.js 초기화
        var quill = new Quill('#editor-container', {
            theme: 'snow',
            placeholder: '내용을 입력해 주세요...',
            modules: {
                toolbar: [['bold', 'italic', 'underline'], [{ 'header': 1 }, { 'header': 2 }], [{ 'list': 'ordered' }, { 'list': 'bullet' }], ['link', 'image']]
            }
        });

        // 기존 내용 로드
        quill.root.innerHTML = `${board.content}`;

        // 제출 버튼 클릭 시 Quill 내용 전송
        document.getElementById('submit-btn').addEventListener('click', function() {
            var content = quill.root.innerHTML;
            document.getElementById("content").value = content;
        });
    </script>
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
