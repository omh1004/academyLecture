<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${path }/resources/css/common/main.css"/>



<!-- 슬라이더 도트 -->
<div id="carouselExample" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath}/resources/images/java-lecture.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/images/GitHub-lecture.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/resources/images/jspservlet-lecture.png" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<script>
$('.carousel').carousel({
  interval: 2000,  // 슬라이드가 자동으로 전환되는 시간 간격 (밀리초)
  wrap: true,      // 마지막 슬라이드에서 첫 번째 슬라이드로 자동 전환
  touch: true      // 터치 스크린에서 슬라이드를 넘길 수 있게 설정
});

// 부드러운 전환을 위한 추가적인 jQuery 애니메이션
$('.carousel').on('slide.bs.carousel', function (e) {
  var nextH = $(e.relatedTarget).height();
  $(this).find('.active.item').parent().animate({ height: nextH }, 500);
});
</script>




<!-- 강의 목록 -->
<div class="course-list">
    <div class="course-card">
        <img src="${pageContext.request.contextPath}/resources/images/java-lecture.jpg"  alt="Java Course" class="course-image">
        <div class="course-info">
            <h3 class="course-title">유병승의 자바입문 - 코드로 시작하는 자바 첫걸음</h3>
            <p class="course-instructor">bs</p>
            <p class="course-price">₩17,000,000</p>
        </div>
    </div>

    <div class="course-card">
        <img src="${pageContext.request.contextPath}/resources/images/GitHub-lecture.jpg"  alt="GitHub Course" class="course-image">
        <div class="course-info">
            <h3 class="course-title">유병승의 GitHub 입문</h3>
            <p class="course-instructor">bs</p>
            <p class="course-price">₩17,000,000</p>
        </div>
    </div>

    <div class="course-card">
        <img src="${pageContext.request.contextPath}/resources/images/jspservlet-lecture.png"  alt="JSP+Servlet Course" class="course-image">
        <div class="course-info">
            <h3 class="course-title">유병승의 Jsp+Servlet 입문</h3>
            <p class="course-instructor">bs</p>
            <p class="course-price">₩17,000,000</p>
        </div>
    </div>
</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>