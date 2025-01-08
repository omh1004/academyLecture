package com.univora.login.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univora.login.model.dto.Member;
import com.univora.login.model.service.MemberService;

/**
 * Servlet implementation class NewPasswordServlet
 */
@WebServlet("/login/checkmember.do")
public class NewPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String memberId = request.getParameter("id");
		String email = request.getParameter("email");
		
		Map<String, String> param = Map.of("memberId", memberId, "email", email);
		
		Member m = new MemberService().selectMemberToFindIdPwd(param);
		
		if(m != null) {
			HttpSession session = request.getSession();
			session.setAttribute("findPwdMemberNo", m.getMemberNo());
			
			request.getRequestDispatcher("/WEB-INF/views/login/newPassword.jsp")
			.forward(request, response);
			
			} else {
				// 로그인 실패
				request.setAttribute("msg", "존재하지 않는 회원입니다. 회원가입 창으로 이동합니다.");
				request.setAttribute("loc","/login/signupagreement.do");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				.forward(request, response);
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
