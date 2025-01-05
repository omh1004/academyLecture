<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>	

<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/style.css">
    <link rel="stylesheet" href="${path}/resources/css/common/headerfooter.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.min.js"></script>
    <title>univora</title>
</head>
<body>
    <!-- Header -->
    <header class="header">
        <a href="${path }/main/login.do">
            <img src="${pageContext.request.contextPath}/resources/images/header-logo.png" alt="univora" class="logo-img">
        </a>
        <div class="nav-items">
            <span>강의</span>
            <input type="text" class="search-box" placeholder="배우고 싶은 것들을 이야기해주세요">

          
            
            <c:if test="${sessionScope.loginMember==null }">
             <a href="${path}/main/index.do"><button class="login-btn">Login</button></a>		                
   			</c:if>
          
          
        
        	<c:if test="${sessionScope.loginMember!=null }">
		     <!-- 프로필 버튼  차후에 쿼리스트링 방식으로 추가 필요. ?userId=${sessionScope.loginMember.memberNo}-->
		    <div class="profile-container">
		        <a href="${pageContext.request.contextPath}/mypage/main.do" class="profile-link">
		            <div class="profile-circle">
		                <!-- 프로필 이미지가 없다면 기본 아이콘 표시 
		                <img src="${pageContext.request.contextPath}/resources/images/우주.jpg" alt="프로필 이미지" onerror="this.src='/path-to-default-icon.png';">-->
		            </div>
		        </a>
		    </div>    
          	<!--<a href="${pageContext.request.contextPath}/mypage/main.do">임시 마이페이지 이동</a> -->
        </div>
        </c:if>
        
        
        
        
<style>
    .profile-container {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .profile-link {
        text-decoration: none;
    }

    .profile-circle {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: #362D4B; /* 기본 배경색 */
        overflow: hidden;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 1px solid #ddd; /* 테두리 */
        transition: box-shadow 0.2s ease-in-out;
    }

    .profile-circle:hover {
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* hover 효과 */
    }

    .profile-circle img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
</style>
        
        
    </header>

