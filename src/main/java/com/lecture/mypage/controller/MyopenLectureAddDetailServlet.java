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
		SqlSession session = SqlSessionTemplate.getSession();
		MyLectureService lectureService = new MyLectureService();

		try {
			// 강의 정보
			String category = request.getParameter("category");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String tags = request.getParameter("tags");

			// 파일 업로드
			Part filePart = request.getPart("file");
			String originalFileName = filePart.getSubmittedFileName();
			String savedFileName = UUID.randomUUID().toString() + "_" + originalFileName;
			String uploadPath = getServletContext().getRealPath("/resources/upload");

			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}

			String filePath = uploadPath + File.separator + savedFileName;
			filePart.write(filePath);

			// DB 저장
			String lectureNo = lectureService.registerLecture(session, category, title, content, tags);
			lectureService.uploadFile(session, lectureNo, originalFileName, savedFileName, filePath);

			session.commit();
			response.getWriter().write("강의 등록 및 파일 업로드 성공!");
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
			response.getWriter().write("강의 등록 실패");
		} finally {
			session.close();
		}
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
