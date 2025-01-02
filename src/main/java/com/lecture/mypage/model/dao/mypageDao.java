package com.lecture.mypage.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.lecture.mypage.model.dto.User;

public class mypageDao {

	public User getUserProfile(SqlSession session, String loginId) {
		return session.selectOne("mypage.getUserProfile", loginId);
	}
}
