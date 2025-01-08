package com.univora.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univora.review.model.service.ReviewService;


/**
 * Servlet implementation class DeleteParentReplyServlet
 */
@WebServlet("/lecture/deleteParentReply.do")
public class DeleteParentReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteParentReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String reviewNo = request.getParameter("reviewNo");
        String lectureNo = request.getParameter("lectureNo");


        // 부모 댓글 삭제 처리
        boolean success = new ReviewService().deleteParentReview(reviewNo);

        if (success) {
            // 삭제 성공 시 강의 상세 페이지로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/lecture/registrationClassMain.do?lectureNo=" + lectureNo);
        } else {
            // 실패 시 에러 페이지로 이동
            request.setAttribute("errorMsg", "댓글 삭제에 실패했습니다.");
            request.getRequestDispatcher("/WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
