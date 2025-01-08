package com.lecture.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.model.dto.Member;
import com.lecture.mypage.model.dto.LectureBasket;
import com.lecture.mypage.model.service.MyPageService;

/**
 * Servlet implementation class MypageLectureBasketServlet
 */
@WebServlet("/mypage/lectureBasket.do")
public class MypageLectureBasketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageLectureBasketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

		 Member loginMember = (Member) request.getSession().getAttribute("loginMember");
		
		// 수강바구니에서 가져와야 하는 데이터
		// 강의명, 강사닉네임, 로그인회원이름, 로그인회원 이메일, 로그인 회원 휴대폰번호
		// DTO 변수 자체는 OpenLecture와 같이나, 로직적으로 다를 수 있기 때문에, DTO를 LectureBasket으로 추가
		
		List<LectureBasket> basketList = new MyPageService().selectMyLectureBasket(loginMember.getMemberNo());
		
		String lectureNodes = "";
		
		
		
		for(int i = 0 ; i < basketList.size();i++) {
			
			if(i!=(basketList.size()-1)) {
				lectureNodes += ((LectureBasket)basketList.get(i)).getLectureNo()+",";
			}else {
				lectureNodes += ((LectureBasket)basketList.get(i)).getLectureNo();
			}
			
		}
		
		
		request.setAttribute("lectureNodes", lectureNodes);
		request.setAttribute("basketList", basketList);
		request.setAttribute("loginMember", loginMember);
		
		
		
		
		request.getRequestDispatcher("/WEB-INF/views/mypage/mypageLectureBasket.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
