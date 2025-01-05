package com.lecture.review.model.service;

import static com.lecture.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

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
	    
	    public int isLiked(String lectureNo, String memberNo) {
	        SqlSession session = getSession();
	        int isLiked = 0;
	        try {
	           isLiked = dao.checkIfLiked(session, lectureNo, memberNo);
	        } finally {
	            session.close();
	        }
	        return isLiked;
	    }
	    
	    
	    public int getLikeCount(String lectureNo) {
	        SqlSession session = getSession();
	        try {
	            return dao.getLikeCount(session, lectureNo);
	        } finally {
	            session.close();
	        }
	    }
	    
	    
	    public int toggleLike(String lectureNo, String memberNo) {
	        SqlSession session = getSession();
	        try {
	            boolean isLiked = dao.isLiked(session, lectureNo, memberNo);
	            if (isLiked) {
	                int result2=dao.removeLike(session, lectureNo, memberNo);
	                if(result2>0) {
	                	result2=dao.decreseLike(session, lectureNo);
	                	if(result2>0) {
	                		session.commit();
	                		return 0;
	                	}
	                	else session.rollback();
	                }else {
	                	session.rollback();
	                }
	            } else {
	                int result2=dao.addLike(session, lectureNo, memberNo);
	                if(result2>0) {
	                	result2=dao.increaseLikeCount(session, lectureNo);
	                	if(result2>0) {
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
	    
	}


