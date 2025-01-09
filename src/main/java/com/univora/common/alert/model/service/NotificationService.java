package com.univora.common.alert.model.service;
import static com.univora.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.univora.common.alert.model.dao.NotificationDAO;
import com.univora.common.alert.websocket.NotificationWebSocket;

public class NotificationService {

    private  NotificationDAO notificationDAO = new NotificationDAO();

    // 읽지 않은 알림 개수 가져오기
    public int getUnreadNotificationCount(String memberId) {
    	
    	System.out.println("asdfasdf5명+");
        try (SqlSession session = getSession()) {
            return notificationDAO.countUnreadNotifications(session, memberId);
        }
    }

    // 알림 읽음 처리
    public void markNotificationsAsRead(String memberId) {
    	System.out.println("asdfasSystem.out.println(\"asdfasdf5명+\");df5명+");
        try (SqlSession session = getSession()) {
            notificationDAO.markNotificationsAsRead(session, memberId);
        }
    }

    // 알림 생성 및 실시간 전송
    public void createNotification(String memberId, String type, String content) {
        
    	System.out.println("asdfasSystem.out.createNotification(\"asdfasdf5명+\");df5명+");
    	try (SqlSession session = getSession()) {
            notificationDAO.insertNotification(session, memberId, "알림", "너됨");
            NotificationWebSocket.sendNotification(memberId, content);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

