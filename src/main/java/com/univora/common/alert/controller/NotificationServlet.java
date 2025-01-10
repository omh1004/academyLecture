package com.univora.common.alert.controller;

import java.io.IOException;

//import com.example.service.NotificationService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.univora.common.alert.model.service.NotificationService;

// 알림 데이터 처리 서블릿
@WebServlet("/notifications")
public class NotificationServlet extends HttpServlet {

    private NotificationService notificationService = new NotificationService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
       System.out.println("여기 들어오냐?");
    	
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String memberId = (String) request.getSession().getAttribute("memberId");

        if (memberId == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("Unauthorized: User not logged in.");
            return;
        }

        notificationService.markNotificationsAsRead(memberId);
        response.getWriter().write("Notifications marked as read.");
    }
}
