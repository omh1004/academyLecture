package com.univora.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univora.login.model.dto.Member;
import com.univora.mypage.model.dto.User;
import com.univora.mypage.model.service.MyPageService;

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
		
		String loginId = ((Member)request.getSession().getAttribute("loginMember")).getMemberId();
		
		User userProfile = service.getUserProfile(loginId);
		request.setAttribute("userProfile", userProfile);
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
