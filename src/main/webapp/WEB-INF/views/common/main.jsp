<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
<jsp:include page="/WEB-INF/views/common/header.jsp"/>


        <!-- 강사 소개 섹션 -->
        <section class="instructor-section">
           <img src="${pageContext.request.contextPath}/resources/images/bs-teacher.jpg" alt="univora" class="logo-img">
            <div class="instructor-info">
                <h2 class="instructor-name">유병승 선생님</h2>
                <p class="instructor-quote">"누력곧 절대 배신시키 않는다. 노력하는 만큼 성장한다."</p>
                <p class="instructor-description">시행하다 지치면 모두하는 사람은 아무것도 없습니다. 그 누구도 모하기 위해서는 노력이 필요합니다. <br>
                그 노력에 힘을 실어주고 도움이 되고자 드리겠습니다. <br>
                꾸준한 공부야로 노력한다면 누구든 얻은 재산거리가 될 것입니다. <br>
                엣날 재현하기 위기 위한 기라의 단계의 드리겠습니다. 힘찬 노력하시요!</p>
            </div>
        </section>


        <!-- 슬라이더 도트 -->
        <div class="slider-dots">
            <div class="dot active"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
            <div class="dot"></div>
        </div>

        <!-- 강의 목록 -->
        <div class="course-list">
            <div class="course-card">
               <img src="${pageContext.request.contextPath}/resources/images/java-lecture.jpg" alt="java" class="logo-img">
                <div class="course-info">
                    <h3 class="course-title">유병승의 자바입문 - 코드로 시작하는 자바 첫걸음</h3>
                    <p class="course-instructor">bs</p>
                    <p class="course-price">₩17,000,000</p>
                </div>
            </div>

            <div class="course-card">
              <img src="${pageContext.request.contextPath}/resources/images/GitHub-lecture.jpg" alt="GitHub" class="logo-img">
                <div class="course-info">
                    <h3 class="course-title">유병승의 GitHub 입문</h3>
                    <p class="course-instructor">bs</p>
                    <p class="course-price">₩17,000,000</p>
                </div>
            </div>

            <div class="course-card">
              <img src="${pageContext.request.contextPath}/resources/images/jspservlet-lecture.png" alt="jspservlet" class="logo-img">
                <div class="course-info">
                    <h3 class="course-title">유병승의 Jsp+Servlet 입문</h3>
                    <p class="course-instructor">bs</p>
                    <p class="course-price">₩17,000,000</p>
                </div>
            </div>
        </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>