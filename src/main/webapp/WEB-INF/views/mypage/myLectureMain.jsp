<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <meta charset="UTF-8">
  <style>
    .course-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-template-rows: repeat(2, auto);
        gap: 1.5rem;
        max-width: 1280px;
        margin: 0 auto;
        padding: 1rem;
    }

    .course-card {
        background: white;
        border-radius: 0.5rem;
        overflow: hidden;
        box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    }

    .thumbnail {
        position: relative;
        aspect-ratio: 16/9;
        background: #f8f9fa;
    }

    .play-button {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background: rgba(0, 0, 0, 0.7);
        width: 40px;
        height: 40px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .progress-bar {
        height: 4px;
        background-color: #e9ecef;
        border-radius: 4px;
    }

    .progress-value {
        height: 100%;
        background-color: #12b886;
        border-radius: 4px;
    }

    @media (max-width: 1024px) {
        .course-grid {
            grid-template-columns: repeat(2, 1fr);
            grid-template-rows: repeat(3, auto);
        }
    }

    @media (max-width: 640px) {
        .course-grid {
            grid-template-columns: 1fr;
            grid-template-rows: repeat(6, auto);
        }
    }
</style>

<div class="course-grid">
    <!-- Row 1 -->
    <!-- Java Course -->
    <div class="course-card">
        <div class="thumbnail">
            <svg viewBox="0 0 400 300" xmlns="http://www.w3.org/2000/svg">
                <!-- Java course SVG content -->
                <rect width="400" height="300" fill="#f8f9fa"/>
                <g transform="translate(100, 50)">
                    <path d="M50 150 L250 150 L200 180 L0 180 Z" fill="#2d3436"/>
                    <path d="M60 50 L240 50 L250 150 L50 150 Z" fill="#74b9ff"/>
                    <path d="M65 55 L235 55 L244 145 L56 145 Z" fill="#0984e3"/>
                    <g fill="#fff" opacity="0.9">
                        <rect x="75" y="65" width="140" height="8" rx="2"/>
                        <rect x="75" y="85" width="120" height="8" rx="2"/>
                        <rect x="75" y="105" width="160" height="8" rx="2"/>
                        <rect x="75" y="125" width="100" height="8" rx="2"/>
                    </g>
                </g>
                <g transform="translate(260, 80)">
                    <path d="M20,0 C30,0 40,5 45,15 L50,30 L45,35 C42,38 35,40 25,40 C15,40 8,38 5,35 L0,30 L5,15 C10,5 20,0 20,0" fill="#e74c3c"/>
                    <path d="M15,-5 C25,-5 25,-15 15,-15 C5,-15 5,-5 15,-5" fill="#e74c3c" opacity="0.8"/>
                </g>
            </svg>
            <div class="play-button">
                <svg class="w-6 h-6 text-white" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M8 5v14l11-7z"/>
                </svg>
            </div>
        </div>
        <div class="p-4">
            <h3 class="font-medium mb-3">Do it! 자바 프로그래밍 입문 with 은종쌤</h3>
            <div class="progress-bar mb-2">
                <div class="progress-value" style="width: 27.9%"></div>
            </div>
            <div class="text-sm text-gray-600 mb-4">12 / 43강 (27.9%)</div>
            <button class="px-4 py-2 border rounded-lg text-sm text-gray-600 hover:bg-gray-50">
                ☆ 수강평 작성
            </button>
        </div>
    </div>

    <!-- Spring Course -->
    <div class="course-card">
        <div class="thumbnail">
            <img src="/api/placeholder/400/225" alt="Spring Introduction" class="w-full h-full object-cover">
            <div class="play-button">
                <svg class="w-6 h-6 text-white" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M8 5v14l11-7z"/>
                </svg>
            </div>
        </div>
        <div class="p-4">
            <h3 class="font-medium mb-3">스프링 입문 - 코드로 배우는 스프링 부트, 웹 MVC, DB 접근 기술</h3>
            <div class="progress-bar mb-2">
                <div class="progress-value" style="width: 14.29%"></div>
            </div>
            <div class="text-sm text-gray-600 mb-4">4 / 28강 (14.29%)</div>
            <button class="px-4 py-2 border rounded-lg text-sm text-gray-600 hover:bg-gray-50">
                ☆ 수강평 작성
            </button>
        </div>
    </div>

    <!-- JavaScript Course -->
    <div class="course-card">
        <div class="thumbnail">
            <img src="/api/placeholder/400/225" alt="JavaScript" class="w-full h-full object-cover">
            <div class="play-button">
                <svg class="w-6 h-6 text-white" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M8 5v14l11-7z"/>
                </svg>
            </div>
        </div>
        <div class="p-4">
            <h3 class="font-medium mb-3">[코드캠프] 훈훈한 Javascript</h3>
            <div class="progress-bar mb-2">
                <div class="progress-value" style="width: 0%"></div>
            </div>
            <div class="text-sm text-gray-600 mb-4">0 / 63강 (0%)</div>
            <button class="px-4 py-2 border rounded-lg text-sm text-gray-600 hover:bg-gray-50">
                ☆ 수강평 작성
            </button>
        </div>
    </div>

    <!-- Row 2 -->
    <!-- Bootstrap Course -->
    <div class="course-card">
        <div class="thumbnail">
            <img src="/api/placeholder/400/225" alt="Bootstrap 5" class="w-full h-full object-cover">
        </div>
        <div class="p-4">
            <h3 class="font-medium mb-3">부트스트랩 5(Bootstrap 5) - 기초부터 웹 프로젝트 만들기</h3>
            <div class="progress-bar mb-2">
                <div class="progress-value" style="width: 14.45%"></div>
            </div>
            <div class="text-sm text-gray-600 mb-4">12 / 83강 (14.45%)</div>
            <button class="px-4 py-2 border rounded-lg text-sm text-gray-600 hover:bg-gray-50">
                ☆ 수강평 작성
            </button>
        </div>
    </div>

    <!-- Spring Framework Course -->
    <div class="course-card">
        <div class="thumbnail">
            <img src="/api/placeholder/400/225" alt="Spring Framework" class="w-full h-full object-cover">
            <div class="play-button">
                <svg class="w-6 h-6 text-white" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M8 5v14l11-7z"/>
                </svg>
            </div>
        </div>
        <div class="p-4">
            <h3 class="font-medium mb-3">예제로 배우는 스프링 입문 (개정판)</h3>
            <div class="progress-bar mb-2">
                <div class="progress-value" style="width: 0%"></div>
            </div>
            <div class="text-sm text-gray-600 mb-4">0 / 13강 (0%)</div>
            <button class="px-4 py-2 border rounded-lg text-sm text-gray-600 hover:bg-gray-50">
                ☆ 수강평 작성
            </button>
        </div>
    </div>

    <!-- JPA Course -->
    <div class="course-card">
        <div class="thumbnail">
            <img src="/api/placeholder/400/225" alt="JPA" class="w-full h-full object-cover">
            <div class="play-button">
                <svg class="w-6 h-6 text-white" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M8 5v14l11-7z"/>
                </svg>
            </div>
        </div>
        <div class="p-4">
            <h3 class="font-medium mb-3">실전! 스프링 부트와 JPA 활용1 - 웹 애플리케이션 개발</h3>
            <div class="progress-bar mb-2">
                <div class="progress-value" style="width: 5.71%"></div>
            </div>
            <div class="text-sm text-gray-600 mb-4">2 / 35강 (5.71%)</div>
            <button class="px-4 py-2 border rounded-lg text-sm text-gray-600 hover:bg-gray-50">
                ☆ 수강평 작성
            </button>
        </div>
    </div>
</div>
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>   
</body>
</html>