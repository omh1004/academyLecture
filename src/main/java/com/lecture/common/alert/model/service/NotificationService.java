package com.lecture.common.alert.model.service;
import static com.lecture.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lecture.common.alert.model.dao.NotificationDAO;
import com.lecture.common.alert.websocket.NotificationWebSocket;


public class NotificationService {
    private final NotificationDAO notificationDAO = new NotificationDAO();

    public void createNotification(String memberId, String type, String content) {
        try (SqlSession session = getSession()) {
            notificationDAO.insertNotification(session, memberId, type, content);
            NotificationWebSocket.sendNotification(memberId, "새로운 알림이 도착했습니다!");
        }
    }

    public int getUnreadNotificationCount(String memberId) {
        try (SqlSession session = getSession()) {
            return notificationDAO.countUnreadNotifications(session, memberId);
        }
    }

    public List<Map<String, Object>> getUserNotifications(String memberId) {
        try (SqlSession session = getSession()) {
            return notificationDAO.selectNotificationsByMemberId(session, memberId);
        }
    }

    public void markNotificationsAsRead(String memberId) {
        try (SqlSession session = getSession()) {
            notificationDAO.markNotificationsAsRead(session, memberId);
        }
    }
}

