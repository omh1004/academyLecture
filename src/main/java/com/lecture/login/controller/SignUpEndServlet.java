package com.lecture.login.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.common.PasswordEncoding;
import com.lecture.member.model.service.MemberService;
import com.lecture.model.dto.Member;

/**
 * Servlet implementation class SignUpEndServlet
 */
@WebServlet("/login/signupend.do")
public class SignUpEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("utf-8");
		PasswordEncoding pe = new PasswordEncoding(request);
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String nickname = request.getParameter("nickname");
		String password = pe.getParameter("password");
		String email = request.getParameter("email");
		String birthYear = request.getParameter("birth-year");
		String birthMonth = request.getParameter("birth-month");
		String birthDay = request.getParameter("birth-day");
		
		// 월, 일이 한 자리인 경우 앞에 0 추가
        if (birthMonth != null && birthMonth.length() == 1) {
            birthMonth = "0" + birthMonth;
        }
        if (birthDay != null && birthDay.length() == 1) {
            birthDay = "0" + birthDay;
        }
		
        String birthDateStr = birthYear + "-" + birthMonth + "-" + birthDay;
		Date birthDate = Date.valueOf(birthDateStr);
		String phone = request.getParameter("phone");
		String sido = request.getParameter("sido");
		String gugun = request.getParameter("gugun");
		String address = sido + " " + gugun;
		String role = request.getParameter("role");
		
		Member insertMember = Member.builder()
								.memberName(name)
								.memberId(id)
								.nickName(nickname)
								.memberPwd(password)
								.email(email)
								.birthday(birthDate)
								.phone(phone)
								.address(address.equals("시/도 선택 구/군 선택")? null : address)
								.role(role)
								.build();
		
		MemberService service = new MemberService();
		
		//String msg, loc ="/";
		try {
			int result = service.signupMember(insertMember);
			//msg="회원가입을 성공하였습니다.";
			//loc="/";
		} catch(RuntimeException e) {
			e.printStackTrace();
			//msg="회원가입 실패하였습니다. 다시 시도해주세요.";
			//loc="/login/signupagreement.do";
		}
		
		//response.setContentType("text/html;charset=utf-8");
		
		//request.setAttribute("msg", msg);
		//request.setAttribute("loc", loc);

		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
