<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>	
	
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

    </style>
</head>
<body>

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
                    <div class="instructor-name">${lecture.shortIntro}</div>
                    <div class="instructor-bio">
                        ${lecture.instructorIntro}<br><br>
                    </div>
                </div>
            </div>
            <p style="margin-top: 2rem;">${lecture.detailedIntro}</p>
        </section>

<section class="reviews-section">
    <!-- 수강평 제목과 등록 버튼 -->
    <div class="review-header d-flex justify-content-between align-items-center mb-3">
        <h2 class="section-title mb-0">수강평</h2>
        <button class="btn btn-primary" onclick="toggleReviewForm()">수강평 등록</button>
    </div>

    <div class="add-review-form" id="add-review-form" style="display: none; margin-bottom: 2rem;">
        <form action="/univora/lecture/insertReview.do" method="post" onsubmit="submitReview(); return false;">
            <input type="hidden" name="lectureNo" value="${lecture.lectureNo}" />
            <textarea name="reviewContent" id="reviewContent" class="form-control" placeholder="수강평을 작성해주세요." rows="3" required></textarea>
            <div style="margin-top: 0.5rem;">
                <label for="reviewRating">평점: </label>
                <select name="reviewRating" id="reviewRating" class="form-select" style="width: auto; display: inline-block;">
                    <option value="5">⭐️⭐️⭐️⭐️⭐️ (5점)</option>
                    <option value="4">⭐️⭐️⭐️⭐️ (4점)</option>
                    <option value="3">⭐️⭐️⭐️ (3점)</option>
                    <option value="2">⭐️⭐️ (2점)</option>
                    <option value="1">⭐️ (1점)</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary" style="margin-top: 0.5rem;">수강평 작성</button>
        </form>
    </div>
    
            <div class="rating-summary">
                <div class="rating-number">4.5</div>
                <button class="btn btn-secondary" style="padding: 0.3rem 0.8rem;">추천순 ▾</button>
            </div>

<div class="review-list">
    <section class="reviews-section">
        <!-- 댓글 반복 -->
        <c:forEach var="review" items="${reviews}">
            <c:if test="${review.reviewLevel == 1}">
                <div class="comment">
                    <!-- 댓글 작성자 정보 -->
                    <div class="d-flex justify-content-between">
                        <span class="fw-bold">${review.studentNo == null ? "익명" : review.studentNo}</span>
                        <div class="dropdown">
                            <a href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-three-dots">
                                    <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
                                </svg>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#" onclick="editComment('${review.reviewNo}')">수정</a></li>
                                <li><a class="dropdown-item" href="#" onclick="deleteComment('${review.reviewNo}')">삭제</a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <!-- 댓글 내용 -->
                    <div>${review.reviewContent}</div>

                    <!-- 답글 버튼 -->
                    <button class="btn btn-reply" onclick="toggleReplyForm('${review.reviewNo}')">
                        답글
                    </button>

                    <!-- 대댓글 작성 폼 -->
                    <div class="reply-form" id="reply-form-${review.reviewNo}" style="display: none; margin-top: 1rem;">
                        <form onsubmit="submitReply('${review.reviewNo}'); return false;">
                            <input type="hidden" name="parentReviewNo" value="${review.reviewNo}" />
                            <textarea name="content" class="reply-content" placeholder="답글을 입력하세요..." style="width: 100%; height: 80px;"></textarea>
                            <button type="submit" class="btn btn-primary">답글 작성</button>
                        </form>
                    </div>
                </div>
            </c:if>

            <!-- 대댓글 (레벨 2) -->
            <c:if test="${review.reviewLevel == 2}">
                <div class="sub-comment d-flex flex-row" style="margin-left: 2rem; border-left: 2px solid #ddd; padding-left: 1rem;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right">
                        <path d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5"/>
                    </svg>
                    <div>
                        <div class="fw-bold">${review.studentNo == null ? "익명" : review.studentNo}</div>
                        <div>${review.reviewContent}</div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </section>
</div>





    
    
    
    
            <!--<div class="review-buttons">
                <button class="review-btn">👍 ${review.reviewLikeCount}</button> <!-- 좋아요 
                <button class="review-btn">답글</button>
            </div> -->



            
            
            
               <!--  <div class="review-item">
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
            </div> -->
        </section>
    </main>

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
    
    
    <script>
    function toggleReplyForm(reviewNo) {
     
        const form = document.getElementById(`reply-form-\${reviewNo}`);
        if (form) {
            const isHidden = form.style.display === "none";
            form.style.display = isHidden ? "block" : "none";
        } else {
            console.error(`Form with ID reply-form-${reviewNo} not found`);
        }
    }

    function submitReply(parentReviewNo) {
        const form = document.querySelector(`#reply-form-${parentReviewNo} textarea`);
        const content = form.value.trim();
        if (!content) {
            alert("내용을 입력해주세요.");
            return;
        }
        fetch('/univora/lecture/insertReply.do', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ parentReviewNo, content }),
        })
            .then(response => response.json())
            .then(data => {
                alert('댓글이 등록되었습니다.');
                location.reload();
            })
            .catch(error => console.error('댓글 등록 실패:', error));
    }

    function editComment(reviewNo) {
        // 수정 로직
        alert(`수정 기능은 ${reviewNo}에 대해 구현 중입니다.`);
    }

    function deleteComment(reviewNo) {
        if (confirm('정말로 삭제하시겠습니까?')) {
            fetch(`/univora/lecture/deleteComment.do`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ reviewNo }),
            })
                .then(() => {
                    alert('댓글이 삭제되었습니다.');
                    location.reload();
                })
                .catch(error => console.error('댓글 삭제 실패:', error));
        }
    }

</script>

<script>
    function toggleReviewForm() {
        const form = document.getElementById('add-review-form');
        if (form) {
            form.style.display = form.style.display === 'none' ? 'block' : 'none';
        } else {
            console.error('Form with ID add-review-form not found');
        }
    }
</script>

     <jsp:include page="/WEB-INF/views/common/footer.jsp"/>   
</body>
</html>