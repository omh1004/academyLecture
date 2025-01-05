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
	    
	    
	    
	}


