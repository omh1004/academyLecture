package com.univora.lectures.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univora.lectures.model.dto.Lectures;
import com.univora.lectures.model.dto.Review;
import com.univora.lectures.model.service.LectureService;
import com.univora.review.model.service.ReviewService;


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
    
    private LectureService lectureService = new LectureService();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  	String lectureNo = request.getParameter("lectureNo");
		  	


		  	System.out.println("전달받은 lectureNo: " + lectureNo);

		  	
		  	LectureService lectureService = new LectureService();
		  	
		  	ReviewService reviewService = new ReviewService();
		  	
	        // 강좌 상세 정보 가져오기 
	        Lectures lecture = lectureService.getLectureDetail(lectureNo);      
	  
	        // 리뷰 리스트 가져오기
	        List<Review> reviews = lectureService.getLectureReviews(lectureNo);
	        
	        // 강의에 평균 점수를 가져와보자!!!!!!!!!!!!@@  review 테이블에서 가져와야함.
	        double averageRating = reviewService.getAverageRating(lectureNo);
	        request.setAttribute("averageRating", averageRating);

	        // JSP로 데이터 전달
	        request.setAttribute("lecture", lecture);
	        request.setAttribute("reviews", reviews);
	        
	        for (Review review : reviews) {
	            System.out.println(review);
	        }
	        

		    
	        // 강좌 상세 정보 가져오기
	       // Lectures lecture = lectureService.getLectureById(lectureNo);

	        // JSP로 데이터 전달
	        //request.setAttribute("lecture", lecture);
		
		
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
