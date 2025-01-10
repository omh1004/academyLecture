package com.univora.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univora.common.alert.model.service.NotificationService;
import com.univora.common.alert.websocket.NotificationWebSocket;
import com.univora.login.model.dto.Member;
import com.univora.review.model.dto.Review;
import com.univora.review.model.service.ReviewService;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 세션에서 로그인된 사용자 정보 가져오기
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");

		if (loginMember == null) {
			response.sendRedirect("/"); // 로그인 페이지로 리다이렉트
			return;
		}
		// 학생 번호 추출
		String studentNo = loginMember.getMemberNo();

		// 리뷰 데이터 가져오기
		String lectureNo = request.getParameter("lectureNo");
		String reviewContent = request.getParameter("reviewContent");
		double reviewRating = Double.parseDouble(request.getParameter("reviewRating"));

		// 알림을 위해 강의명과, 강사 아이디를 가져온다.
		String className = request.getParameter("className");
		String userId = request.getParameter("userId");

		// DTO 생성
		Review review = Review.builder().lectureNo(lectureNo).studentNo(studentNo).reviewContent(reviewContent)
				.reviewRating(reviewRating).reviewLikeCount(0).reviewLevel(1).build();

		// 리뷰 등록 서비스 호출
		ReviewService reviewService = new ReviewService();
		int result = reviewService.insertReview(review);

		// 결과에 따른 페이지 이동
		if (result > 0) {
			// 리뷰등록 성공 시, 해당 강의의 강사id에 강의명으로 content를 만들어서 알림을 보내줌
			new NotificationService().createNotification(userId, "review",
					loginMember.getMemberName() + " 학생이 강의명 : " + className + "에 리뷰를 남겼습니다.");

			response.sendRedirect(
					request.getContextPath() + "/lecture/registrationClassMain.do?lectureNo=" + lectureNo);
		} else {
			response.getWriter().write("리뷰 등록 실패");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
