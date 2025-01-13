package com.univora.common.alert.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.univora.common.alert.model.service.NotificationService;
import com.univora.login.model.dto.Member;

/**
 * Servlet implementation class UnreadNotificationCountServlet
 */
@WebServlet("/notificatoin/getUnreadNotificationCount.do")
public class UnreadNotificationCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NotificationService notificationService = new NotificationService();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UnreadNotificationCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session  = request.getSession();
		
		Member user = (Member) session.getAttribute("loginMember");
    	
    	
        String memberId = user.getMemberId();
        
//        if (user == null) {
//            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
//            response.getWriter().write("Unauthorized: User not logged in.");
//            return;
//        }

        int unreadCount = notificationService.getUnreadNotificationCount(user.getMemberId());
        response.setContentType("application/json");
        response.getWriter().write(String.valueOf(unreadCount));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
