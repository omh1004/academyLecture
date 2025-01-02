package com.lecture.registration.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.lectures.model.service.LectureService;
import com.lecture.model.dto.Enrollment;
import com.lecture.model.dto.Lectures;

/**
 * Servlet implementation class RegistrationClassMainServlet
 */
@WebServlet("/lecture/registrationClassMain.do")
public class RegistrationClassMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationClassMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  	String lectureNo = request.getParameter("lectureNo");

		  	LectureService lectureService = new LectureService();
		  	
	        // 강좌 상세 정보 가져오기 
	        Lectures lecture = lectureService.getLectureDetail(lectureNo);      
	  
	        // 리뷰 리스트 가져오기
	        List<Enrollment> reviews = lectureService.getLectureReviews(lectureNo);
	        
	        // JSP로 데이터 전달
	        request.setAttribute("lecture", lecture);
	        request.setAttribute("reviews", reviews);
	        
	        System.out.println(reviews);
	        
			request.getRequestDispatcher("/WEB-INF/views/lecture/registrationClassMain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
