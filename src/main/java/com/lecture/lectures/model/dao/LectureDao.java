package com.lecture.lectures.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lecture.model.dto.Lectures;
import com.lecture.model.dto.Review;

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
    		
    	 List<Review> reviews = session.selectList("lecture.selectLectureReviews", lectureNo);
    	    
    	    return reviews;
    }

    // 강좌 검색
    public List<Lectures> searchLectures(SqlSession session, String query) {
        return session.selectList("lecture.searchLectures", query);
    }
    
    
    // 장바구니 담기 클릭시 수강바구니 추가
    public int insertLectureToBasket(SqlSession session, String lectureNo, String memberNo) {
        Map<String, String> params = new HashMap<>();
        params.put("lectureNo", lectureNo);
        params.put("memberNo", memberNo);
        return session.insert("lecture.insertLectureToBasket", params);
    }
    
}
