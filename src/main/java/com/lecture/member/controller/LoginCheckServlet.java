package com.lecture.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lecture.common.PasswordEncoding;
import com.lecture.lectures.model.service.LectureService;
import com.lecture.member.model.service.MemberService;
import com.lecture.model.dto.Lectures;
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
		
		
		// Service를 통해 강의 정보 가져오기(sk)
        LectureService lectureService = new LectureService();
        List<Lectures> lectureList = lectureService.getAllLectures();

        // 강의 정보를 JSP로 전달(sk)
        request.setAttribute("lectureList", lectureList);
        
		String memberId = request.getParameter("memberId");
		// request로 넘어온 비밀번호평문 암호화시켜서 db에 로그인 데이터와 비교
		PasswordEncoding pe = new PasswordEncoding(request);
		MemberService service = new MemberService();
		Member checkMember = Member.builder().memberId(memberId).memberPwd(pe.getParameter("password")).build();
		
		// 로그인 유효검사 하기  
		Member invalidMember =  new MemberService().loginCheckById(checkMember);
		
		System.out.println("invalidmember::: "+ invalidMember);

		// request로 요청된 정보가 있을 경우,
		if (invalidMember != null) {
			
			// 세션 넣기!~
			Member invlidMember = Member.builder()
	                .memberNo(invalidMember.getMemberNo())
	                .memberId(invalidMember.getMemberId())
	                .memberPwd(invalidMember.getMemberPwd())
	                .memberName(invalidMember.getMemberName())
	                .email(invalidMember.getEmail())
	                .phone(invalidMember.getPhone())
	                .address(invalidMember.getAddress())
	                .birthday(invalidMember.getBirthday())
	                .nickName(invalidMember.getNickName())
	                .createdAt(invalidMember.getCreatedAt())
	                .updatedAt(invalidMember.getUpdatedAt())
	                .deletedAt(invalidMember.getDeletedAt())
	                .isDeleted(invalidMember.getIsDeleted())
	                .role(invalidMember.getRole())
	                .introduction(invalidMember.getIntroduction())
	                .build();
			
			// 아이디가 일치하는 회원이 있음 -> 로그인 성공
			// 세션에 저장해줘야 함
			// 세션으로 받은 Member 객체의 정보는 아래와 같다.
			// 혹시나 형변환시 아래의 객체로 형변환하기 바란다.오바!
			// com.gamjabat.model.dto.member
			System.out.println("로그인성공 !!!!!!");
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", invlidMember);
			
			System.out.println("session집어넣음!!!!!세션값 loginMember"+invlidMember);

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
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
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
