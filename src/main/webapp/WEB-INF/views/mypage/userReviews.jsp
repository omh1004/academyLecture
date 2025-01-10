<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path" value="${pageContext.request.contextPath }"/>	


<style>
    .review-container {
        max-width: 1200px; /* 가로 폭 설정 */
        margin: 0 auto; /* 화면 가운데 정렬 */
        padding: 20px; /* 컨테이너 내부 여백 */
        font-family: Arial, sans-serif; /* 폰트 설정 */
    }

    h2 {
        text-align: center; /* 텍스트 중앙 정렬 */
        margin-bottom: 20px; /* 제목과 다음 요소 사이 간격 */
        font-size: 24px; /* 제목 폰트 크기 */
        color: #362D4B; /* 제목 텍스트 색상 변경 */
    }

    .review-list {
        display: flex; /* 가로로 배치 */
        flex-wrap: wrap; /* 화면 크기가 줄어들면 줄바꿈 */
        gap: 30px; /* 카드 간의 간격 */
        justify-content: space-between; /* 카드 간의 공간을 균등 배분 */
    }

    .review-item {
    	margin: 15px; /* 각 카드에 15px 간격 추가 */
        /* border: 4px solid #362D4B;  카드 테두리 색상 */
        border-radius: 8px; /* 카드 모서리 둥글게 */
        padding: 20px; /* 카드 내부 여백 */
        width: calc(33.333% - 60px); /* 한 줄에 3개씩 배치 */
        background-color: #362D4B; /* 카드 배경 색상 */
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        /* → border, background-color, box-shadow를 수정하면 카드의 외형 스타일이 바뀜 */
    }

    .review-header {
        display: flex; /* 제목과 날짜를 가로로 배치 */
        justify-content: space-between; /* 제목과 날짜를 양쪽 끝으로 정렬 */
        align-items: center; /* 세로 중앙 정렬 */
        margin-bottom: 10px; /* 헤더와 다음 요소 간의 간격 */
    }

    .review-header h3 {
        margin: 0; /* 제목의 외부 여백 제거 */
        font-size: 22px; /* 제목 폰트 크기 */
        color: #fff; /* 제목의 텍스트 색상 */
        font-weight : bold;
        /* → color를 수정하면 제목 색상이 바뀜 */
    }

    .review-header p {
        margin: 0; /* 날짜의 외부 여백 제거 */
        font-size: 14px; /* 날짜 텍스트 크기 */
        color: #fff; /* 날짜 텍스트 색상 */
        /* → color를 수정하면 날짜 색상이 바뀜 */
    }

    .review-content {
        margin-bottom: 10px; /* 본문과 다음 요소 간의 간격 */
        font-size: 16px; /* 본문 텍스트 크기 */
        color: #fff; /* 본문 텍스트 색상 */
        font-weight: bold; 
        /* → color를 수정하면 본문 텍스트 색상이 바뀜 */
    }

    .review-footer {
        text-align: right; /* 푸터 텍스트를 오른쪽 정렬 */
        font-size: 14px; /* 푸터 텍스트 크기 */
        font-weight: bold;
        color: red; /* 푸터 텍스트 색상 */
        /* → color를 수정하면 푸터 색상이 바뀜 */
    }

    /* 반응형 설정 */
    @media (max-width: 768px) {
        .review-item {
            width: calc(50% - 20px); /* 화면이 좁아지면 한 줄에 2개 배치 */
        }
    }

    @media (max-width: 480px) {
        .review-item {
            width: 100%; /* 화면이 더 좁아지면 한 줄에 1개 배치 */
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
                    <p>수강평: ${review.reviewContent}</p>
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
