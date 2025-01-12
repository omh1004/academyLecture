<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/common/main.css" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="search-results">
    <h1>"${param.query}"에 대한 검색 결과</h1>

    <c:if test="${empty searchResults}">
        <p>검색 결과가 없습니다.</p>
    </c:if>

    <!-- 강의 목록 -->
    <div class="course-list">
        <c:forEach var="lecture" items="${searchResults}">
            <div class="course-card">
                <img src="${pageContext.request.contextPath}/resources/upload/lecture/image/${lecture.lecturePicture}" alt="${lecture.className}" class="course-image">
                <div class="course-info">
                    <h3 class="course-title">
                        <a href="${pageContext.request.contextPath}/lecture/registrationClassMain.do?lectureNo=${lecture.lectureNo}">
                            ${lecture.className}
                        </a>
                    </h3>
                    <p class="course-instructor">${lecture.userId}</p>
                    <p class="course-price">₩${lecture.price}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
