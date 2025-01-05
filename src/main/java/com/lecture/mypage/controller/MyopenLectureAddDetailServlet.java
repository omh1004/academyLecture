package com.lecture.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.mypage.model.dto.AttachFile;
import com.lecture.mypage.model.dto.OpenLecture;
import com.lecture.mypage.model.service.MyLectureService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		// multipart/form-data방식으로 요청된 데이터 처리하기
		// 전달된 파일을 처리하기 위한 라이브러리를 이용하기
		// cos라이브러리를 이용해서 업로드를 처리 -> 톰켓 9버전 이하
		// 톰켓 10버전이상 cos라이브러리를 이용하지 못함.
		// commons-io, common-fileupload2 라이브러리를이용

		// MultipartRequest클래스를 이용해서 업로드처리
		// 매개변수 있는 생성자를 이용해서 클래스를 생성
		// -> 전달된 파일을 지정한 경로에 저장
		// 매개변수 5개 전달
		// 1 : HttpServletRequest객체
		// 2 : 파일업로드할 위치(String) -> 절대 경로로 지정
		// 3 : 업로드 파일에 최대크기를 설정(int) -> byte
		// 1024*1024 kbyte -> 1024 Mbyte
		// 4 : 인코딩방식 설정(String) -> UTF-8
		// 5 : 파일리네임 규칙 설정(객체) -> DefaultFileRenamePolicy클래스

		// 파일저장할 절대경로 가져오기
		// ServletContext객체가 제공하는 getRealPath()메소드로 프로젝트경로 가져옴

		MyLectureService lectureService = new MyLectureService();

		String path = request.getServletContext().getRealPath("/resources/upload/lecture");
		System.out.println(path);
		// multipartrequest객체가 생성되면서 바이너리로 전달된 데이터를 해당경로에
		// 저장!
		MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 1024, "utf-8",
				new DefaultFileRenamePolicy());

		// 보낸 데이터를 처리
//		String boardTitle = mr.getParameter("title");
		String category = mr.getParameter("category");
		String lectureNo = mr.getParameter("lectureNo");
		String instructorintro = mr.getParameter("instructorintro");

		// 업로드 파일에 대한 정보 가져오기
		// getOriginalFileName("type=file의 name속성값") -> 업로드한 파일명
		// getFilesystemName("type=file의 name속성값") -> 리네임된 파일명
		String originalFileName = mr.getOriginalFileName("upfile");
		String renamedFileName = mr.getFilesystemName("upfile");

		// 넘어온 데이터 lecture 테이블에 저장

		OpenLecture lecture = OpenLecture.builder().lectureNo(lectureNo).description(instructorintro).category(category)
				.build();

		int result = lectureService.updateMyLectureDetail(lecture);

		String msg, loc;

		
		if (result > 0) {

			AttachFile uploadFile = AttachFile.builder().lectureNo(lectureNo).originalFileName(originalFileName)
					.renamedFileName(renamedFileName).path(path).build();

			lectureService.uploadFile(uploadFile);


			msg = "게시글 등록성공!";
			loc = "/mypage/myopenlecture.do";



	
		}else {
			
			msg = "게시글 등록실패!";
			loc = "/mypage/myopenlecture.do";
		}

		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		request.getRequestDispatcher(getServletContext().getInitParameter("viewpath") + "/common/msg.jsp")
				.forward(request, response);

		
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
