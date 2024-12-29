<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="${path}/resources/css/style.css">
  <link rel="stylesheet" href="${path}/resources/css/common/headerfooter.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery-3.7.1.min.js"></script>
  <title>Edura</title>
</head>
<body>
	<div class="header-container">
    	<div class="header">
      	<div class="logo-container">
      		<a href="${path }/">
	      		<img src="${path}/resources/images/logo.png" class="logo" alt="Logo" onclick="mainPage();">
      		</a>
      	</div>
      	<div class="search-container">
    		<form class="search-form" action="${path }/board/searchKeyword.do">
        		<input type="text" class="search-input" name="keyword" placeholder="검색어를 입력하세요" value="${param.keyword != null ? param.keyword : ''}">
        		<button class="search-button" type="submit">
            		<i class="fas fa-search"></i>
        		</button>
    		</form>
		</div>
      
      	<div class="login-menu">
      		<c:if test="${sessionScope.loginMember!=null }">
		      	<div><a href="${path}/member/mypagepwcheck.do">마이페이지</a></div>
		      	<div><a href="${path}/login/logout.do">로그아웃</a></div>
	      	</c:if>
      	</div>
    </div>
    <nav class="category-bar">
		<ul class="main-nav">
			<li class="home">
				<a href="${path}/board.do">전체게시판</a>
			</li>
			<li id="notice">
				<a href="${path}/board/boardcategory.do?category=CAT-1">공지사항</a>
			</li>
			<li>
				<a href="#" id="board-menu">게시판</a>
				<ul class="dropdown" id="category-dropdown">
				     <li><a href="${path}/board/boardcategory.do?category=CAT-2">잡담</a></li>
				     <li><a href="${path}/board/boardcategory.do?category=CAT-3">책</a></li>
				     <li><a href="${path}/board/boardcategory.do?category=CAT-4">진학</a></li>
				     <li><a href="${path}/board/boardcategory.do?category=CAT-5">진로</a></li>
				     <li><a href="${path}/board/boardcategory.do?category=CAT-6">유아</a></li>
				     <li><a href="${path}/board/boardcategory.do?category=CAT-7">입시</a></li>
				     <li><a href="${path}/board/boardcategory.do?category=CAT-8">정보</a></li>
				     <li><a href="${path}/board/boardcategory.do?category=CAT-9">질문</a></li>
				</ul>
			</li>
		</ul>
	</nav>
  </div>
	