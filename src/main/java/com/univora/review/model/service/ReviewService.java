package com.univora.review.model.service;

import static com.univora.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.univora.common.alert.model.service.NotificationService;
import com.univora.review.model.dao.ReviewDao;
import com.univora.review.model.dto.Review;
	
public class ReviewService {

	private ReviewDao dao = new ReviewDao();
	private NotificationService notificationService = new NotificationService();

	// 댓글 DB에 insert!!
	    public int insertReview(Review review) {
	    		    	
	        SqlSession session = getSession();
	        
	        int result = 0;
	        try {
	            result = dao.insertReview(session, review);
	            if (result > 0) {
	            	session.commit();
	            } else {
	            	session.rollback();
	            }
	        } finally {
	        	session.close();
	        }
	        return result;
	    }
	    
	// 대댓글(답글) DB에 insert!!
	    
	    public int insertReply(Review reply) {
	    	
	    	SqlSession session = getSession();
	    	
	        int result = dao.insertReply(session, reply);
	        if (result > 0) {
	        	
	        	System.out.println("reply.getReviewNo()::"+reply.getReviewNo());
	        	
	        	String reviewNo =   reply.getParentReviewNo();
	        	
	        Map<String,Object> alertInfo = 	selectReviewAuthor(reviewNo);
	        //alertInfo : {TEACHERNAME=as, MEMBERID=user555, CLASSNAME=ㅁㅇㄴㄹ}
    		String memberId = (String)alertInfo.get("MEMBERID");
    		String className = (String)alertInfo.get("CLASSNAME");
    		String teacherName = (String)alertInfo.get("TEACHERNAME");
    		
    		// ex) 작성하신 [받아온 강의명] 강의에 강사님의 답글이 달렸습니다.  
    		
    		String content = memberId+ " 강사님이 [강의명 : "+className
    				+"] 강의에 강사님의 답글이 달렸습니다.";
    		
    		
    		notificationService.createNotification(memberId, "답글", content);
	        	
	        	session.commit();
	        } else {
            	session.rollback();
	        }
	        session.close();
	        return result;
	    }
	    
	    
	// review테이블에서 강의 점수 가져오기
	    
	    public double getAverageRating(String lectureNo) {
	    	
	    	SqlSession session = getSession();
	    	
	    	double avg = dao.getAverageRating(session, lectureNo);
	        
	    	if (avg > 0) {
	        	session.commit();
	        } else {
            	session.rollback();
	        }
	        session.close();
	        
	        return avg;
	    }
	    
	    // 좋아요 기능 구현!
	    
	    public int isLiked(String reviewNo, String memberNo) {
	        SqlSession session = getSession();
	        int isLiked = 0;
	        try {
	           isLiked = dao.checkIfLiked(session, reviewNo, memberNo);
	        } finally {
	            session.close();
	        }
	        return isLiked;
	    }
	    
	    
	    public int getLikeCount(String reviewNo) {
	        SqlSession session = getSession();
	        try {
	            return dao.getLikeCount(session, reviewNo);
	        } finally {
	            session.close();
	        }
	    }
	    
	    
	    public int toggleLike(String reviewNo, String memberNo) {
	        SqlSession session = getSession();
	        try {
	            boolean isLiked = dao.isLiked(session, reviewNo, memberNo);

	            if (isLiked) {
	                int result2=dao.removeLike(session, reviewNo, memberNo);
	                if(result2>0) {
	                	result2=dao.decreseLike(session, reviewNo);
	                	if(result2>0) {
	                		session.commit();
	                		return 0;
	                	}
	                	else session.rollback();
	                }else {
	                	session.rollback();
	                }
	            } else {
	                int result2=dao.addLike(session, reviewNo, memberNo);
	                if(result2>0) {
	                	result2=dao.increaseLikeCount(session, reviewNo);
	                	if(result2>0) {
	                		//좋아요를 눌렀을 시, 좋아요를 받은 
	                		//수강평을 작성한 작성자에게 좋아요를 눌렀다는 알림이 가야한다.
	                		//필요한 데이터, 받는사람 id, 알림타입, 알림 내용
	                		//받는사람id reviewNo로 reviewNo를 가지고 가서 , 
	                		//review 테이블에 studentNo를 가지고, 작성자정보, 강의명을 가져온다. 
	                		//좋아요를 한 강사명을 가져온다. 
	                		
	                		//ReviewService에 lectureNo를 가지고, review작성자id와 강의명,강사명을 가져오는 
	                		//service 메소드를 만든다.
	                		Map<String,Object> alertInfo = selectReviewAuthor(reviewNo);
	                		
	                		System.out.println("alertInfo : "+alertInfo);
	                		
	                		String memberId = (String)alertInfo.get("MEMBERID");
	                		String className = (String)alertInfo.get("CLASSNAME");
	                		String teacherName = (String)alertInfo.get("TEACHERNAME");
	                		
	                		String content = teacherName+ " 강사님이 [강의명 : "+className
	                				+"] 수강평에 좋아요를 남겼습니다.";
	                		
	                		
	                		notificationService.createNotification(memberId, "좋아요", content);
	                		
	                		session.commit();
	                		return 1;
	                	}
	                	else session.rollback();
	                }else {
	                	session.rollback();
	                }
	            }
	            return 2;
	        } catch (Exception e) {
	        	e.printStackTrace();
	            session.rollback();
	            return 2;
	        } finally {
	            session.close();
	        }
	    }
	    
	    
	    // 댓글 논리적 삭제
	

		public boolean deleteReview(String reviewNo) {
	        SqlSession session = getSession();
	        try {
	            int result = dao.deleteReview(session, reviewNo);
	            if (result > 0) { // 성공적으로 삭제되었는지 확인
	                session.commit();
	                return true;
	            } else {
	                session.rollback();
	                return false;
	            }
	        } finally {
	            session.close();
	        }
	    }
	    
	    
	    
	    public List<Review> getUserReviews(String studentNo) {
	        SqlSession session = getSession();
	        List<Review> reviews = null;
	        try {
	            reviews = dao.getUserReviews(session, studentNo);
	        } finally {
	            session.close();
	        }
	        return reviews;
	    }

	    public boolean deleteParentReview(String reviewNo) {
	        SqlSession session = getSession();
	        boolean result = false;

	        try {
	            // 부모 댓글 삭제 (is_deleted = 'Y')
	            int parentUpdate = dao.updateIsDeletedFlag(session, reviewNo);

	            // 관련 자식 댓글 삭제 (is_deleted = 'Y')
	            int childUpdate = dao.updateChildReviewsFlag(session, reviewNo);

	            if (parentUpdate > 0 && childUpdate >= 0) {
	                session.commit();
	                result = true;
	            } else {
	                session.rollback();
	            }
	        } finally {
	            session.close();
	        }

	        return result;
	    }
	    
	    public String deleteReviewAndGetPostId(String reviewNo) {
	        SqlSession session = getSession();
	        String lectureNo = null;

	        try {
	            // 리뷰가 연결된 게시글 ID (lectureNo) 가져오기
	            lectureNo = new ReviewDao().getLectureNoByReviewNo(session, reviewNo);

	            // 리뷰 삭제 수행
	            int result = new ReviewDao().deleteReview(session, reviewNo);

	            if (result > 0) {
	                session.commit();
	            } else {
	                session.rollback();
	                lectureNo = null;
	            }
	        } finally {
	            session.close();
	        }

	        return lectureNo; // 게시글 ID 반환
	    }
	    
	    // 수강평 수정
	    
	    public Review getReviewById(String reviewNo) {
	        SqlSession session = getSession();
	        Review review = dao.getReviewById(session, reviewNo);
	        session.close();
	        return review;
	    }
	    
	    // 수강평 수정
	    public boolean updateReview(String reviewNo, String reviewContent) {
	        SqlSession session = getSession();
	        boolean isSuccess = false;

	        try {
	            int result = dao.updateReview(session, reviewNo, reviewContent);
	            if (result > 0) {
	                session.commit();
	                isSuccess = true;
	            } else {
	                session.rollback();
	            }
	        } finally {
	            session.close();
	        }

	        return isSuccess;
	    }
	    
	    
	    //리뷰작성자정보 가져오는 메소드 
	    private Map<String, Object> selectReviewAuthor(String reviewNo) {
			SqlSession session = getSession();
    		//좋아요를 눌렀을 시, 좋아요를 받은 
    		//수강평을 작성한 작성자에게 좋아요를 눌렀다는 알림이 가야한다.
    		//필요한 데이터, 받는사람 id, 알림타입, 알림 내용
    		//받는사람id reviewNo로 reviewNo를 가지고 가서 , 
    		//review 테이블에 studentNo를 가지고, 작성자정보, 강의명을 가져온다. 
    		//좋아요를 한 강사명을 가져온다. 
    		
    		//ReviewService에 lectureNo를 가지고, review작성자id와 강의명,강사명을 가져오는 
    		//service 메소드를 만든다.
			
			System.out.println("리뷰no넘어오냐?::::"+reviewNo);
			
			Map<String, Object> result = dao.selectReviewAuthor(session,reviewNo);

			return result;
		}
	}


