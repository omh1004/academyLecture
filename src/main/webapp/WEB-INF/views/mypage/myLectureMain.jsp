<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>	

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <meta charset="UTF-8">
    <title>내 학습</title>


    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }

.my-lecture-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}



        h1 {
            font-size: 36px;
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

.lecture-grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* 4개의 열 레이아웃 */
    gap: 20px; /* 카드 간격 */
}






        .lecture-item {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .lecture-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .lecture-thumbnail {
    width: 100%;
    height: 180px;
    object-fit: cover;
}


        .lecture-info {
            padding: 15px;
        }

        .lecture-info h2 {
            font-size: 22px;
            color: #333;
            margin: 0 0 10px 0;
        }

        .lecture-info p {
            font-size: 14px;
            color: #666;
            margin: 5px 0;
        }

        .lecture-info .btn-learn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-color: #362D4B;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            cursor: pointer;
        }




        .lecture-info .btn-learn:hover {
            background-color: #0056b3;
        }
    </style>
    
</head>
<body>
	    <div class="my-lecture-container">
	        <h1>내 학습</h1>
	        <c:if test="${empty lectureDetails}">
	            <p style="text-align: center; color: #999;">현재 수강 중인 강의가 없습니다.</p>
	        </c:if>
	       
	        <div class="lecture-grid">
	    <c:forEach var="lecture" items="${lectureDetails}">
	        <div class="lecture-item">
	        <!-- 임시 사진 -->
	            <img src="${pageContext.request.contextPath}/resources/images/java-lecture.jpg" alt="강의 썸네일" class="lecture-thumbnail">
	            <div class="lecture-info">
	                <h2>${lecture.className}</h2>
	                <p>강사: ${lecture.instructorName}</p>
	                <p>시작일: ${lecture.classStartDate}</p>
	                <a href="${pageContext.request.contextPath}/lecture/myclassDetail.do?id=${lecture.lectureId}" class="btn-learn">학습 시작</a>
	            </div>
	        </div>
	    </c:forEach>
	</div>
	</div>


 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>   
</body>
</html>