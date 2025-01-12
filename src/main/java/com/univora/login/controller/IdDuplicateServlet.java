package com.univora.login.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.univora.login.model.dto.Member;
import com.univora.login.model.service.MemberService;

/**
 * Servlet implementation class IdDuplicateServlet
 */
@WebServlet("/login/idduplicate.do")
public class IdDuplicateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdDuplicateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	    // Request body에서 JSON 데이터를 읽음
        StringBuilder jsonBuffer = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                jsonBuffer.append(line);
            }
        }

        // JSON 문자열 파싱 (Gson 라이브러리 사용)
        String jsonString = jsonBuffer.toString();
        JsonObject jsonObject = JsonParser.parseString(jsonString).getAsJsonObject();

        // JSON 데이터 추출
        String id = jsonObject.get("id").getAsString();

        // 콘솔에 출력 (테스트용)
        System.out.println("Name: " + id);
        
        Member invalidId = new MemberService().selectMemberById(id);
        
        // 응답 작성
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("status", "success");
        responseJson.addProperty("message", "Data received successfully");
        
        response.getWriter().write(responseJson.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
