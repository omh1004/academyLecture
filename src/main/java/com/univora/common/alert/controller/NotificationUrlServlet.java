package com.univora.common.alert.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univora.login.model.dto.Member;

// WebSocket URL을 제공하는 서블릿
@WebServlet("/notifications/ws-url")
public class NotificationUrlServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	HttpSession session  = request.getSession();

    	Member user = (Member) session.getAttribute("loginMember");
    	
    	
        String memberId = user.getMemberId();
        
        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("Unauthorized: User not logged in.");
            return;
        }

        // WebSocket URL 반환 (컨텍스트 경로 포함)
        //String wsUrl = "ws://localhost:9090/univora/notification-websocket/" + memberId;
        String wsUrl = "ws://3.34.104.219:9090/univora/notification-websocket/" + memberId;
        response.setContentType("text/plain");
        response.getWriter().write(wsUrl);
    }
}
