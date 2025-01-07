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
    <title>개인정보 수정</title>
    
    
    
    
    <style>
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
     color: white; /* 기본 글자 색상을 흰색으로 */
}

.container {
    max-width: 600px;
    margin: 50px auto;
    background-color: #362D4B;
    padding: 20px 30px; /* 패딩을 약간 넓게 */
    border-radius: 15px; /* 더 둥글게 */
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15); /* 더 부드러운 그림자 */
    border: 1px solid #e0e0e0; /* 가벼운 테두리 */
    transition: transform 0.2s ease-in-out; /* 호버 효과 추가 */
    color: white; /* 컨테이너 내부 글자 색상 */
}

.container:hover {
    transform: translateY(-5px); /* 호버 시 살짝 위로 이동 */
}

h2 {
    text-align: center;
    margin-bottom: 30px;
    color: white;
    font-size: 24px; /* 더 큰 글씨 */
    font-weight: bold;
    text-transform: uppercase; /* 대문자 처리 */
    letter-spacing: 1.5px;
}

.form-group {
    margin-bottom: 20px; /* 필드 간 간격 증가 */
}

label {
    display: block;
    margin-bottom: 8px; /* 더 넓은 간격 */
    font-weight: bold;
    color: white; /* 더 부드러운 색상 */
}

input[type="text"], input[type="email"], input[type="tel"] {
    width: 100%;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
    background-color: #f9f9f9; /* 더 밝은 배경 */
    color: #333;
    transition: border-color 0.3s ease, box-shadow 0.3s ease; /* 포커스 애니메이션 추가 */
}

input[type="text"]:focus, input[type="email"]:focus, input[type="tel"]:focus {
    border-color: #4CAF50; /* 포커스 시 초록색 테두리 */
    box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
    outline: none;
}

button {
    width: 100%;
    padding: 12px;
    background-color: #9998C2;
    color: white;
    border: 3px solid #472ED6; /* 수정 완료 버튼 테두리 */
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    text-transform: uppercase;
     margin-top: 20px; /* 버튼 위 간격 */
    transition: background-color 0.3s ease, transform 0.2s ease-in-out; /* 애니메이션 */
}

button:hover {
    background-color: #472ED6; /* 수정 완료 호버 색상 */
    transform: scale(1.02); /* 호버 시 버튼 크기 확대 */
}

.cancel-button {
    background-color: #9998C2;
    margin-top: 10px;
    transition: background-color 0.3s ease, transform 0.2s ease-in-out;
}

.cancel-button:hover {
    background-color: #472ED6; /* 취소 버튼 호버 색상 */
    transform: scale(1.02); /* 호버 시 버튼 크기 확대 */
}

a {
    text-decoration: none; /* 링크 스타일 제거 */
}

a:hover {
    text-decoration: underline; /* 호버 시 밑줄 표시 */
}

    </style>
</head>
<body>
    <div class="container">
        <h2>개인정보 수정</h2>
        <form action="${pageContext.request.contextPath}/mypage/updateProfile.do" method="post">
            <div class="form-group">
                <label for="nickName">닉네임</label>
                <input type="text" id="nickName" name="nickName" value="${userProfile.nickName}" required>
            </div>
            <div class="form-group">
                <label for="introduction">자기소개</label>
                <input type="text" id="introduction" name="introduction" value="${userProfile.introduction}">
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <input type="email" id="email" name="email" value="${userProfile.email}" required>
            </div>
            <div class="form-group">
                <label for="address">주소</label>
                <input type="text" id="address" name="address" value="${userProfile.address}">
            </div>
            <div class="form-group">
                <label for="phone">휴대폰 번호</label>
                <input type="tel" id="phone" name="phone" value="${userProfile.phone}">
            </div>
            <button type="submit">수정 완료</button>
            <a href="${pageContext.request.contextPath}/mypage/main.do">
                <button type="button" class="cancel-button">취소</button>
            </a>
        </form>
    </div>
</body>
</html>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>