package com.lecture.mypage.model.dao;

import org.apache.ibatis.session.SqlSession;

public class MyLectureDao {
	public class LectureDAO {
	    public String registerDetailLecture(SqlSession session, String category, String title, String content, String tags) {
	        return session.selectOne("LectureMapper.insertLecture", new LectureDTO(category, title, content, tags));
	    }
	}

	public void registerDetailLecture(SqlSession session, String lectureNo, String category, String title,
			String instructorintro) {
		
		
	}
}
