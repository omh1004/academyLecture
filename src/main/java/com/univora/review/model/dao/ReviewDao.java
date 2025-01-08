package com.univora.review.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.univora.review.model.dto.Review;

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
	    public int checkIfLiked(SqlSession session, String reviewNo, String memberNo) {
	        int likeCount = session.selectOne("review.checkIfLiked", 
	            Map.of("reviewNo", reviewNo, "memberNo", memberNo));
	        return likeCount;
	    }
	    
	    public int getLikeCount(SqlSession session, String reviewNo) {
	        return session.selectOne("review.getLikeCount", reviewNo);
	    }
	    
	    
	    public boolean isLiked(SqlSession session, String reviewNo, String memberNo) {
	        // MyBatis를 사용하여 좋아요 여부 확인
	        Integer count = session.selectOne("review.isLiked", Map.of("reviewNo", reviewNo, "memberNo", memberNo));
	        return count != null && count > 0;
	    }
	    
	    
	    public int removeLike(SqlSession session, String reviewNo, String memberNo) {
	        // 좋아요 삭제 로직
	        return session.delete("review.removeLike", Map.of("reviewNo", reviewNo, "memberNo", memberNo));
	        
	    }
	    
	    public int decreseLike(SqlSession session, String lectureNo) {
	    	return session.update("review.decreaseLikeCount", lectureNo);
	    }
	    
	    
	    public int addLike(SqlSession session, String reviewNo, String memberNo) {
	        // 좋아요 추가 로직
	        return session.insert("review.addLike", Map.of("reviewNo", reviewNo, "memberNo", memberNo));
	        
	    }
	    
	    
	    public int increaseLikeCount(SqlSession session, String lectureNo) {
	    	return session.update("review.increaseLikeCount", lectureNo);
	    }
	    
	    
	    public int deleteReview(SqlSession session, String reviewNo) {
	        return session.update("review.deleteReview", reviewNo);
	    }

	    
	    // 작성한 수강평을 가져오자!
	    public List<Review> getUserReviews(SqlSession session, String studentNo) {
	        return session.selectList("review.getUserReviews", studentNo);
	    }


	    
	    
}
