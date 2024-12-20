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
    		<form class="search-form" action="#" method="post">
        		<input type="text" class="search-input" placeholder="검색어를 입력하세요">
        		<div class="search-button">
            		<i class="fas fa-search"></i>
        		</div>
    		</form>
		</div>
      
      	<div class="login-menu">
      		<!-- 로그인시에만 보이게 처리 -->
	      	<div><a href="${path}/member/mypagepwcheck.do">마이페이지</a></div>
	      	<div><a href="#">로그아웃</a></div>
      	</div>
    </div>
    <nav class="category-bar">
		<ul class="main-nav">
			<li class="home">
				<a href="">전체게시판</a>
			</li>
			<li id="notice">
				<a href="">공지사항</a>
			</li>
			<li>
				<a href="${path}/board.do">게시판</a>
			</li>
		</ul>
	</nav>
  </div>