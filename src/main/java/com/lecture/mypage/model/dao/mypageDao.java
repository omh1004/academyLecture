package com.lecture.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.lecture.mypage.model.dto.Schedule;
import com.lecture.mypage.model.dto.User;

public class mypageDao {

	public User getUserProfile(SqlSession session, String loginId) {
		return session.selectOne("mypage.getUserProfile", loginId);
	}

	public List<Schedule> selectMyopenLectureByCalender(SqlSession session, Map<String, String> daily) {
		return session.selectList("mypage.selectMyopenLectureByCalender", daily);
	}
	
}
