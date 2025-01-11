<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <title>답글 수정</title>
 <style>
        body {
    display: flex;
    flex-direction: column; /* 컨텐츠가 위에서 아래로 쌓이도록 설정 */
    justify-content: flex-start; /* 컨텐츠 상단 정렬 */
    align-items: center; /* 가로로 중앙 정렬 */
    min-height: 100vh; /* 페이지가 최소 뷰포트 높이만큼 차지하도록 설정 */
    margin: 0; /* 기본 여백 제거 */
}

        .guidelines-container {
            background-color: #fff;
            width: 100%;
            max-width: 800px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-left: 6px solid #007bff;
            margin-bottom: 20px; /* 수정 컨테이너와 간격 */
        }

        .guidelines-container h3 {
            color: #007bff;
            margin-bottom: 10px;
        }

        .guidelines-container ul {
            margin: 0;
            padding-left: 20px;
            color: #333;
            line-height: 1.6;
        }

        .guidelines-container ul li {
            margin-bottom: 10px;
            font-size: 16px;
        }

        .edit-container {
            background-color: #fff;
            width: 100%;
            max-width: 600px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            resize: none;
        }

        .buttons {
            display: flex;
            justify-content: space-between;
        }

        .btn {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
        }

        .btn-primary {
            background-color: #362D4B;
            color: #fff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #f8f9fa;
            color: #333;
            border: 1px solid #ccc;
        }

        .btn-secondary:hover {
            background-color: #e2e6ea;
        }
        
           .guidelines-container h3 {
        color: #362D4B; /* 글씨 색깔 */
        font-size: 28px; /* 글씨 크기 */
        font-weight: bold; /* 글씨 굵기 */
        margin-bottom: 10px;
    }
    </style>
</head>
<body>

    <!-- 답글 작성 가이드 컨테이너 -->
    <div class="guidelines-container">
    
            <h3>답글 작성(수정) 시 유의사항</h3>
            <ul>
                <li>수강생들의 피드백이나 질문에 성실히 답변해주세요.</li>
                <li>답변은 친절하고 이해하기 쉽게 작성해주세요.</li>
                <li>강의 내용과 관련 없는 주제는 삼가주세요.</li>
                <li>비판적인 질문에도 정중하게 답변을 제공해주세요.</li>
                <li>수강생의 학습을 돕는 유용한 정보를 포함하는 것이 좋습니다.</li>
            </ul>
        </div>

        
        <div class="edit-container">
        <h2>답글 수정</h2>
        <form action="${pageContext.request.contextPath}/lecture/editParentReply.do" method="post">
            <input type="hidden" name="reviewNo" value="${review.reviewNo}" />
            <input type="hidden" name="lectureNo" value="${lectureNo}" />
            <textarea name="reviewContent" rows="5" placeholder="답글 내용을 입력하세요">${review.reviewContent}</textarea>
            <div class="buttons">
                <button type="submit" class="btn btn-primary">수정 완료</button>
                <a href="${pageContext.request.contextPath}/lecture/registrationClassMain.do?lectureNo=${lectureNo}" class="btn btn-secondary">취소</a>
            </div>
        </form>
    </div>
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
