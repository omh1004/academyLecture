package com.univora.common.alert.websocket;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/notification-websocket/{memberId}")
public class NotificationWebSocket {

	private static final Map<String, Session> clients = new ConcurrentHashMap<>();

	@OnOpen
	public void onOpen(Session session, @PathParam("memberId") String memberId) {
		
		System.out.println("웹소켓 오픈되1냐????");
		
		clients.put(memberId, session);
	}

	@OnClose
	public void onClose(Session session, @PathParam("memberId") String memberId) {
		
		System.out.println("웹소켓 오픈2되냐????");
		clients.remove(memberId);
	}

	public static void sendNotification(String memberId, String message) {
		
		System.out.println("웹소켓 오픈되냐????");
		Session session = clients.get(memberId);
		if (session != null && session.isOpen()) {
			try {
				session.getBasicRemote().sendText(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
