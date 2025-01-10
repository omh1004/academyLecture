package com.univora.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univora.login.model.dto.Member;
import com.univora.mypage.model.dto.MyLecture;
import com.univora.mypage.model.service.MyPageService;

/**
 * Servlet implementation class MypageMyLectureMainServlet
 */
@WebServlet("/mypage/myLectureMain.do")
public class MypageMyLectureMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyLectureMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");

        if (loginMember == null) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }

        String studentId = loginMember.getMemberNo(); // 현재 로그인한 사용자의 ID
        MyPageService service = new MyPageService();
		
		
        try {
            // 학생의 강의 상세 정보를 가져옴
            List<MyLecture> lectureDetails = service.getLectureDetails(studentId);

            
            // 강의가 중복 돼서 들어와도 Set으로 처리했기 떄문에 중복된 강의를 제거해줌.
            Set<MyLecture> lectureSet = new HashSet<>(lectureDetails);
            request.setAttribute("lectureDetails", new ArrayList<>(lectureSet));
            
            // JSP에 데이터 전달
            //request.setAttribute("lectureDetails", lectureDetails);

            // JSP로 포워딩
            request.getRequestDispatcher("/WEB-INF/views/mypage/myLectureMain.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "강의 데이터를 불러오는 중 오류가 발생했습니다.");
            request.getRequestDispatcher("/WEB-INF/views/common/errorPage.jsp").forward(request, response);
        }
		
		

		
		
		
		
		
		//request.getRequestDispatcher("/WEB-INF/views/mypage/myLectureMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
