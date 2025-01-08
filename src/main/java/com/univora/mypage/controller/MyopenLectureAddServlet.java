package com.univora.mypage.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.text.ParseException;      // 시간/날짜 파싱 예외 처리
import java.text.SimpleDateFormat;
import java.util.Date;                // Date 클래스

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.univora.mypage.model.dto.Member;
import com.univora.mypage.model.service.MyPageService;


/**
 * Servlet implementation class MyopenLectureAddServlet
 */
@WebServlet("/mypage/myopenLectureAdd.do")
public class MyopenLectureAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		
		
        // JSON 데이터 읽기
        StringBuilder jsonBuffer = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                jsonBuffer.append(line);
            }
        }

        // JSON 데이터 파싱
        JSONObject jsonData = new JSONObject(jsonBuffer.toString());
        String name = jsonData.getString("name");
        String content = jsonData.getString("content");
        String date = jsonData.getString("date");
        String timeWithPeriod = jsonData.getString("time"); // Example: "10:30 AM"

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

        
        
		boolean isSuccess = new MyPageService().saveLecture(name, content, date, convertedTime,loginMember.getMemberId());
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		if (isSuccess) {
			response.getWriter().write("{\"message\": \"Lecture saved successfully.\"}");
		} else {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().write("{\"message\": \"Failed to save lecture.\"}");
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
