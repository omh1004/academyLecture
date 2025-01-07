package com.lecture.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lecture.model.dto.Member;

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
        Member user = (Member) session.getAttribute("loginMember");
        
		
 
		Member users = Member.builder()
                .nickName(nickName)
                .introduction(introduction)
                .email(email)
                .address(address)
                .phone(phone)
                .build();
		
		
		
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
