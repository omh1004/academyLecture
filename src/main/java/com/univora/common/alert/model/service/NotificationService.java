package com.univora.common.alert.model.service;
import static com.univora.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.univora.common.alert.model.dao.NotificationDAO;
import com.univora.common.alert.websocket.NotificationWebSocket;
import com.univora.review.model.dto.Review;

public class NotificationService {

    private  NotificationDAO notificationDAO = new NotificationDAO();

    // 읽지 않은 알림 개수 가져오기
    public int getUnreadNotificationCount(String memberId) {
    	
        try (SqlSession session = getSession()) {
            return notificationDAO.countUnreadNotifications(session, memberId);
        }
    }

    // 알림 읽음 처리
    public void markNotificationsAsRead(String memberId) {
        try (SqlSession session = getSession()) {
            notificationDAO.markNotificationsAsRead(session, memberId);
        }
    }

    // 알림 생성 및 실시간 전송
    public void createNotification(String memberId, String type, String content) {
    	
    	System.out.println("아이디"+memberId+"타입"+type+"컨텐츠"+content);
        
    	//알림 타입 두개: 학생이 리뷰를 남긴것과 강사가 좋아요나, 리뷰에 대한 답글을 달았을때,
    	//type으로 나누자!
    	
    	System.out.println("type:::"+type);
    	//1. 학생이 리뷰 :review
    			//학생이 리뷰를 썻으니까, 리뷰를 쓴 강사한테 값이 가야함
    			//넘어오는값 
    			//type : review
    			//service에서 넘어오는 정보는 memberNo 그래서 memberno를 가지고 , 
    			//Users 정보를 가져와서 뿌린다.
    			
    			//content : 글내용 
    			//XX 학생이 '강의명'에  리뷰를 남겼습니다. 
    	
    			//가져와야 하는 값 리뷰 등록 시, 로직 확인
    			// 리뷰등록
    			// ReviewService.insertReview(Review)
    			// 파라미터 Review객체에서 어떤값을 가져오는지 확인 
    	
    			//InsertReviewServlet에서 , 파라매터 값으로, lectureNo와 ,
    			//StudentNo를 가져오므로, Lecture


    			//content 
    	/////////////// 구현 못함 
    	
    	//2. 강사가 좋아요 : like
    			//강사가 리뷰에 좋아요를 선택했다면, 해당 수강평의 학생에게 알림을 보낸다.
    			//XX 강사님이 '강의명'수강평에 좋아요를 남겼습니다.
    			// 단! 좋아요를 해제했을떄는 알림을 하지 않는다. 
    	//3. 리뷰에 강사가 답글 : answer
    	// 넘어오는 데이터, 받는 대상이 넘어와야함.
    	// ex) 작성하신 [받아온 강의명] 강의에 강사님의 답글이 달렸습니다.  
    	
    	
    
    	try (SqlSession session = getSession()) {
            notificationDAO.insertNotification(session, memberId, type, content);
            NotificationWebSocket.sendNotification(memberId, content);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

