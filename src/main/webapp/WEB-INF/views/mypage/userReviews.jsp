<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>	


<style>
    .review-container {
        max-width: 1200px; /* 가로 폭 설정 */
        margin: 0 auto;
        padding: 20px;
        font-family: Arial, sans-serif;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }

    .review-list {
        display: flex; /* 가로 배치 */
        flex-wrap: wrap; /* 화면이 좁아지면 줄바꿈 */
        gap: 20px; /* 카드 간 간격 */
        justify-content: space-between; /* 공간을 균등 배분 */
    }

    .review-item {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        width: calc(33.333% - 20px); /* 한 줄에 3개씩 배치 */
        background-color: #f9f9f9;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .review-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 10px;
    }

    .review-header h3 {
        margin: 0;
        font-size: 18px;
        color: #4CAF50;
    }

    .review-header p {
        margin: 0;
        font-size: 14px;
        color: #999;
    }

    .review-content {
        margin-bottom: 10px;
        font-size: 16px;
        color: #555;
    }

    .review-footer {
        text-align: right;
        font-size: 14px;
        color: #777;
    }

    /* 반응형 설정 */
    @media (max-width: 768px) {
        .review-item {
            width: calc(50% - 20px); /* 화면이 좁아지면 한 줄에 2개 */
        }
    }

    @media (max-width: 480px) {
        .review-item {
            width: 100%; /* 더 좁아지면 한 줄에 1개 */
        }
    }
</style>




<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<!DOCTYPE html>
<html>
<head>

    
    
    <div class="review-container">
    <h2>내가 작성한 수강평</h2>
    
    <c:if test="${empty userReviews}">
        <p>작성한 수강평이 없습니다.</p>
    </c:if>
    
    
    <div class="review-list">
        <c:forEach var="review" items="${userReviews}">
            <div class="review-item">
                <div class="review-header">
                    <h3>${review.lectureNo}</h3>
                    <p>작성일: ${review.createdDate}</p>
                </div>
                <div class="review-content">
                    <p>${review.reviewContent}</p>
                </div>
                <div class="review-footer">
                    <p>평점: ${review.reviewRating}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
    
    
    
    
  
</div>
    
    
    
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>   
</body>
</html>
