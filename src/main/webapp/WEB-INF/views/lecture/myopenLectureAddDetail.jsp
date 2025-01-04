<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강의 등록</title>
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
</head>
<body>
    <div class="main-container">
        <h1>강의 등록</h1>
        <form action="${path}/lecture/myopenLecturedetail.do" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="category">카테고리</label>
                <select id="category" name="category" required>
                    <option value="LDF001">입문</option>
                    <option value="LDF002">초급</option>
                    <option value="LDF003">중급</option>
                    <option value="LDF004">고급</option>
                </select>
            </div>
            <div class="form-group">
                <label for="title">강의명</label>
                <input type="text" id="title" name="title" placeholder="제목을 입력하세요" required>
            </div>
            <div class="form-group">
                <label for="editor-container">내용</label>
                <div id="editor-container"></div>
                <input type="hidden" id="content" name="content">
            </div>
            <div class="form-group">
                <label for="tags">태그</label>
                <input type="text" id="tags" name="tags" placeholder="#태그">
            </div>
            <div class="form-group">
                <label for="file">동영상 업로드</label>
                <input type="file" id="file" name="file" required>
            </div>	
            <button type="submit">등록</button>
        </form>
    </div>

    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    <script>
        var quill = new Quill('#editor-container', { theme: 'snow' });
        document.querySelector('form').addEventListener('submit', function() {
            document.getElementById('content').value = quill.root.innerHTML;
        });
    </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>


