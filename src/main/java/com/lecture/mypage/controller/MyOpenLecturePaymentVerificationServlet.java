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
 * Servlet implementation class MyOpenLecturePaymentVerificationServlet
 */
@WebServlet("/mypage/lecturebacket/paymentVerification.do")
public class MyOpenLecturePaymentVerificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MyOpenLecturePaymentVerificationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BufferedReader reader = request.getReader();
		StringBuilder requestBody = new StringBuilder();
		String line;
		while ((line = reader.readLine()) != null) {
			requestBody.append(line);
		}

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> paymentData = mapper.readValue(requestBody.toString(), Map.class);
		
		System.out.println("asdfadsf넘어오냐?:::"+paymentData);

//		String transactionId = (String) paymentData.get("transactionId");
//
//		try {
//			// PortOne API를 통해 결제 상태 검증
//			Map<String, Object> verifiedData = portOneService.verifyPayment(transactionId);
//
//			if ("PAID".equals(verifiedData.get("status"))) {
//				// 결제 내역 DB 저장
//				PaymentVO paymentVO = new PaymentVO();
//				paymentVO.setId((String) verifiedData.get("orderId"));
//				paymentVO.setAmount((int) verifiedData.get("amount"));
//				paymentService.processPayment(paymentVO);
//
//				response.getWriter().write("{\"success\":true}");
//			} else {
//				response.getWriter().write("{\"success\":false, \"message\":\"Invalid payment status\"}");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			response.getWriter().write("{\"success\":false, \"message\":\"Error occurred: " + e.getMessage() + "\"}");
//		}
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
