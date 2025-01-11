package com.univora.mypage.controller;

import java.io.IOException;
import java.text.ParseException;      // 시간/날짜 파싱 예외 처리
import java.text.SimpleDateFormat;
import java.util.Date;                // Date 클래스

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.univora.common.MyFileRenamePolicy;
import com.univora.login.model.dto.Member;
import com.univora.mypage.model.dto.AttachFile;
import com.univora.mypage.model.service.MyLectureService;
import com.univora.mypage.model.service.MyPageService;


/**
 * Servlet implementation class MyopenLectureAddServlet
 */
@WebServlet("/mypage/myopenLectureAdd.do")
public class MyopenLectureAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MyLectureService lectureService = new MyLectureService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyopenLectureAddServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		 Member loginMember = (Member) request.getSession().getAttribute("loginMember");
		
			String path = request.getServletContext().getRealPath("/resources/upload/lecture/image");
			System.out.println(path);
			// multipartrequest객체가 생성되면서 바이너리로 전달된 데이터를 해당경로에
			// 저장!
			MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 1024, "utf-8",
					new DefaultFileRenamePolicy());
			

			// 보낸 데이터를 처리${pageContext.request.contextPath}/resources/upload/lecture/image/${lecture.lecturePicture}"
//			String boardTitle = mr.getParameter("title");
			String name = mr.getParameter("name");
			String content = mr.getParameter("content");
			String date = mr.getParameter("date");
			String timeWithPeriod = mr.getParameter("time");
			
			  // 시간 변환
	        SimpleDateFormat inputFormat = new SimpleDateFormat("hh:mm a");
	        SimpleDateFormat outputFormat = new SimpleDateFormat("HH:mm");
	        String convertedTime;
	        try {
	            Date parsedTime = inputFormat.parse(timeWithPeriod);
	            convertedTime = outputFormat.format(parsedTime); // Convert to 24-hour format
	        } catch (ParseException e) {
	            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
	            response.getWriter().write("{\"message\": \"Invalid time format.\"}");
	            return;
	        }

			// 업로드 파일에 대한 정보 가져오기
			// getOriginalFileName("type=file의 name속성값") -> 업로드한 파일명
			// getFilesystemName("type=file의 name속성값") -> 리네임된 파일명
	        
			String originalFileName = mr.getOriginalFileName("lectureImage");
			String renamedFileName = mr.getFilesystemName("lectureImage");

			String lectureNo 
				= new MyPageService().saveLecture(
						name, content
						, date, convertedTime
						,loginMember.getMemberNo(),renamedFileName);

			String msg, loc;
			
			if (lectureNo!=null) {

				AttachFile uploadFile = AttachFile.builder().lectureNo(lectureNo).originalFileName(originalFileName)
						.renamedFileName(renamedFileName).path(path).build();

				lectureService.uploadFile(uploadFile);


				
				msg = "강의 등록성공!";
				loc = "/mypage/myopenlecture.do";



		
			}else {
				
				msg = "강의 등록실패!";
				loc = "/mypage/myopenlecture.do";
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
