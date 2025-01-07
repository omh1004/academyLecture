package com.lecture.common.alert.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class NotificationDAO {

	

    public int insertNotification(SqlSession session, String memberId, String type, String content) {
        return session.insert("NotificationMapper.insertNotification", Map.of(
            "memberId", memberId,
            "type", type,
            "content", content
        ));
    }

    public int countUnreadNotifications(SqlSession session, String memberId) {
        return session.selectOne("NotificationMapper.countUnreadNotifications", memberId);
    }

    public void markNotificationsAsRead(SqlSession session, String memberId) {
        session.update("NotificationMapper.markNotificationsAsRead", memberId);
    }

    public List<Map<String, Object>> selectNotificationsByMemberId(SqlSession session, String memberId) {
        return session.selectList("NotificationMapper.selectNotificationsByMemberId", memberId);
    }
}
