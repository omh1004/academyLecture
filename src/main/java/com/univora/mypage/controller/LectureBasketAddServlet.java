package com.univora.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univora.lectures.model.service.LectureService;
import com.univora.login.model.dto.Member;

/**
 * Servlet implementation class LectureBasketAddServlet
 */
@WebServlet("/lectureBasket/add.do")
public class LectureBasketAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LectureBasketAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 1. 파라미터로 강의 번호 가져오기
        String lectureNo = request.getParameter("lectureNo");
        String memberNo = ((Member) request.getSession().getAttribute("loginMember")).getMemberNo();
		
        
        
        // 2. 장바구니 추가 비즈니스 로직 호출
        LectureService basketService = new LectureService();
        boolean isAdded = basketService.addLectureToBasket(lectureNo, memberNo);

		
        // 3. 결과에 따라 페이지 이동
        if (isAdded) {
            response.sendRedirect(request.getContextPath() + "/lecture/registrationClassMain.do?lectureNo=" + lectureNo);
        } else {
            request.setAttribute("errorMsg", "장바구니 추가에 실패했습니다.");
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
