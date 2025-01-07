package com.lecture.common.alert.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.common.alert.model.service.NotificationService;

/**
 * Servlet implementation class NotificationServlet
 */
@WebServlet("/send-notification")
public class NotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NotificationService notificationService = new NotificationService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // 사용자 요청 데이터 가져오기
        String userId = request.getParameter("userId");
        String content = request.getParameter("content");
        

        // 알림 생성 및 처리 요청
        notificationService.processNotification(userId, content);

        // 응답 반환
        response.getWriter().write("Notification processed successfully.");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
