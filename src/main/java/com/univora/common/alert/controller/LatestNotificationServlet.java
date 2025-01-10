package com.univora.common.alert.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.univora.common.alert.model.dto.Notification;
import com.univora.common.alert.model.service.NotificationService;
import com.univora.login.model.dto.Member;

// 서블릿 매핑
@WebServlet("/notifications/getLatestNotifications.do")
public class LatestNotificationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 응답 데이터 형식을 JSON으로 설정
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        
        HttpSession session = request.getSession();
       
        String memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
        
        try {

        	List<Notification> notifications = new NotificationService().selectAlert(memberId);

            // 데이터를 JSON 형식으로 변환
            String json = new Gson().toJson(notifications);

            // 응답에 JSON 데이터 작성
            response.getWriter().write(json);

        } catch (Exception e) {
            // 오류 발생 시 500 응답
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"알림 데이터를 가져오는 중 오류 발생\"}");
        }
    }


}
