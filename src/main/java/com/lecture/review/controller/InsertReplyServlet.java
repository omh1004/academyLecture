package com.lecture.review.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.lecture.model.dto.Member;
import com.lecture.model.dto.Review;
import com.lecture.review.model.service.ReviewService;

/**
 * Servlet implementation class InsertReplyServlet
 */
@WebServlet("/lecture/insertReply.do")
public class InsertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	
		// 요청 데이터 인코딩 설정
        request.setCharacterEncoding("UTF-8");
        
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
	    
        // 데이터 수집
        String parentReviewNo = request.getParameter("parentReviewNo"); // 부모 리뷰 번호
        String content = request.getParameter("content"); // 대댓글 내용
        String lectureNo = request.getParameter("lectureNo"); // 강의 번호

        // 데이터 유효성 검사
        if (parentReviewNo == null || content == null || studentNo == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"success\": false, \"message\": \"잘못된 요청 데이터\"}");
            return;
        }

     // Review 객체 생성
        Review reply = Review.builder()
        .parentReviewNo(parentReviewNo)
        .reviewContent(content)
        .studentNo(studentNo)
        .reviewLevel(2) // 대댓글 레벨
        .lectureNo(lectureNo) // 강의 번호도 포함
		.build();
		
        
        
        ReviewService reviewService = new ReviewService();
        
        // 서비스 호출
        int result = reviewService.insertReply(reply);

        // 결과 반환
        if (result > 0) {
            response.sendRedirect(request.getContextPath() + "/lecture/registrationClassMain.do?lectureNo=" + lectureNo);
        } else {
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().write("<script>alert('댓글 등록 실패! 다시 시도해주세요.'); history.back();</script>");
        }
    
    
    
        
}
	    
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/* TODO Auto-generated method stub*/
		doGet(request, response);
	}

}
