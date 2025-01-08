package com.univora.common.alert.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class NotificationDAO {

	

    public int insertNotification(SqlSession session, String memberId, String type, String content) {
    	System.out.println("durlemfdjdhsl??");
        return session.insert("notification.insertNotification", Map.of(
            "memberId", memberId,
            "type", type,
            "content", content
        ));
    }

    public int countUnreadNotifications(SqlSession session, String memberId) {
        return session.selectOne("notification.countUnreadNotifications", memberId);
    }

    public void markNotificationsAsRead(SqlSession session, String memberId) {
        session.update("notification.markNotificationsAsRead", memberId);
    }

    public List<Map<String, Object>> selectNotificationsByMemberId(SqlSession session, String memberId) {
        return session.selectList("notification.selectNotificationsByMemberId", memberId);
    }
}
