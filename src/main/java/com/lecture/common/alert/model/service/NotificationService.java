package com.lecture.common.alert.model.service;
import static com.lecture.common.SqlSessionTemplate.getSession;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;

import com.lecture.common.alert.model.dao.NotificationDAO;
import com.lecture.common.alert.utils.EmailSender;
import com.lecture.common.alert.websocket.WebSocketEndpoint;
import com.lecture.model.dto.Notification;

public class NotificationService {
    private NotificationDAO notificationDAO = new NotificationDAO();

    // 알림 생성 및 전송 처리
    public void processNotification(String userId, String content) {
    	SqlSession session = getSession();
    	
    	// 알림 데이터 생성
        Notification notification = new Notification();
        notification.setUserId("duatkdrbs12@gmail.com");
        notification.setType("action_triggered");
        notification.setContent(content);

        // DB에 알림 저장
        notificationDAO.insertNotification(session, notification);

        // WebSocket 알림 전송
        sendNotificationToWebSocket(userId, content);

        // 이메일 알림 전송
        String recipientEmail = "recipient_email@gmail.com"; // 사용자 이메일
        String emailSubject = "New Notification";
        String emailContent = "Hello, you have a new notification:\n\n" + content;
        sendEmailNotification(recipientEmail, emailSubject, emailContent);
    }

    // WebSocket 알림 전송
    public void sendNotificationToWebSocket(String userId, String message) {
        try {
            WebSocketEndpoint.sendNotification(String.valueOf(userId), message);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 이메일 알림 전송
    public void sendEmailNotification(String recipient, String subject, String content) {
        EmailSender.sendEmail(recipient, subject, content);
    }
}

