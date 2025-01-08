package com.univora.lectures.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.univora.lectures.model.dto.Lectures;
import com.univora.lectures.model.dto.Review;

public class LectureDao {

	 public List<Lectures> selectAllLectures(SqlSession session) {
	        // MyBatis Mapper 호출
	        return session.selectList("lecture.selectAllLectures");
	    }


	  // 강좌 상세 조회
    public Lectures selectLectureDetail(SqlSession session, String lectureNo) {
	        // MyBatis Mapper 호출
	        return session.selectOne("lecture.selectLectureDetail", lectureNo);
	    }
	
    
    public List<Review> selectLectureReviews(SqlSession session, String lectureNo) {
        // MyBatis 매퍼 쿼리를 통해 데이터 가져오기
    		System.out.println("lectureNo에서 가져온 리뷰: " + lectureNo);
    	 List<Review> reviews = session.selectList("lecture.selectLectureReviews", lectureNo);
    	    System.out.println("DAO에서 가져온 리뷰: " + reviews);
    	    return reviews;
    }

    // 강좌 검색
    public List<Lectures> searchLectures(SqlSession session, String query) {
        return session.selectList("lecture.searchLectures", query);
    }
    

}
