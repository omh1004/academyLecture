package com.lecture.mypage.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Servlet implementation class PaymentCompleteServlet
 */
@WebServlet("/payment/complete")
public class PaymentCompleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentCompleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(request);
		
		String pamentId = request.getParameter("pamentId");
		
		System.out.println("pamentId"+pamentId);
		
		BufferedReader reader = request.getReader();
		StringBuilder requestBody = new StringBuilder();
		
		System.out.println("body값"+requestBody+"네네네");
		
		String line;
		while ((line = reader.readLine()) != null) {
			System.out.println(line);
			requestBody.append(line);
		}
		
		

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> paymentData = mapper.readValue(requestBody.toString(), Map.class);
		
		System.out.println("asdfadsf넘어오냐?:::"+paymentData);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
