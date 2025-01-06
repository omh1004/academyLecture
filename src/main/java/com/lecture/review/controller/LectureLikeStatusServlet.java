package com.lecture.review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.lecture.review.model.service.ReviewService;

/**
 * Servlet implementation class BoardLikeStatusServlet
 */
@WebServlet("/lecture/isLiked.do")
public class LectureLikeStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureLikeStatusServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reviewNo = request.getParameter("reviewNo");
        String memberNo = request.getParameter("memberNo"); // 현재 로그인한 사용자 ID (세션에서 가져올 수도 있음)

        ReviewService reviewService = new ReviewService();
        int isLiked = reviewService.isLiked(reviewNo, memberNo);
        int newLikeCount = reviewService.getLikeCount(reviewNo);

        // JSON 형식으로 응답 반환
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("isLiked", isLiked);
        jsonResponse.put("newLikeCount", newLikeCount);
        out.print(jsonResponse.toString());
        out.flush();
    }
		
		
		
		
		
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
