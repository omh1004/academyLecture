package com.lecture.review.model.service;

import static com.lecture.common.SqlSessionTemplate.getSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lecture.common.alert.model.dao.NotificationDAO;
import com.lecture.common.alert.model.service.NotificationService;
import com.lecture.common.alert.websocket.NotificationWebSocket;
import com.lecture.model.dao.NotificationDao;
import com.lecture.model.dto.Review;
import com.lecture.review.model.dao.ReviewDao;
	
public class ReviewService {

	private ReviewDao dao = new ReviewDao();

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
	                		session.commit();
	                		return 1;
	                	}
	                	else session.rollback();
	                }else {
	                	session.rollback();
	                }
	            }
	            new NotificationService().createNotification("user444", "알림", "좋아요를 날렸습니다.");
	           
	            NotificationWebSocket.sendNotification("user555", "새로운 알림이 도착했습니다. ");
	            
	            return 2;
	        } catch (Exception e) {
	        	e.printStackTrace();
	            session.rollback();
	            return 2;
	        } finally {
	            session.close();
	        }
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
	    
	    
	}


