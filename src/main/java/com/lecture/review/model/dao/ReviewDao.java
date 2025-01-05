package com.lecture.review.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lecture.model.dto.Review;

public class ReviewDao {
	
	    public int insertReview(SqlSession session, Review review) {
	        return session.insert("review.insertReview", review);
	    }

	    
	    // 대댓글 처리
	    public int insertReply(SqlSession session, Review reply) {
	        return session.insert("review.insertReply", reply);
	    }
	    
	    // 강의 점수 가져오기
	    public double getAverageRating(SqlSession session, String lectureNo) {
	        return session.selectOne("review.getAverageRating", lectureNo);
	    }
	    
	    // 좋아요 기능 구현
	    public int checkIfLiked(SqlSession session, String lectureNo, String memberNo) {
	        int likeCount = session.selectOne("review.checkIfLiked", 
	            Map.of("lectureNo", lectureNo, "memberNo", memberNo));
	        return likeCount;
	    }
	    
	    public int getLikeCount(SqlSession session, String lectureNo) {
	        return session.selectOne("review.getLikeCount", lectureNo);
	    }
	    
}
