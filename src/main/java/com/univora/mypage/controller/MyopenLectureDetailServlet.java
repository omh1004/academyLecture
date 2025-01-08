package com.univora.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univora.mypage.model.dto.Member;
import com.univora.mypage.model.dto.OpenLecture;
import com.univora.mypage.model.service.MyPageService;

/**
 * Servlet implementation class MyopenLectureAddDetailServlet
 */
@WebServlet("/mypage/addLectureDetail.do")
public class MyopenLectureDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyopenLectureDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//강의 등록 상세 페이지 이동
			//이동 전에 해당강의의 정보를 조회한후 , request에 담아서 넘겨준다.
		
			String scheduleId = request.getParameter("id");
			HttpSession session = request.getSession();
			
			Member loginMember = (Member)session.getAttribute("loginMember");
			
			//강의 번호로 강의 조회
			//강의에서 뿌려줄 컬럼은???? 
			//Lecture_no , user_id, className, shore_intro ,opendate,open_time
			//dto만들자 
			OpenLecture olecture = new MyPageService().openLectureByLectureNo(scheduleId);
			
			
			request.setAttribute("openLecture", olecture);
			
			request.getRequestDispatcher("/WEB-INF/views/lecture/myopenLectureAddDetail.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
