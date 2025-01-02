<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <meta charset="UTF-8">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        }

        body {
            background-color: #f5f5f5;
        }

        .header {
            background-color: white;
            padding: 1rem;
            border-bottom: 1px solid #e0e0e0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: bold;
            color: #2d2b38;
        }

        .search-bar {
            flex-grow: 1;
            margin: 0 2rem;
            position: relative;
        }

        .search-bar input {
            width: 100%;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            border: none;
            background-color: #f0f0f0;
        }

        .main-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        .course-header {
            display: flex;
            gap: 2rem;
            margin-bottom: 2rem;
            background: white;
            padding: 2rem;
            border-radius: 8px;
        }

        .course-image {
            width: 240px;
            height: 160px;
            background: linear-gradient(45deg, #2b3a6a, #1a2442);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 3rem;
        }

        .course-info {
            flex: 1;
        }

        .course-title {
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .course-meta {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
            color: #666;
        }

        .course-meta span::after {
            content: "•";
            margin-left: 1rem;
        }

        .course-meta span:last-child::after {
            content: "";
        }

        .course-price {
            font-size: 1.5rem;
            font-weight: bold;
            margin: 1rem 0;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
        }

        .btn {
            padding: 0.8rem 2rem;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-size: 1rem;
        }

        .btn-primary {
            background-color: #2d2b38;
            color: white;
        }

        .btn-secondary {
            background-color: white;
            border: 1px solid #2d2b38;
            color: #2d2b38;
        }

        .instructor-section {
            background: white;
            padding: 2rem;
            border-radius: 8px;
            margin-bottom: 2rem;
        }

        .section-title {
            font-size: 1.3rem;
            margin-bottom: 1.5rem;
        }

        .instructor-profile {
            display: flex;
            gap: 2rem;
            background: #f8f8f8;
            padding: 1.5rem;
            border-radius: 8px;
        }

        .instructor-image {
            width: 120px;
            height: 120px;
            border-radius: 8px;
            object-fit: cover;
        }

        .instructor-info {
            flex: 1;
        }

        .instructor-name {
            font-size: 1.1rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .instructor-bio {
            color: #666;
            line-height: 1.6;
        }

        .reviews-section {
            background: white;
            padding: 2rem;
            border-radius: 8px;
        }

        .rating-summary {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            border: 1px solid #eee;
            border-radius: 4px;
            margin-bottom: 2rem;
        }

        .rating-number {
            font-size: 2rem;
            font-weight: bold;
        }

        .review-item {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid #eee;
        }

        .review-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #2d2b38;
        }

        .review-content {
            flex: 1;
        }

        .review-meta {
            display: flex;
            gap: 0.5rem;
            margin-bottom: 0.5rem;
            color: #666;
        }

        .review-buttons {
            display: flex;
            gap: 0.5rem;
            margin-top: 0.5rem;
        }

        .review-btn {
            padding: 0.3rem 0.8rem;
            border: 1px solid #ddd;
            border-radius: 20px;
            background: white;
            cursor: pointer;
            font-size: 0.9rem;
        }

        .footer {
            background-color: #2d2b38;
            color: white;
            padding: 2rem;
            margin-top: 4rem;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="logo">univora</div>
        <div class="search-bar">
            <input type="text" placeholder="배우고 싶은 지식을 이야기해주세요">
        </div>
        <div style="width: 40px; height: 40px; background: #2d2b38; border-radius: 50%;"></div>
    </header>

    <main class="main-content">
        <div class="course-header">
            <div class="course-image">
                 <img src="${pageContext.request.contextPath}/resources/images/${lecture.lecPic}" alt="${lecture.className}" />
            </div>
            <div class="course-info">
                <h1 class="course-title">${lecture.className}</h1>
                <div class="course-meta">
                     <span>${lecture.difficulty}</span>
                </div>
                <div>${lecture.userId}</div>
                <div class="course-price">₩${lecture.price}</div>
                <div class="action-buttons">
                    <button class="btn btn-primary">수강신청 하기</button>
                    <button class="btn btn-secondary">장바구니 담기</button>
                </div>
            </div>
        </div>

        <section class="instructor-section">
            <h2 class="section-title">강의소개</h2>
            <div class="instructor-profile">
                <img src="/api/placeholder/120/120" alt="유병승 선생님" class="instructor-image">
                <div class="instructor-info">
                    <div class="instructor-name">${lecture.instructorIntro}</div>
                    <div class="instructor-bio">
                        "느리더라도 절대 베이스적인 않는다. 노력하는 인생 실천한다."<br><br>
                        내버려두면 무너질 없는다는, 사내가로 천만 되고 되고 - 사회를 줄이기 우테코에, 소셜이 하였습니다. - ... 누워볼 하면 보여주는 것을 오늘도 누워 무작정하다.<br><br>
                    </div>
                </div>
            </div>
            <p style="margin-top: 2rem;">노력은 절대 배신하지 않는다. 노력하는 만큼 성장한다.</p>
        </section>

        <section class="reviews-section">
            <h2 class="section-title">수강평</h2>
            <div class="rating-summary">
                <div class="rating-number">4.5</div>
                <button class="btn btn-secondary" style="padding: 0.3rem 0.8rem;">추천순 ▾</button>
            </div>

            <div class="review-list">
                <div class="review-item">
                    <div class="review-avatar"></div>
                    <div class="review-content">
                        <div class="review-meta">
                            <span>univora</span>
                            <span>⭐⭐⭐⭐⭐</span>
                            <span>2024.01.11</span>
                        </div>
                        <div>좋은 강의 만족이 우수시 강입니다.</div>
                        <div class="review-buttons">
                            <button class="review-btn">👍 5</button>
                            <button class="review-btn">답글</button>
                        </div>
                    </div>
                </div>

                <div class="review-item">
                    <div class="review-avatar"></div>
                    <div class="review-content">
                        <div class="review-meta">
                            <span>univora</span>
                            <span>⭐⭐⭐⭐</span>
                            <span>2024.01.11</span>
                        </div>
                        <div>좋은 강의 만족이 우수시 강의합니다.</div>
                        <div class="review-buttons">
                            <button class="review-btn">👍 5</button>
                            <button class="review-btn">답글</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <footer class="footer">
        <div class="logo">univora</div>
        <div style="margin-top: 1rem; font-size: 0.9rem;">
            (주) 유니보라 | 대표자: 상균 | 사업자번호: 123-12-123456<br>
            전화번호: 1577 - 1533 | 주소: 서울시 금천구 가산동 마리오아울렛 2관 11층
        </div>
    </footer>

    <script>
        // Add event listeners for buttons
        document.querySelectorAll('.btn').forEach(button => {
            button.addEventListener('click', function() {
                if (this.textContent.includes('수강신청')) {
                    alert('수강신청이 진행됩니다.');
                } else if (this.textContent.includes('장바구니')) {
                    alert('장바구니에 담았습니다.');
                }
            });
        });

        // Add event listeners for review buttons
        document.querySelectorAll('.review-btn').forEach(button => {
            button.addEventListener('click', function() {
                if (this.textContent.includes('👍')) {
                    const currentLikes = parseInt(this.textContent.match(/\d+/)[0]);
                    this.textContent = `👍 ${currentLikes + 1}`;
                }
            });
        });
    </script>
     <jsp:include page="/WEB-INF/views/common/footer.jsp"/>   
</body>
</html>