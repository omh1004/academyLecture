package com.lecture.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lecture.common.alert.utils.EmailSender;
import com.lecture.common.alert.websocket.WebSocketEndpoint;
import com.lecture.model.dao.NotificationDao;
import com.lecture.model.dto.Notification;

/**
 * Servlet Filter implementation class NotificationFilter
 */
@WebFilter("/*") // 모든 요청에 대해 Filter 실행
public class NotificationFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public NotificationFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	@Override
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        String requestURI = request.getRequestURI();
        
        
        System.out.println("request::: "+requestURI);

        // 알림 트리거 조건
        if (requestURI.equals("/univora/login/login.do")) { // 특정 요청 경로
        	
        	System.out.println("여기들어오냐!!!!");
        	
            String userId = "user444";
            String content = "You have a new notification triggered by your action.";

            // DB에 알림 저장
            Notification notification = new Notification();
            notification.setUserId(userId);
            notification.setType("action_triggered");
            notification.setContent(content);
            NotificationDao.saveNotification(notification);

            WebSocketEndpoint.sendNotification(
			    userId,
			    content
			);

            // 이메일로 알림 전송
            String recipientEmail = "ohchef2020@gmail.com"; // 실제 사용자 이메일로 변경
            String emailSubject = "임시구글이메일전송";
            String emailContent = "Univora에 로그인하셨습니다. :\n\n" + content;
            EmailSender.sendEmail(recipientEmail, emailSubject, emailContent);
        }

        // 요청을 계속 처리
        chain.doFilter(request, response);
    }

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
