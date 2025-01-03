package com.lecture.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lecture.model.dto.Member;
import com.lecture.model.dto.Review;
import com.lecture.review.model.service.ReviewService;

/**
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet("/lecture/insertReview.do")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션에서 로그인된 사용자 정보 가져오기
	    HttpSession session = request.getSession();
	    Member loginMember = (Member) session.getAttribute("loginMember");
	
	    if (loginMember == null) {
	        response.sendRedirect("/"); // 로그인 페이지로 리다이렉트
	        return;
	    }
	    System.out.println("세션에 저장된 사용자 정보: " + loginMember);
	    // 학생 번호 추출
	    String studentNo = loginMember.getMemberNo();
	    
	    // 리뷰 데이터 가져오기
	    String lectureNo = request.getParameter("lectureNo");
	    String reviewContent = request.getParameter("reviewContent");
	    double reviewRating = Double.parseDouble(request.getParameter("reviewRating"));

	    
	    // DTO 생성
	    Review review = Review.builder()
	        .lectureNo(lectureNo)
	        .studentNo(studentNo)
	        .reviewContent(reviewContent)
	        .reviewRating(reviewRating)
	        .reviewLikeCount(0)
	        .reviewLevel(1)
	        .build();
                
        // 리뷰 등록 서비스 호출
        ReviewService reviewService = new ReviewService();
        int result = reviewService.insertReview(review);

        // 결과에 따른 페이지 이동
        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/lecture/registrationClassMain.do?lectureNo=" + lectureNo);
        } else {
        	response.getWriter().write("리뷰 등록 실패");
        }
    }
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
