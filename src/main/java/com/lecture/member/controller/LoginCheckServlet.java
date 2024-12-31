package com.lecture.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lecture.model.dto.Member;

/**
 * Servlet implementation class LoginCheckServlet
 */
@WebServlet("/login/login.do")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginCheckServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("memberId");
		System.out.println("memberId::: "+memberId);

		// request로 넘어온 비밀번호평문 암호화시켜서 db에 로그인 데이터와 비교

		
		

		// request로 요청된 정보가 있을 경우,
		if (memberId!=null) {
			
			
			Member invlidMember = Member.builder().memberId(memberId).build();
			// 아이디가 일치하는 회원이 있음 -> 로그인 성공
			// 세션에 저장해줘야 함
			// 세션으로 받은 Member 객체의 정보는 아래와 같다.
			// 혹시나 형변환시 아래의 객체로 형변환하기 바란다.오바!
			// com.gamjabat.model.dto.member
			System.out.println("로그인성공 !!!!!!");
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", invlidMember);

			if (memberId.equals("admin123")) {
				request.getRequestDispatcher("/admin/main.do").forward(request, response);
			} else {
				request.getRequestDispatcher("/main/login.do").forward(request, response);
				
			}
		} else {
			//로그인 실패시, 아이디와 패스워드가 일치하지 않습니다. 메세지 팝업후, 
			//요청한 페이지, 즉!  로그인 페이지로 다시 넘어간다. 
			System.out.println("로그인실패 !!!!!!");

			// 로그인 실패
			request.setAttribute("msg", "아이디와 패스워드가 일치하지 않습니다.");
			request.setAttribute("loc", "/");
		}
	// 메인 페이지로 포워딩
        //request.getRequestDispatcher("/WEB-INF/views/common/main.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
