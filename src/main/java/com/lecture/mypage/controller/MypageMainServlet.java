package com.lecture.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.model.dto.Member;
import com.lecture.mypage.model.dto.User;
import com.lecture.mypage.model.service.MyPageService;

/**
 * Servlet implementation class MypageMainServlet
 */
@WebServlet("/mypage/main.do")
public class MypageMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MyPageService service = new MyPageService();
		
		System.out.println(request.getSession().getAttribute("loginMember"));
		
		
		
		String loginId = ((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		
		
		
		
		System.out.println("loginId:::"+ loginId);
		
		User userProfile = service.getUserProfile(loginId);
		
		
		System.out.println(userProfile.toString());
		
		
		
		
		request.getRequestDispatcher("/WEB-INF/views/mypage/mypageMain.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
