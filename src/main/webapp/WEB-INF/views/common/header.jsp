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
        <a href="${path }/">
            <img src="${pageContext.request.contextPath}/resources/images/header-logo.png" alt="univora" class="logo-img">
        </a>
        <div class="nav-items">
            <span>강의</span>
            <input type="text" class="search-box" placeholder="배우고 싶은 것들을 이야기해주세요">
            <button class="login-btn">Login</button>
          	<a href="${pageContext.request.contextPath}/mypage/main.do">임시 마이페이지 이동</a>
        </div>
    </header>

