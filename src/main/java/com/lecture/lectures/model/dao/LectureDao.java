package com.lecture.lectures.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.lecture.model.dto.Enrollment;
import com.lecture.model.dto.Lectures;

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
	
    
    public List<Enrollment> selectLectureReviews(SqlSession session, String lectureNo) {
        return session.selectList("lecture.selectLectureReviews", lectureNo);
    }

    
}
