package com.univora.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univora.login.model.dto.Member;
import com.univora.review.model.dto.Review;
import com.univora.review.model.service.ReviewService;

/**
 * Servlet implementation class UserReviewServlet
 */
@WebServlet("/mypage/userReviews.do")
public class UserReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
			HttpSession session = request.getSession();
		    
		    // 올바른 타입으로 가져오기
		    Member loginUser = (Member) session.getAttribute("loginMember");
		    if (loginUser == null) {
		        response.sendRedirect(request.getContextPath() + "/login.jsp");
		        return;
		    }

		    // `studentNo` 가져오기
		    String studentNo = loginUser.getMemberNo();
		    
			System.out.println("student 정보" + studentNo);
				
	        ReviewService reviewService = new ReviewService();
	        List<Review> userReviews = reviewService.getUserReviews(studentNo);
	
	        request.setAttribute("userReviews", userReviews);
	        request.getRequestDispatcher("/WEB-INF/views/mypage/userReviews.jsp").forward(request, response);
    
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
