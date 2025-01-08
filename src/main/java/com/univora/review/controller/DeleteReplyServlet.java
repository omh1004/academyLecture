package com.univora.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univora.review.model.service.ReviewService;

/**
 * Servlet implementation class DeleteReplyServlet
 */
@WebServlet("/lecture/deleteReply.do")
public class DeleteReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    String reviewNo = request.getParameter("reviewNo");

		   
		    ReviewService reviewService = new ReviewService();
		    
		    // 삭제 처리
	        //boolean success = reviewService.deleteReview(reviewNo);

		    // 리뷰 삭제 후 해당 리뷰의 게시글 ID (lectureNo) 가져오기
	        String lectureNo = reviewService.deleteReviewAndGetPostId(reviewNo);
	        
	        if (lectureNo != null) {
	            // 삭제 성공 시 게시글 상세 페이지로 리다이렉트
	            response.sendRedirect(request.getContextPath() + "/lecture/registrationClassMain.do?lectureNo=" + lectureNo);
	        } else {
	            // 삭제 실패 시 에러 메시지와 함께 에러 페이지로 이동
	            request.setAttribute("errorMsg", "댓글 삭제에 실패했습니다.");
	            request.getRequestDispatcher("/WEB-INF/views/common/errorPage.jsp").forward(request, response);
	        }
	    }
	        //int result = reviewService.deleteReview(reviewNo);

//	        if (result > 0) {
//	            response.sendRedirect("/lecture/reviewList.do?message=deleted");
//	        } else {
//	            response.sendRedirect("/lecture/reviewList.do?error=deleteFailed");
//	        }
//	    }
//		
		
		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
