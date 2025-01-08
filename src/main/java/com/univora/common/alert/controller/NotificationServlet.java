package com.univora.common.alert.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univora.common.alert.model.service.NotificationService;

/**
 * Servlet implementation class NotificationServlet
 */
@WebServlet("/notifications")
public class NotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final NotificationService notificationService = new NotificationService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String memberId = (String) request.getSession().getAttribute("memberId");

        if (memberId != null) {
            int unreadCount = notificationService.getUnreadNotificationCount(memberId);
            response.getWriter().write(String.valueOf(unreadCount));
        } else {
            response.getWriter().write("0");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String memberId = (String) request.getSession().getAttribute("memberId");

        if (memberId != null) {
            notificationService.markNotificationsAsRead(memberId);
            response.getWriter().write("Notifications marked as read.");
        }
    }

}
