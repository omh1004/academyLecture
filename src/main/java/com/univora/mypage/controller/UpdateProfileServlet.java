package com.univora.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univora.mypage.model.dto.Member;
import com.univora.mypage.model.service.MyPageService;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/mypage/updateProfile.do")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String nickName = request.getParameter("nickName");
        String introduction = request.getParameter("introduction");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
	        
		
        HttpSession session = request.getSession();
        Member loginMember  = (Member) session.getAttribute("loginMember");
        
        if (loginMember == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        
 
        // 사용자 정보 업데이트
        Member updatedUser = Member.builder()
                .memberId(loginMember.getMemberId())
                .nickName(nickName)
                .introduction(introduction)
                .email(email)
                .address(address)
                .phone(phone)
                .build();
		
        MyPageService service = new MyPageService();
		
        int result = service.updateUserProfile(updatedUser);

        if (result > 0) {
            session.setAttribute("loginMember", updatedUser); // 세션 업데이트
            response.sendRedirect(request.getContextPath() + "/mypage/main.do?success=true");
        } else {
            request.setAttribute("errorMsg", "프로필 수정에 실패했습니다.");
            request.getRequestDispatcher("/WEB-INF/views/common/errorPage.jsp").forward(request, response);
        }
    }
	
		
		// TODO Auto-generated method stub
		//doGet(request, response);
	

}
