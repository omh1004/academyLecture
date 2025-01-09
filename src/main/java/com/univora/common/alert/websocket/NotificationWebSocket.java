package com.univora.common.alert.websocket;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

// WebSocket 엔드포인트 (컨텍스트 경로는 클라이언트에서 설정)
@ServerEndpoint("/notification-websocket/{memberId}")
public class NotificationWebSocket {

    private static final Map<String, Session> clients = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("memberId") String memberId) {
        clients.put(memberId, session);
        System.out.println("WebSocket 연결 성공: " + memberId);
    }

    @OnClose
    public void onClose(Session session, @PathParam("memberId") String memberId) {
        clients.remove(memberId);
        System.out.println("WebSocket 연결 종료: " + memberId);
    }

    public static void sendNotification(String memberId, String message) {
        Session session = clients.get(memberId);
        if (session != null && session.isOpen()) {
            try {
                session.getBasicRemote().sendText(message);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("WebSocket 세션이 닫혀 있거나 연결되지 않음: " + memberId);
        }
    }
}
