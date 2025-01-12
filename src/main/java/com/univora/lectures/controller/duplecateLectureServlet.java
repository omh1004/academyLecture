package com.univora.lectures.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.univora.admin.model.dto.Member;
import com.univora.admin.model.service.member.AdminMemberService;
import com.univora.lectures.model.service.LectureService;

/**
 * Servlet implementation class duplecateLectureServlet
 */
@WebServlet("/lectures/duplecateLecture.do")
public class duplecateLectureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public duplecateLectureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedReader reader = request.getReader();
		StringBuilder requestBody = new StringBuilder();
		
		String line;
		while ((line = reader.readLine()) != null) {
			requestBody.append(line);
		}

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> paymentData = mapper.readValue(requestBody.toString(), Map.class);
		
		String lectureNo = (String) paymentData.get("lectureNo");
		String memberNo = (String) paymentData.get("memberNo");

		
		
		int result = new LectureService().getCountLectureBaskectByLectureNo(lectureNo, memberNo);
		
		
		// 결재가 완료되었다.
		
//		if(result >0) {
//		
//			//결재가 완료된 강의를 찾아서 enrollment에서 수강여부를 y로 업데이트 해준다.
//			//위의 lectureNo 를 받아서 , 로 split해서 하나씩 업데이트 해준다. 
//			List<String> lectures=Arrays.asList(lectureNo.split(","));
//			new MyPageService().insertEbroll
//			
//		}
		
		
		String msg, loc = "/";
		if (result > 0) {

			msg = "회원 역할변경 완료";
		} else {
			msg = "회원 역할변경 실패!";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);

		request.getRequestDispatcher(getServletContext().getInitParameter("viewpath") + "/common/msg.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
