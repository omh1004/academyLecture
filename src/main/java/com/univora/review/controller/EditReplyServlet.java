package com.univora.review.controller;

import java.io.IOException;

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
 * Servlet implementation class EditReplyServlet
 */
@WebServlet("/lecture/editReply.do")
public class EditReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ReviewService reviewService = new ReviewService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String reviewNo = request.getParameter("reviewNo");
        String lectureNo = request.getParameter("lectureNo");

        Review review = reviewService.getReplyById(reviewNo);
        if (review != null) {
            request.setAttribute("review", review);
            request.setAttribute("lectureNo", lectureNo);
            request.getRequestDispatcher("/WEB-INF/views/lecture/editReply.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMsg", "댓글 정보를 가져오는데 실패했습니다.");
            request.getRequestDispatcher("/WEB-INF/views/common/errorPage.jsp").forward(request, response);
        }
	    
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String reviewNo = request.getParameter("reviewNo");
	        String reviewContent = request.getParameter("reviewContent");
	        String lectureNo = request.getParameter("lectureNo");

	        boolean isUpdated = reviewService.updateReply(reviewNo, reviewContent);

	        if (isUpdated) {
	            response.sendRedirect(request.getContextPath() + "/lecture/registrationClassMain.do?lectureNo=" + lectureNo);
	        } else {
	            request.setAttribute("errorMsg", "댓글 수정에 실패했습니다.");
	            request.getRequestDispatcher("/WEB-INF/views/common/errorPage.jsp").forward(request, response);
	        }
	    
	
		
		// TODO Auto-generated method stub
		// doGet(request, response);
	}

}
