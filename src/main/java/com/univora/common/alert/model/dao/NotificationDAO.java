package com.univora.common.alert.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.univora.common.alert.model.dto.Notification;

import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class NotificationDAO {

	// 읽지 않은 알림 개수 조회
	public int countUnreadNotifications(SqlSession session, String memberId) {
		return session.selectOne("notification.countUnreadNotifications", memberId);
	}

	// 알림 읽음 처리
	public int markNotificationsAsRead(SqlSession session, String memberId) {
		return session.update("notification.markNotificationsAsRead", memberId);
	}

	// 알림 생성
	public int insertNotification(SqlSession session, String memberId, String type, String content) {
		return session.insert("notification.insertNotification",
				Map.of("memberId", memberId, "type", type, "content", content));
	}

	public List<Notification> selectAlert(SqlSession session, String memberId) {
		return session.selectList("notification.selectAlert",memberId);
	}
}
