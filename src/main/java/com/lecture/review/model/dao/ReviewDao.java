package com.lecture.review.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.lecture.model.dto.Review;

public class ReviewDao {
	
	    public int insertReview(SqlSession session, Review review) {
	        return session.insert("review.insertReview", review);
	    }


	
}
