package com.univora.common.alert.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univora.common.alert.model.service.NotificationService;

/**
 * Servlet implementation class NotificationMarkAsReadServlet
 */
@WebServlet("/notification/markAsRead.do")
public class NotificationMarkAsReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NotificationService notificationService = new NotificationService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotificationMarkAsReadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = (String) request.getSession().getAttribute("memberId");

        if (memberId == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("Unauthorized: User not logged in.");
            return;
        }

        int unreadCount = notificationService.getUnreadNotificationCount(memberId);
        response.setContentType("application/json");
        response.getWriter().write(String.valueOf(unreadCount));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
