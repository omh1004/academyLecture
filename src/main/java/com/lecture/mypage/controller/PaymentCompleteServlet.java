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
import com.lecture.mypage.model.dto.Payment;
import com.lecture.mypage.model.service.MyPageService;

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
		
		BufferedReader reader = request.getReader();
		StringBuilder requestBody = new StringBuilder();
		
		String line;
		while ((line = reader.readLine()) != null) {
			requestBody.append(line);
		}

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> paymentData = mapper.readValue(requestBody.toString(), Map.class);
		
		System.out.println("넘어오냐?:::"+paymentData);
		
		String paymentId = (String) paymentData.get("paymentId");
		String transactionType = (String) paymentData.get("transactionType");
		String memberNo = (String) paymentData.get("customer");
		int totalAmound = (Integer)paymentData.get("totalAmound");
		String lectureNo = (String)paymentData.get("lectureNo");
		
		Payment payment = Payment.builder()
				.paymentId(paymentId)
				.paymentStatus(transactionType).studentId(memberNo).totalAmound(totalAmound).lectureId(lectureNo).build();
		
		int result = new MyPageService().savePayment(payment);
		
		
		String msg, loc = "/mypage/main.do";
		if (result > 0) {

			msg = "결재 처리 성공";
		} else {
			msg = "결재 처리 실패";
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
