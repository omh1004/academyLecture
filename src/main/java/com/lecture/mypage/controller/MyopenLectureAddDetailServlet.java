package com.lecture.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.ibatis.session.SqlSession;

import com.lecture.common.SqlSessionTemplate;
import com.lecture.mypage.model.service.MyLectureService;

/**
 * Servlet implementation class MyopenLectureAddDetailServlet
 */



@WebServlet("/lecture/myopenLecturedetail.do")
public class MyopenLectureAddDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyopenLectureAddDetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			MyLectureService lectureService = new MyLectureService();

			
			System.out.println(request.getParameterMap().toString());
			
			// 강의 정보
			String lectureNo = request.getParameter("lectureNo");
			String category = request.getParameter("category");
			String title = request.getParameter("title");
			String instructorintro = request.getParameter("instructorintro");
			
			System.out.println("inputData:::넘어요냐고!!" +lectureNo+category+title+instructorintro);
			

			// 파일 업로드
			Part filePart = request.getPart("file");
			String originalFileName = filePart.getSubmittedFileName();
			String savedFileName = UUID.randomUUID().toString() + "_" + originalFileName;
			String uploadPath =getServletContext().getRealPath("/resources/upload/lecture");

			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}

			String filePath = uploadPath + File.separator + savedFileName;
			filePart.write(filePath);

			// DB 저장
			

			lectureService.registerDetailLecture(lectureNo,category, title, instructorintro);
//			lectureService.uploadFile(lectureNo, originalFileName, savedFileName, filePath);


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
