package com.lecture.common.alert.websocket;

import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket/{userId}")
public class WebSocketEndpoint {

	 private static final CopyOnWriteArraySet<WebSocketEndpoint> connections = new CopyOnWriteArraySet<>();
	    private Session session;
	    private String userId;

	    @OnOpen
	    public void onOpen(Session session, @PathParam("userId") String userId) {
	        this.session = session;
	        this.userId = userId;
	        connections.add(this);
	        System.out.println("sessionUserid"+session+userId);
	    }

	    @OnClose
	    public void onClose() {
	        connections.remove(this);
	    }

	    @OnMessage
	    public void onMessage(String message) {
	    	
	        System.out.println("Message from " + userId + ": " + message);
	    }

	    @OnError
	    public void onError(Throwable error) {
	    	System.out.println("Message from " + userId);
	        error.printStackTrace();
	    }

	    public static void sendNotification(String userId, String message) throws IOException {
	        for (WebSocketEndpoint connection : connections) {
	            if (connection.userId.equals(userId)) {
	                connection.session.getBasicRemote().sendText(message);
	            }
	        }
	    }

		public static void sendNotification(String userId, String string, String content) {
	        for (WebSocketEndpoint connection : connections) {
	            if (connection.userId.equals(userId)) {
	                try {
						connection.session.getBasicRemote().sendText(content);
					} catch (IOException e) {
						e.printStackTrace();
					}
	            }
	        }
			
		}

}
