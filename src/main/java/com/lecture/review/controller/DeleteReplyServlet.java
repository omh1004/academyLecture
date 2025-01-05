package com.lecture.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.review.model.service.ReviewService;

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

	        if (reviewNo == null || reviewNo.isEmpty()) {
	            response.sendRedirect("/lecture/reviewList.do?error=invalid");
	            return;
	        }

	        ReviewService reviewService = new ReviewService();
	        //int result = reviewService.deleteReview(reviewNo);

//	        if (result > 0) {
//	            response.sendRedirect("/lecture/reviewList.do?message=deleted");
//	        } else {
//	            response.sendRedirect("/lecture/reviewList.do?error=deleteFailed");
//	        }
//	    }
//		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
