package com.univora.lectures.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univora.lectures.model.dto.MyClass;
import com.univora.lectures.model.service.LectureService;

/**
 * Servlet implementation class MyclassDetailServlet
 */
@WebServlet("/lecture/myclassDetail.do")
public class MyclassDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyclassDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//lectureNo가 id 로 넘어왔을떄, lectureNo로 클릭을 했을때의 강의정보를 가져온다.
		
		String lectureNo = request.getParameter("id");
		//이때 동영상의 정보는 경로 정보를 가져온다.
		//가져와야 하는 데이터
		//강의사진, 강의명, 강사 닉네임, 강의 동영상 경로, 강사정보(강사명, 강사 짧은 소개 , 강의 긴소개);
		
		System.out.println("lectureNo:::"+lectureNo);
		
		MyClass myclass = new LectureService().getMyclassLectureByNo(lectureNo); 
		
		System.out.println("myclassekt:::"+myclass);
		
		request.setAttribute("myclass", myclass);
	
		request.getRequestDispatcher("/WEB-INF/views/lecture/myclassDetail.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
