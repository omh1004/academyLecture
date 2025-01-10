<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강의 상세등록</title>
    <!-- Quill.js CSS -->
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${path}/resources/css/board/boardwrite.css">
</head>
<script>
</script>
    <div class="main-container">

        <h1 class="page-title">강의 상세 등록.</h1>
		<form action='${path}/lecture/myopenLecturedetail.do' 
		method="post" enctype="multipart/form-data">
			<input type="hidden" name="lectureNo" value="${openLecture.lectureNo}"/>
			            <div class="section">
                <div class="form-group">
                    <label for="category">난이도를 선택해 주세요.</label>
                    <div class="select-container">
                        <select id="category" class="form-control" name="category">
                        	<option value="LDF001">입문</option>
						<option value="LDF002">초급</option>
						<option value="LDF003">중급</option>
						<option value="LDF004">고급</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="title">${openLecture.className}</label>
                    <input type="text" id="title" class="form-control"  name="title" value="${openLecture.className}" readonly>
                </div>
            </div>

            <!-- 섹션 2: 내용 입력 -->
            <div class="section">
                <div class="form-group">
                 	<label for="title">강의 상세 내용</label>
                    <label for="editor-container">내용을 입력해 주세요.</label>
                    <div id="editor-container"></div>
                    <input id="content" type="hidden" name="instructorintro">
                </div>
            </div>
            
                        <!-- 섹션 2: 내용 입력 -->
            <div class="section">
                <div class="form-group">
                <label for="title">강의 동영상</label>
                   <input type="file" name="upfile"/>
                </div>
            </div>

            <!-- 등록 버튼 -->
            <div class="button-container">
                <button id="submit-btn">수정</button>

            </div>
			
			
		</form>
	</div>
	
	<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	<script>
	    var quill = new Quill('#editor-container', {
	        theme: 'snow',
	        placeholder: '내용을 입력해 주세요...',
	        modules: {
	            toolbar: {
	                container: [['bold', 'italic', 'underline'], [{ 'header': 1 }, { 'header': 2 }], [{ 'list': 'ordered'}, {'list': 'bullet'}], ['link', 'image']],
	                handlers: {
	                    'image': imageHandler
	                }
	            }
	        }
	    });
	    
	    function imageHandler() {
	        const input = document.createElement('input');
	        input.setAttribute('type', 'file');
	        input.setAttribute('accept', 'image/*');
	        input.click();
	        input.onchange = async () => {
	          const file = input.files[0];
	          if (file) {
	            const formData = new FormData();
	            formData.append('image', file);
	            try {
	              const response = await fetch('${path}/board/boardattachment.do', {
	                method: 'POST',
	                body: formData
	              });
	              const data = await response.json();
	              const range = this.quill.getSelection(true);
	              this.quill.insertEmbed(range.index, 'image', data.imageUrl);
	            } catch (error) {
	              console.error('Failed to upload image:', error);
	            }
	          }
	        };
	      }

	    document.getElementById('submit-btn').addEventListener('click', function() {
	        var content = quill.root.innerHTML;
	        document.getElementById("content").value = content;
	    });
	
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>






