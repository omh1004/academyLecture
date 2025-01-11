<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            justify-content: center;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            border: 1px solid #eee;
            border-radius: 4px;
            margin-bottom: 2rem;
        }

        .rating-number {
          text-align: center;
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


.sub-comment {
    margin-left: 2rem;
    border-left: 2px solid #ddd;
    padding-left: 1rem;
    margin-bottom: 15px;
    padding-bottom: 10px;
}

.sub-comment .d-flex {
    justify-content: space-between;
    align-items: center;
}

.review-date {
    font-size: 0.8rem;
    color: #666;
}

.dropdown {
    margin-left: 10px;
}



    </style>
</head>
<body>
	${lecture}
    <main class="main-content">
        <div class="course-header">
            <div class="course-image">
                 <img src="${pageContext.request.contextPath}/resources/upload/lecture/image/${lecture.lecturePicture}" alt="${lecture.className}" 
                 width="250px"/>
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
                    <button class="btn btn-secondary" onclick='addLectureBasket()'>장바구니 담기</button>
<%--                     			<a class="btn btn-primary" href="/univora/lectureBasket/add.do?lectureNo=${lecture.lectureNo}" role="button"> 장바구니 담기</a> --%>
                </div>
            </div>
        </div>

        <section class="instructor-section">
            <h2 class="section-title">강의소개</h2>
            <div class="instructor-profile">
                <img src="${pageContext.request.contextPath}/resources/upload/lecture/image/${lecture.lecturePicture}" alt="유병승 선생님" class="instructor-image">
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
    <c:if test="${isStudentEnrolled}">
    
    <!-- 수강생일 경우에만 수강평 등록 버튼 표시 -->
        <button class="btn btn-primary" onclick="toggleReviewForm()">수강평 등록</button>
    </c:if>
	<c:if test="${!isStudentEnrolled}">
	
	    <!-- 수강생이 아닐 경우 -->
	    <p>수강평 등록은 강의를 수강한 학생만 가능합니다.</p>
	</c:if>
    </div>
    

    <div class="add-review-form" id="add-review-form" style="display: none; margin-bottom: 2rem;">
        <form action="/univora/lecture/insertReview.do" method="post" onsubmit="submitReview(); return false;">
            <input type="hidden" name="lectureNo" value="${lecture.lectureNo}" />
            <input type="hidden" name="className" value="${lecture.className}" />
            <input type="hidden" name="userId" value="${lecture.userId}" />
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
                <div class="rating-number">
                <!-- 소숫점은 2자리까지만 나오게하자!!!!!! -->
                 <fmt:formatNumber value= "${averageRating}" maxFractionDigits="3" />
                </div>
                <button class="btn btn-secondary" style="padding: 0.3rem 0.8rem;">추천순 ▾</button>
            </div>


<div class="review-list">
    <section class="reviews-section">
    <!-- 댓글 반복 -->
    <c:forEach var="review" items="${reviews}">
        <!-- 부모 댓글 (레벨 1) -->
        <c:if test="${review.reviewLevel == 1}">
            <div class="comment" style=" border-bottom: 2px solid #362D4B; padding-bottom: 15px; margin-bottom: 50px;">
                <div class="d-flex align-items-center" style="justify-content: space-between; margin-bottom: 10px;">
                    <!-- 닉네임 -->
                    <span class="fw-bold">${review.studentNo == null ? "익명" : review.studentNo}</span>
                    <!-- 별점 및 날짜 -->
                    <div class="d-flex align-items-center" style="gap: 150px; margin-left: 40px;">
                        <span class="rating-stars">
                            <c:forEach var="star" begin="1" end="5">
                                <i class="fas fa-star" style="color: ${star <= review.reviewRating ? '#FFD700' : '#ddd'};"></i>
                            </c:forEach>
                        </span>
                        
                         <!-- 작성일과 드롭다운 -->
        				<div class="d-flex align-items-center" style="gap: 10px;">
        
        
                        <span class="review-date" style="font-size: 0.8rem; color: #666;">
                            <c:choose>
                                <c:when test="${review.updatedDate != null}">
                                    수정됨: ${review.updatedDate}
                                </c:when>
                                <c:otherwise>
                                    작성일: ${review.createdDate}
                                </c:otherwise>
                            </c:choose>
                        </span>
                        
                        
                        <!-- 드롭다운 -->
                        <c:choose>
                            <c:when test="${review.isDeleted == 'N'}">
                            
                        <div class="dropdown" style="margin-left: 5px;">
                        
                        <!-- 드롭다운은 본인한테 밖에 안보인다. 본인이 아니면 수정 삭제가 불가능하다. -->
                       <c:if test="${review.studentNo == sessionScope.loginMember.memberNo}">
                            <a href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-three-dots">
                                    <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a.5.5 0 1 1 0-3 1.5.5.5 0 0 1 0 3"/>
                                </svg>
                            </a>
                            
                            
                          <ul class="dropdown-menu">
						    <li>
						        <a class="dropdown-item" href="/univora/lecture/editParentReply.do?reviewNo=${review.reviewNo}&lectureNo=${review.lectureNo}" 
						           onclick="return confirm('이 댓글을 수정하시겠습니까?');">
						            수정
						        </a>
						    </li>
						    <li>
						        <a class="dropdown-item" href="/univora/lecture/deleteParentReply.do?reviewNo=${review.reviewNo}&lectureNo=${review.lectureNo}" 
						           onclick="return confirm('이 댓글을 삭제하시겠습니까?');">
						            삭제
						        </a>
						        
						    </li>
						</ul>
						</c:if>
						
						
                        </div>
                         </c:when>
                            <c:otherwise>
                             <!-- 삭제된 댓글은 드롭다운 표시 X -->
                               </c:otherwise>
                        </c:choose>
                            
                    </div>
                </div>
               </div>
                <!-- 댓글 내용 -->
            <div>
                <c:choose>
                    <c:when test="${review.isDeleted == 'Y'}">
                        <i>수강평이 삭제되었습니다.</i>
                    </c:when>
                    <c:otherwise>
                        ${review.reviewContent}
                    </c:otherwise>
                </c:choose>
            </div>
                
                
                <!-- 좋아요 및 댓글 입력 -->
            <div class="board-stats my-3 d-flex align-items-center">
           		<div class="d-flex justify-content-center align-items-center px-1">	
	            	<div id="heart-icon" class="heart-icon" class="icons" name="${review.reviewNo }">
		            	<!-- 빈하트 -->
	           			<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-heart mx-1" viewBox="0 0 16 16">
							<path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
						</svg>
						<!-- 빨간 하트 
						<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="#dc3545" class="bi bi-heart-fill mx-1" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
						</svg>  -->
					</div>
	                <span class="fw-bold"> 좋아요 ${review.reviewLikeCount } </span>
           		</div>
                <div class="d-flex justify-content-center align-items-center px-1">
                	<div class="icons">
	                	<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-chat-left-dots mx-1" viewBox="0 0 16 16">
						  <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
						  <path d="M5 6a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0m4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0"/>
						</svg>
                	</div>
	                <span class="fw-bold"> 댓글 1</span>
                </div>
            </div>
            
                
                
                
             
				<!-- (게시글은 강사만 올릴 수 있으니 단순 비교만 하면 됨) 게시글을 올린 userId와 현재 접속해있는 memberId가 같으면 답글을 달 수 있음. -->
             	<c:if test="${lecture.userId != null && sessionScope.loginMember != null && lecture.userId == sessionScope.loginMember.memberNo}">   
                	<button class="btn btn-reply" onclick="toggleReplyForm('${review.reviewNo}')">답글</button>
				</c:if>
				
				
				                
                <!-- 답글 작성 폼 -->
				<div class="reply-form" id="reply-form-${review.reviewNo}" style="display: none; margin-top: 1rem;">
				    <form action="/univora/lecture/insertReply.do" method="post">
				        <input type="hidden" name="parentReviewNo" value="${review.reviewNo}" />
				        <input type="hidden" name="lectureNo" value="${lecture.lectureNo}" />
				        <textarea name="content" class="reply-content" placeholder="답글을 입력하세요..." style="width: 100%; height: 80px;" required></textarea>
				        <button type="submit" class="btn btn-primary" style="margin-top: 0.5rem;">답글 작성</button>
				    </form>
				</div>

                
                
                
                
                <!-- 대댓글 작성 폼 
				<div class="reply-form">
				    <form action="/univora/lecture/insertReply.do" method="post">
				        <input type="hidden" name="parentReviewNo" value="${review.reviewNo}" />
				        <textarea name="replyContent" placeholder="답글을 입력하세요..." style="width: 100%; height: 80px;" required></textarea>
				        <button type="submit" class="btn btn-primary">답글 작성</button>
				    </form>
				</div>-->
                
               <!-- <div class="reply-form" style="margin-top: 1rem;">
				    <form action="/univora/lecture/insertReply.do" method="post">
				        <input type="hidden" name="parentReviewNo" value="${review.reviewNo}" />
				        <input type="hidden" name="lectureNo" value="${lecture.lectureNo}" />
				        <textarea name="content" class="reply-content" placeholder="답글을 입력하세요..." style="width: 100%; height: 80px;" required></textarea>
				        <button type="submit" class="btn btn-primary" style="margin-top: 0.5rem;">답글 작성</button>
				    </form>
				</div> -->
                
               <!--<div class="reply-form" id="reply-form-${review.reviewNo}" style="display: none; margin-top: 1rem;">
                    <form onsubmit="submitReply('${review.reviewNo}'); return false;">
                        <input type="hidden" name="parentReviewNo" value="${review.reviewNo}" />
                        <textarea name="content" class="reply-content" placeholder="답글을 입력하세요..." style="width: 100%; height: 80px;"></textarea>
                        <button type="submit" class="btn btn-primary">답글 작성</button>
                    </form>
                </div>  --> 

                <!-- 대댓글 (레벨 2) -->
                <c:forEach var="reply" items="${reviews}">
                    <c:if test="${reply.reviewLevel == 2 && reply.parentReviewNo == review.reviewNo}">
<div class="sub-comment" style="margin-left: 2rem; padding: 10px 15px; border-left: 2px solid #ddd; margin-bottom: 10px; background-color: #f9f9f9; border-radius: 5px;">
    <!-- 닉네임, 작성일, 드롭다운 -->
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
        <!-- 닉네임 -->
        <span class="fw-bold">${reply.studentNo == null ? "익명" : reply.studentNo}</span>
        <!-- 작성일 및 드롭다운 -->
        <div style="display: flex; align-items: center; gap: 10px;">
            <!-- 작성일 -->
            <span class="review-date" style="font-size: 0.8rem; color: #666;">
                <c:choose>
                    <c:when test="${reply.updatedDate != null}">
                        수정됨: ${reply.updatedDate}
                    </c:when>
                    <c:otherwise>
                        작성일: ${reply.createdDate}
                    </c:otherwise>
                </c:choose>
            </span>
             <!-- 드롭다운: 삭제되지 않은 리뷰만 표시 -->
                    <c:if test="${reply.isDeleted != 'Y'}">
            <div class="dropdown">
            
             <!-- 수정 삭제도 본인 이외에는 불가능 -->
            <c:if test="${review.studentNo == sessionScope.loginMember.memberNo}">
                <a href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" fill="currentColor" class="bi bi-three-dots">
                        <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5.5.5 0 0 1 0 3"/>
                    </svg>
                </a>
                <ul class="dropdown-menu">
				    <li>
				    
				    
				    
				    	<c:if test="${lecture.userId != null && sessionScope.loginMember != null && lecture.userId == sessionScope.loginMember.memberNo}">                 				
				        <a class="dropdown-item" href="/univora/lecture/editReply.do?reviewNo=${reply.reviewNo}&lectureNo=${reply.lectureNo}" 
				           onclick="return confirm('이 답글을 수정하시겠습니까?');">
				            수정
				        </a>
				        </c:if>
				    </li>
				    <li>
				    
				    
				    
				    
				    
				        <a class="dropdown-item" href="/univora/lecture/deleteReply.do?reviewNo=${reply.reviewNo}" 
				           onclick="return confirm('이 답글을 삭제하시겠습니까?');">
				            삭제
				        </a>
				    </li>
				</ul>
				</c:if>
            </div>
          </c:if>
        </div>
    </div>
    <!-- 댓글 내용 -->
    <c:choose>
                <c:when test="${reply.isDeleted == 'Y'}">
                    <div style="font-style: italic; color: #999;">삭제된 수강평입니다.</div>
                </c:when>
                <c:otherwise>
                    <div>${reply.reviewContent}</div>
                </c:otherwise>
            </c:choose>
</div>

            </c:if>
                </c:forEach>
            </div>
        </c:if>
    </c:forEach>
</section>






    
    
    
    
     


            
            
            
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
        const content = document.querySelector(`#reply-form-\${parentReviewNo} textarea`).value.trim();
        debugger;
        if (!content) {
            alert("내용을 입력하세요.");
            return;
        }

        fetch('/univora/lecture/insertReply.do', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                parentReviewNo: parentReviewNo,
                content: content,
            }),
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert("답글이 등록되었습니다.");
                    location.reload();
                } else {
                    alert("답글 등록 실패");
                }
            })
            .catch(error => console.error("답글 등록 실패:", error));
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

<script>

// 현재 상태 (true: 좋아요, false: 좋아요 해제)
let isLiked = false;
let heartIcon1 = document.getElementById("heart-icon"); // 아이디 중복 문제 해결
const likeCount = document.getElementById("likeCount");
// 클릭 이벤트 리스너 추가
// $(".heartIcon").click,((e) => {
//     // 상태 토글
//     isLiked = !isLiked;

//     // 상태에 따라 아이콘 변경
//     if (isLiked) {
//         // 빨간 하트
//         e.currentTarget.innerHTML = `
//             <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="#dc3545" class="bi bi-heart-fill mx-1" viewBox="0 0 16 16">
//                 <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
//             </svg>
//         `;
//     } else {
//         // 빈 하트
//         e.currentTarget.innerHTML = `
//             <svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-heart mx-1" viewBox="0 0 16 16">
//                 <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
//             </svg>
//         `;
//     }
// });


</script>

<!-- AJAX 하트 기능 추가 -->
<script>
// document.addEventListener("DOMContentLoaded", function() {
//     fetch(`${path}/lecture/isLiked.do?revieNo=${lectures.lectureNo}&memberNo=${sessionScope.loginMember.memberNo}`)
//     .then(response => {
//         if (!response.ok) {
//             throw new Error('서버 상태 이상'); // 서버에서 200 OK가 아닌 경우 에러 처리
//         }
//         return response.json();
//     })
//     .then(data => {
//         isLikeStatus = data.isLiked; // 좋아요 상태 변수 업데이트
//         if(isLikeStatus==1||isLikeStatus==0){   
//         	updateHeartIcon(isLikeStatus); // 하트 아이콘 업데이트
//         	const count=data.newLikeCount;
//         	$("#heart-icon+span").text("좋아요 "+count);
//         }
//         else alert("좋아요 실패! :( , 관리자에게 문의하세요!");
        
        
//     })
//     .catch(error => console.error('좋아요 상태 로드 실패:', error));
// });

// const heartIcon1 = document.getElementById("heart-icon"); // 아이디 중복 문제 해결
// const likeCount = document.getElementById("likeCount");



// 하트 클릭 시 좋아요 상태 토글
$(".heart-icon").click((e) => {
	console.log(e.target,e.currentTarget);
	const val=e.currentTarget.getAttribute("name");
	console.log(val);
    //isLikeStatus = !isLikeStatus; // 상태 토글
    heartIcon1=e.currentTarget;
     updateLikeStatus(e,val); // 서버로 요청 보내기
     
});

function updateLikeStatus(event,val) {
    fetch(`${path}/lecture/toggleLike.do`, {
        method: 'POST', // 메소드를 명시적으로 POST로 설정
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
        	reviewNo: val, // 실제 boardNo를 동적으로 전달
            memberNo: "${sessionScope.loginMember.memberNo}", //실제 memberNo를 동적으로 전달
            memberName: "${sessionScope.loginMember.memberId}",  //좋아요를 누른 강사의 id값을 전달하여, 알림처리
            className : "${lecture.className}"            
        })
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('좋아요 상태 변경 실패'); // 서버 에러 처리
        }
        return response.json();
    })
    .then(data => {
    	 isLikeStatus = data.success; // 좋아요 상태 변수 업데이트
         if(isLikeStatus==1||isLikeStatus==0){   
         	updateHeartIcon(event.currentTarget,isLikeStatus); // 하트 아이콘 업데이트
         	const count=data.newLikeCount;
         	$(event.currentTarget).next().text("좋아요 "+ count);
         }
         else alert("좋아요 실패! :( , 관리자에게 문의하세요!");
    })
    .catch(error => {
        console.error('좋아요 상태 업데이트 중 오류:', error);
        alert('네트워크 오류');
    });
}


// 하트 아이콘 업데이트 함수
function updateHeartIcon(element,isLikeStatus) {
	element.innerHTML = isLikeStatus==1 ? 
    `<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="#dc3545" class="bi bi-heart-fill mx-1" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314"/>
    </svg>` : 
    `<svg xmlns="http://www.w3.org/2000/svg" width="23" height="23" fill="currentColor" class="bi bi-heart mx-1" viewBox="0 0 16 16">
        <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
    </svg>`;
}


    async function addLectureBasket() {

    	const memberId = "${lecture.userId}";

    	console.log('무기개약직');
        try {
            //장바구니에 중복체크 (같은 강의가 있으면 안담기게 한다. )
            const response1 = await fetch('${pageContext.request.contextPath}/lectures/duplecateLecture.do', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ memberNo: memberId ,lectureNo : ${lecture.lectureNo} })
            });

            const result1 = await response1.json();

            if (result1.value > 0) { // 첫 번째 결과 값이 0보다 클 때만 두 번째 요청 수행
                const response2 = await fetch('${pageContext.request.contextPath}/univora/lectureBasket/add.do', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({lectureNo: ${lecture.lectureNo} })
                });

                const result2 = await response2.json();

                if (result2.success) {
                    alert('장바구니에 추가하였습니다.');
                } else {
                    alert('장바구니 담기에 실패하였습니다.');
                }
            } else {
                alert('이미 장바구니에 존재합니다. 장바구니를 확인하새요');
            }
        } catch (error) {
            console.error('Error:', error);
            alert('서버 요청 중 오류가 발생했습니다.');
        }
    }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>   
