package com.lecture.common.alert.model.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.lecture.model.dto.Notification;

public class NotificationDAO {

	
	public void insertNotification(SqlSession session, Notification notification) {
			session.insert("NotificationMapper.insertNotification", notification);
	}

	public List<Notification> getUnreadNotifications(SqlSession session, String userId) {
			return session.selectList("NotificationMapper.getUnreadNotifications", userId);
	}

	public void markAsRead(SqlSession session, String id) {
			session.update("NotificationMapper.markAsRead", id);
	}
}
